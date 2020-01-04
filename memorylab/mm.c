/*
 * 2015-11323_mm.c - The fastest, memory-efficient malloc.
 *
 * The malloc/free implementation is from textbook.
 * csapp 3e
 * The AVL tree implementation is from my last semester's data structure HW.
 * https://github.com/ulgal/DataStructure2019/blob/master/HW5/UgAVLTreeNode.java
 * 
 * In this approach, the free block is managed by AVL tree.
 * The free block contains header, footer, parent, left child, right child, left height and right height.
 * So it needs 28 bytes, but to adjust 8 alignment minimum block size is 32.
 * When init, it looks like
 * -----------------------
 * |Tree Dummy Header    | Tree Dummy Header holds AVL Tree root address
 * -----------------------
 * |Prologue Header      | 8/1
 * -----------------------
 * |Prologue Footer      | 8/1
 * -----------------------
 * |Epilogue Block Header| 0/1
 * -----------------------
 * Most of feature is same with textbook. 
 * Without global or static data structure, we need a pointer to hold tree root address.
 * I use first padding to holds Tree root address.
 * And free block looks like
 * -----------------------
 * |Header         |0|0|F| Header holds Size, Size is aligned to 8 bytes, so we don't need last 3 bit. LSB is Allocated bit(flag).
 * -----------------------
 * |Parent Address       |
 * -----------------------
 * |Left Child Address   |
 * -----------------------
 * |Right Child Address  |
 * -----------------------
 * |Left Height Address  |
 * -----------------------
 * |Right Height Address |
 * -----------------------
 * |Padding              |
 * -----------------------
 * |Footer         |0|0|F|
 * -----------------------
 * The blocks holds left height and right height for convenience.
 * mm_check is for find memory leak. 
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/**********************************************************
 * NOTE TO STUDENTS : Before you do anything else, please  *
 * provide  your  information  in the  following  struct. *
 **********************************************************/
team_t team = {
    /* Your full name */
    "Seongmin Park",
    /* Your student ID */
    "2015-11323"};

/* DON'T MODIFY THIS VALUE AND LEAVE IT AS IT WAS */
static range_t **gl_ranges;

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT - 1)) & ~0x7)

#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

/*
 * remove_range - manipulate range lists
 * DON'T MODIFY THIS FUNCTION AND LEAVE IT AS IT WAS
 */
static void remove_range(range_t **ranges, char *lo)
{
    range_t *p;
    range_t **prevpp = ranges;

    if (!ranges)
        return;

    for (p = *ranges; p != NULL; p = p->next)
    {
        if (p->lo == lo)
        {
            *prevpp = p->next;
            free(p);
            break;
        }
        prevpp = &(p->next);
    }
}

/* Basic consatnsts and macros from textbook start */

#define WSIZE 4             /* Word and header/footer size (bytes) */
#define DSIZE 8             /* Double word size (bytes) */
#define CHUNKSIZE (1 << 12) /* Extend heap by this amount (bytes) */

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define MIN(x, y) ((x) < (y) ? (x) : (y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp)-WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp)-GET_SIZE(((char *)(bp)-DSIZE)))

/* Basic consatnsts and macros from textbook end */

/* AVLTree consatnsts and macros start */

#define MIN_BLOCK_SIZE 32 // when allocate new block, we need just 7 but align with even number

/* Address macro */
#define HEADER_ADDR(bp) ((char *)(bp)-4)
#define PARENT_ADDR(bp) ((char *)(bp))
#define LEFT_CHILD_ADDR(bp) ((char *)(bp) + 4)
#define RIGHT_CHILD_ADDR(bp) ((char *)(bp) + 8)
#define LEFT_HEIGHT_ADDR(bp) ((char *)(bp) + 12)
#define RIGHT_HEIGHT_ADDR(bp) ((char *)(bp) + 16)
#define FOOTER_ADDR(bp) ((char *)(bp) + GET_SIZE(HEADER_ADDR(bp)) - DSIZE)

/* Get macro */
#define GET_NODE_SIZE(bp) ((*(unsigned int *)((char *)(bp)-4)) & ~0x7)
#define GET_PARENT(bp) (*(unsigned int *)(bp))
#define GET_LEFT_CHILD(bp) (*(unsigned int *)((char *)(bp) + 4))
#define GET_RIGHT_CHILD(bp) (*(unsigned int *)((char *)(bp) + 8))
#define GET_LEFT_HEIGHT(bp) (*(unsigned int *)((char *)(bp) + 12))
#define GET_RIGHT_HEIGHT(bp) (*(unsigned int *)((char *)(bp) + 16))
#define GET_HEIGHT(bp) (MAX(GET_LEFT_HEIGHT(bp), GET_RIGHT_HEIGHT(bp)))
#define GET_MIN_HEIGHT(bp) (MIN(GET_LEFT_HEIGHT(bp), GET_RIGHT_HEIGHT(bp)))
#define GET_DIF(bp) (GET_HEIGHT(bp) - GET_MIN_HEIGHT(bp))

/* Set macro */
#define SET_NODE_SIZE(bp, val) (*(unsigned int *)(((char *)(bp)-4)) = (val))
#define SET_PARENT(bp, val) (*(unsigned int *)(((char *)(bp))) = (val))
#define SET_LEFT_CHILD(bp, val) (*(unsigned int *)(((char *)(bp) + 4)) = (val))
#define SET_RIGHT_CHILD(bp, val) (*(unsigned int *)(((char *)(bp) + 8)) = (val))
#define SET_LEFT_HEIGHT(bp, val) (*(unsigned int *)(((char *)(bp) + 12)) = (val))
#define SET_RIGHT_HEIGHT(bp, val) (*(unsigned int *)(((char *)(bp) + 16)) = (val))

/* has? macro */
#define HAS_LEFT_CHILD(bp) (((*(unsigned int *)((char *)(bp) + 4)) != NULL) ? 1 : 0)
#define HAS_RIGHT_CHILD(bp) (((*(unsigned int *)((char *)(bp) + 8)) != NULL) ? 1 : 0)
#define HAS_CHILD(bp) ((((*(unsigned int *)((char *)(bp) + 4))) == NULL && (*(unsigned int *)((char *)(bp) + 8)) == NULL) ? 0 : 1)
#define HAS_PARENT(bp) (((*(unsigned int *)(bp)) != NULL) ? 1 : 0)

/* AVLTree consatnsts and macros end */

void *tree_dummy_header;

/* AVLTree function */

/* set function */
static void set_left_child(void *target, void *source)
{
    SET_LEFT_CHILD(target, source);
    if (source != NULL)
    {
        SET_PARENT(source, target);
        SET_LEFT_HEIGHT(target, GET_HEIGHT(source) + 1);
    }
    else
    {
        SET_LEFT_HEIGHT(target, 0);
    }
}

static void set_right_child(void *target, void *source)
{
    SET_RIGHT_CHILD(target, source);
    if (source != NULL)
    {
        SET_PARENT(source, target);
        SET_RIGHT_HEIGHT(target, GET_HEIGHT(source) + 1);
    }
    else
    {
        SET_RIGHT_HEIGHT(target, 0);
    }
}
static void set_node(void *target, void *source, int flag)
{
    void *parent = GET_PARENT(target);
    if (flag == 0)
    {
        if (parent == tree_dummy_header)
        {
            PUT(parent, source);
        }
        else if (GET_LEFT_CHILD(parent) == target)
        {
            set_left_child(parent, source);
        }
        else
        {
            set_right_child(parent, source);
        }
    }
    else if (flag == 1)
    {
        if (parent == tree_dummy_header)
        {
            PUT(parent, source);
            SET_PARENT(source, parent);
        }
        else if (GET_LEFT_CHILD(parent) == target)
        {
            set_left_child(parent, source);
        }
        else
        {
            set_right_child(parent, source);
        }
    }
    else
    {
        void *target_left = GET_LEFT_CHILD(target);
        void *target_right = GET_RIGHT_CHILD(target);
        set_left_child(source, target_left);
        if (target_right != source)
        {
            set_right_child(source, target_right);
        }
        if (parent == tree_dummy_header)
        {
            PUT(parent, source);
            SET_PARENT(source, parent);
        }
        else if (GET_LEFT_CHILD(parent) == target)
        {
            set_left_child(parent, source);
        }
        else
        {
            set_right_child(parent, source);
        }
    }
}

/* rotate function to adjust height balance */
static void *rotate_right(void *bp)
{

    void *ret_node = GET_LEFT_CHILD(bp);
    void *parent = GET_PARENT(bp);
    SET_PARENT(ret_node, parent);
    if (parent == tree_dummy_header)
    {
        PUT(tree_dummy_header, ret_node);
    }
    else if (GET_LEFT_CHILD(parent) == bp)
    {
        SET_LEFT_CHILD(parent, ret_node);
    }
    else
    {
        SET_RIGHT_CHILD(parent, ret_node);
    }
    set_left_child(bp, GET_RIGHT_CHILD(ret_node));
    set_right_child(ret_node, bp);
    return ret_node;
}

static void *rotate_left(void *bp)
{
    void *ret_node = GET_RIGHT_CHILD(bp);
    void *parent = GET_PARENT(bp);
    SET_PARENT(ret_node, parent);
    if (parent == tree_dummy_header)
    {
        PUT(tree_dummy_header, ret_node);
    }
    else if (GET_LEFT_CHILD(parent) == bp)
    {
        SET_LEFT_CHILD(parent, ret_node);
    }
    else
    {
        SET_RIGHT_CHILD(parent, ret_node);
    }
    set_right_child(bp, GET_LEFT_CHILD(ret_node));
    set_left_child(ret_node, bp);
    return ret_node;
}

/* Adjust Tree balance */
static void set_tree(void *target)
{
    if (target == tree_dummy_header)
    {
        return;
    }
    if (HAS_LEFT_CHILD(target))
    {
        SET_LEFT_HEIGHT(target, GET_HEIGHT(GET_LEFT_CHILD(target)) + 1);
    }
    else
    {
        SET_LEFT_HEIGHT(target, 0);
    }
    if (HAS_RIGHT_CHILD(target))
    {
        SET_RIGHT_HEIGHT(target, GET_HEIGHT(GET_RIGHT_CHILD(target)) + 1);
    }
    else
    {
        SET_RIGHT_HEIGHT(target, 0);
    }

    if (GET_DIF(target) > 1)
    {
        if (GET_LEFT_HEIGHT(target) > GET_RIGHT_HEIGHT(target)) // if left height is more than right height
        {
            if (GET_RIGHT_HEIGHT(GET_LEFT_CHILD(target)) > GET_LEFT_HEIGHT(GET_LEFT_CHILD(target)))
            {
                void *new_left_child = rotate_left(GET_LEFT_CHILD(target));
            }
            void *new_target = rotate_right(target);
            target = new_target;
        }
        else // if right height is more than left height
        {
            if (GET_LEFT_HEIGHT(GET_RIGHT_CHILD(target)) > GET_RIGHT_HEIGHT(GET_RIGHT_CHILD(target)))
            {
                void *new_right_child = rotate_right(GET_RIGHT_CHILD(target));
            }
            void *new_target = rotate_left(target);
            target = new_target;
        }
    }
    set_tree(GET_PARENT(target));
}

static void add_node(void *bp)
{
    void *cur_node = GET(tree_dummy_header);
    SET_LEFT_CHILD(bp, NULL);
    SET_RIGHT_CHILD(bp, NULL);
    SET_LEFT_HEIGHT(bp, 0);
    SET_RIGHT_HEIGHT(bp, 0);
    if (cur_node == NULL)
    {
        PUT(tree_dummy_header, bp);
        SET_PARENT(bp, tree_dummy_header);
        return;
    }
    while (1)
    {
        if (GET_NODE_SIZE(cur_node) > GET_NODE_SIZE(bp))
        {
            if (HAS_LEFT_CHILD(cur_node))
            {

                cur_node = GET_LEFT_CHILD(cur_node);
            }
            else
            {
                set_left_child(cur_node, bp);
                break;
            }
        }
        else
        {
            if (HAS_RIGHT_CHILD(cur_node))
            {

                cur_node = GET_RIGHT_CHILD(cur_node);
            }
            else
            {
                set_right_child(cur_node, bp);
                break;
            }
        }
    }

    set_tree(cur_node);
}

static void remove_node(void *bp)
{
    void *set_tree_target;
    if (!HAS_CHILD(bp))
    {
        set_tree_target = GET_PARENT(bp);
        set_node(bp, NULL, 0);
    }
    else if (HAS_LEFT_CHILD(bp) && !HAS_RIGHT_CHILD(bp))
    {
        set_tree_target = GET_LEFT_CHILD(bp);
        set_node(bp, set_tree_target, 1);
    }
    else if (!HAS_LEFT_CHILD(bp) && HAS_RIGHT_CHILD(bp))
    {
        set_tree_target = GET_RIGHT_CHILD(bp);
        set_node(bp, set_tree_target, 1);
    }
    else
    {
        void *right_child_left_most = GET_RIGHT_CHILD(bp);
        void *right_child_left_most_right_child;
        while (HAS_LEFT_CHILD(right_child_left_most))
        {
            right_child_left_most = GET_LEFT_CHILD(right_child_left_most);
        }
        set_tree_target = GET_PARENT(right_child_left_most);
        right_child_left_most_right_child = GET_RIGHT_CHILD(right_child_left_most);
        if (set_tree_target == bp)
        {
            set_tree_target = GET_RIGHT_CHILD(bp);
        }
        else
        {
            set_left_child(set_tree_target, right_child_left_most_right_child);
        }

        set_node(bp, right_child_left_most, 2);
    }
    set_tree(set_tree_target);
}

/* AVLTree function end */

static void *coalesce(void *bp, int flag)
{
    size_t prev_alloc = GET_ALLOC(FOOTER_ADDR(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HEADER_ADDR(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HEADER_ADDR(bp));
    if (prev_alloc && next_alloc) /* Case 1 */
    {
        ;
    }
    else if (prev_alloc && !next_alloc) /* Case 2 */
    {
        remove_node(NEXT_BLKP(bp));
        size += GET_SIZE(HEADER_ADDR(NEXT_BLKP(bp)));
        PUT(HEADER_ADDR(bp), PACK(size, 0));
        PUT(FOOTER_ADDR(bp), PACK(size, 0));
    }
    else if (!prev_alloc && next_alloc) /* Case 3 */
    {
        remove_node(PREV_BLKP(bp));
        size += GET_SIZE(HEADER_ADDR(PREV_BLKP(bp)));
        PUT(FOOTER_ADDR(bp), PACK(size, 0));
        PUT(HEADER_ADDR(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    else /* Case 4 */
    {
        remove_node(PREV_BLKP(bp));
        remove_node(NEXT_BLKP(bp));
        size += GET_SIZE(HEADER_ADDR(PREV_BLKP(bp))) + GET_SIZE(FOOTER_ADDR(NEXT_BLKP(bp)));
        PUT(HEADER_ADDR(PREV_BLKP(bp)), PACK(size, 0));
        PUT(FOOTER_ADDR(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    if (flag == 1)
    {
        add_node(bp);
    }
    return bp;
}

static void *extend_heap(size_t words, int flag)
{
    char *bp;
    size_t size;
    /* Allocate an even number of words to maintain alignment */
    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1)
    {
        return NULL;
    }
    /* Initialize free block header/footer and the epilogue header */
    PUT(HEADER_ADDR(bp), PACK(size, 0));         /* Free block header */
    PUT(FOOTER_ADDR(bp), PACK(size, 0));         /* Free block footer */
    PUT(HEADER_ADDR(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */
    /* Coalesce if the previous block was free */
    return coalesce(bp, flag);
}

static void *find_fit(size_t asize)
{
    /* best-fit search */
    void *bp = GET(tree_dummy_header);
    void *best_fit = NULL;
    int count;
    if (bp != NULL)
    {
        count = GET_HEIGHT(bp);
        while (count >= 0)
        {
            if (GET_NODE_SIZE(bp) == asize)
            {
                best_fit = bp;
            }
            if (GET_NODE_SIZE(bp) > asize)
            {
                if (best_fit == NULL)
                {
                    best_fit = bp;
                }
                else
                {
                    if (GET_NODE_SIZE(best_fit) > GET_NODE_SIZE(bp))
                    {
                        best_fit = bp;
                    }
                }
                bp = GET_LEFT_CHILD(bp);
                if (bp == NULL)
                {
                    break;
                }
            }
            else
            {
                bp = GET_RIGHT_CHILD(bp);
                if (bp == NULL)
                {
                    break;
                }
            }
        }
    }
    if (best_fit != NULL)
    {
        remove_node(best_fit);
    }
    return best_fit; /* When else break, it will return node. Otherwise, return NULL */
}

static void place(void *bp, size_t asize)
{
    size_t csize = GET_NODE_SIZE(bp);

    if ((csize - asize) >= (MIN_BLOCK_SIZE))
    {
        PUT(HEADER_ADDR(bp), PACK(asize, 1));
        PUT(FOOTER_ADDR(bp), PACK(asize, 1));
        bp = NEXT_BLKP(bp);
        PUT(HEADER_ADDR(bp), PACK(csize - asize, 0));
        PUT(FOOTER_ADDR(bp), PACK(csize - asize, 0));
        add_node(bp);
    }
    else
    {
        PUT(HEADER_ADDR(bp), PACK(csize, 1));
        PUT(FOOTER_ADDR(bp), PACK(csize, 1));
    }
}

static void show_tree(void *node, int count)
{
    if (node == tree_dummy_header)
    {
        node = GET(tree_dummy_header);
        printf("TRRoot: %d\t\t\taddr: %u\t\t\tsize: %u\t\t\tleftHegith: %u\t\t\trightHeight:%u\n", count, node, GET_NODE_SIZE(node), GET_LEFT_HEIGHT(node), GET_RIGHT_HEIGHT(node));
    }

    if (HAS_LEFT_CHILD(node))
    {
        printf("Lorder: %d\t\t\taddr: %u\t\t\tsize: %u\t\t\tleftHegith: %u\t\t\trightHeight:%u\n", count, GET_LEFT_CHILD(node), GET_NODE_SIZE(GET_LEFT_CHILD(node)), GET_LEFT_HEIGHT(GET_LEFT_CHILD(node)), GET_RIGHT_HEIGHT(GET_LEFT_CHILD(node)));
        show_tree(GET_LEFT_CHILD(node), count + 1);
    }
    if (HAS_RIGHT_CHILD(node))
    {
        printf("Rorder: %d\t\t\taddr: %u\t\t\tsize: %u\t\t\tleftHegith: %u\t\t\trightHeight:%u\n", count, GET_RIGHT_CHILD(node), GET_NODE_SIZE(GET_RIGHT_CHILD(node)), GET_LEFT_HEIGHT(GET_RIGHT_CHILD(node)), GET_RIGHT_HEIGHT(GET_RIGHT_CHILD(node)));
        show_tree(GET_RIGHT_CHILD(node), count + 1);
    }
}

static void find_tree(void *node)
{
    void *cur = GET(tree_dummy_header);
    printf("NODE addr: %u\t\t\tNODE size: %u\n", node, GET_NODE_SIZE(node));
    while (1)
    {
        if (GET_NODE_SIZE(cur) > GET_NODE_SIZE(node))
        {
            if (HAS_LEFT_CHILD(cur))
            {
                printf("node is smaller than cur, but cur left child is null\nNODE\naddr: %u\nsize: %u\ncur\naddr: %u\nsize: %u\n", node, GET_NODE_SIZE(node), cur, GET_NODE_SIZE(cur));

                return;
            }
            else
            {
                cur = GET_LEFT_CHILD(cur);
            }
        }
        else if (GET_NODE_SIZE(cur) < GET_NODE_SIZE(node))
        {
            if (HAS_RIGHT_CHILD(cur))
            {
                printf("node is larger than cur, but cur right child is null\nNODE\naddr: %u\nsize: %u\ncur\naddr: %u\nsize: %u\n", node, GET_NODE_SIZE(node), cur, GET_NODE_SIZE(cur));
                return;
            }
            else
            {
                cur = GET_RIGHT_CHILD(cur);
            }
        }
        else if (GET_NODE_SIZE(cur) == GET_NODE_SIZE(node))
        {
            if (cur == node)
            {
                return;
            }
            void *check_left = GET_LEFT_CHILD(cur);
            void *check_right = GET_RIGHT_CHILD(cur);
            if (check_left != NULL)
            {
                if (check_left == node)
                {
                    return;
                }
                while (HAS_RIGHT_CHILD(check_left))
                {
                    check_left = GET_RIGHT_CHILD(check_left);
                    if (check_left == node)
                    {
                        return;
                    }
                }
            }
            if (check_right != NULL)
            {
                if (check_right == node)
                {
                    return;
                }
                while (HAS_LEFT_CHILD(check_right))
                {
                    check_right = GET_LEFT_CHILD(check_right);
                    if (check_right == node)
                    {
                        return;
                    }
                }
            }
            printf("node size is same but cant't find \nNODE\naddr: %u\nsize: %u\n", node, GET_NODE_SIZE(node));
            return;
        }
    }
}

static void mm_check()
{
    void *cur, *end;
    cur = mem_heap_lo() + 24;
    end = mem_heap_hi();

    while (cur < end)
    {
        if (!GET_ALLOC(cur - 4) && GET_NODE_SIZE(cur) >= MIN_BLOCK_SIZE)
        {
            find_tree(cur);
        }
        cur = NEXT_BLKP(cur);
    }
}

/*
 *  mm_init - initialize the malloc package.
 */
int mm_init(range_t **ranges)
{
    /* YOUR IMPLEMENTATION */
    if ((tree_dummy_header = mem_sbrk(4 * WSIZE)) == (void *)-1)
    {
        return 1;
    }
    PUT(tree_dummy_header, 0);                            /* tree dummy header */
    PUT(tree_dummy_header + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue padding */
    PUT(tree_dummy_header + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    PUT(tree_dummy_header + (3 * WSIZE), PACK(0, 1));     /* Epilogue header */
    /* DON'T MODIFY THIS STAGE AND LEAVE IT AS IT WAS */
    gl_ranges = ranges;
    if (extend_heap(CHUNKSIZE / WSIZE, 1) == NULL)
    {
        return -1;
    }

    return 0;
}

/*
 *  mm_malloc - Allocate a block by incrementing the brk pointer (example).
 *  Always allocate a block whose size is a multiple of the alignment.-
 */
void *mm_malloc(size_t size)
{

    size_t asize;
    size_t extendsize;
    char *bp;

    /* Ignore spurious requests */
    if (size == 0)
    {
        return 0;
    }

    /* Adjust block size to include overhead and alignment reqs. */
    if (size <= MIN_BLOCK_SIZE - 8)
    {
        asize = MIN_BLOCK_SIZE;
    }
    else
    {
        asize = DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);
    }
    /* Search teh free list for a fit */
    if ((bp = find_fit(asize)) != NULL)
    {
        place(bp, asize);
        return bp;
    }

    /* No fit found. Get more memory and lace the block */
    extendsize = MAX(asize, CHUNKSIZE);

    if ((bp = extend_heap(extendsize / WSIZE, 2)) == NULL)
    {
        puts("can't assign anymore");
        return NULL;
    }
    place(bp, asize);

    return bp;
}

/*
 *  mm_free - Frees a block.
 */
void mm_free(void *ptr)
{
    /* YOUR IMPLEMENTATION */
    size_t size = GET_SIZE(HEADER_ADDR(ptr));
    PUT(HEADER_ADDR(ptr), PACK(size, 0));
    PUT(FOOTER_ADDR(ptr), PACK(size, 0));
    coalesce(ptr, 1);

    /* DON'T MODIFY THIS STAGE AND LEAVE IT AS IT WAS */
    if (gl_ranges)
        remove_range(gl_ranges, ptr);
}

/*
 *  mm_realloc - empty implementation; YOU DO NOT NEED TO IMPLEMENT THIS
 */
void *mm_realloc(void *ptr, size_t t)
{
    return NULL;
}

/*
 *  mm_exit - finalize the malloc package.
 */
void mm_exit(void)
{
    void *cur, *end;
    cur = mem_heap_lo() + 4 * WSIZE;
    end = mem_heap_hi();

    while (cur < end)
    {
        if (GET_ALLOC(cur - WSIZE))
        {
            mm_free(cur);
        }

        cur = NEXT_BLKP(cur);
    }
}
