/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 *
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc isn't implemented.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
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

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp) ((char *)(bp)-WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp)-WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp)-GET_SIZE(((char *)(bp)-DSIZE)))
/* Basic consatnsts and macros from textbook end*/

void *heap_listp;

static void *coalesce(void *bp)
{
    //puts("in coalesce");
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

    if (prev_alloc && next_alloc) /* Case 1 */
    {
        return bp;
    }
    else if (prev_alloc && !next_alloc) /* Case 2 */
    {
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size, 0));
    }
    else if (!prev_alloc && next_alloc) /* Case 3 */
    {
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    else /* Case 4 */
    {
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) + GET_SIZE(FTRP(NEXT_BLKP(bp)));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    return bp;
}

static void *extend_heap(size_t words)
{
    //puts("in extend_heap");

    char *bp;
    size_t size;

    /* Allocate an even number of words to maintain alignment */
    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1)
    {
        return NULL;
    }

    /* Initialize free block header/footer and the epilogue header */
    PUT(HDRP(bp), PACK(size, 0));         /* Free block header */
    PUT(FTRP(bp), PACK(size, 0));         /* Free block footer */
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */
    /* Coalesce if the previous block was free */
    return coalesce(bp);
}

static void *find_fit(size_t asize)
{
    //puts("in find_Fit");

    /* First-fit search */
    void *bp;

    for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp))
    {
        if (!GET_ALLOC(HDRP(bp)) && (asize <= GET_SIZE(HDRP(bp))))
        {
            return bp;
        }
    }
    return NULL; /* No fit */
}

static void place(void *bp, size_t asize)
{
    //puts("in place");

    size_t csize = GET_SIZE(HDRP(bp));

    if ((csize - asize) >= (2 * DSIZE))
    {
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(csize - asize, 0));
        PUT(FTRP(bp), PACK(csize - asize, 0));
    }
    else
    {
        PUT(HDRP(bp), PACK(csize, 1));
        PUT(FTRP(bp), PACK(csize, 1));
    }
}

/*
 *  mm_init - initialize the malloc package.
 */
int mm_init(range_t **ranges)
{
    //puts("in init");

    /* YOUR IMPLEMENTATION */
    if ((heap_listp = mem_sbrk(4 * WSIZE)) == (void *)-1)
    {
        return 1;
    }

    PUT(heap_listp, 0);                            /* Alignment padding */
    PUT(heap_listp + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT(heap_listp + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    PUT(heap_listp + (3 * WSIZE), PACK(0, 1));     /* Epilogue header */
    heap_listp += (2 * WSIZE);

    /* DON'T MODIFY THIS STAGE AND LEAVE IT AS IT WAS */
    gl_ranges = ranges;
    if (extend_heap(CHUNKSIZE / WSIZE) == NULL)
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
    //puts("in malloc");

    size_t asize;
    size_t extendsize;
    char *bp;

    /* Ignore spurious requests */
    if (size == 0)
    {
        return 0;
    }

    /* Adjust block size to include overhead and alignment reqs. */
    if (size <= DSIZE)
    {
        asize = 2 * DSIZE;
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
    if ((bp = extend_heap(extendsize / WSIZE)) == NULL)
    {
        return NULL;
    }
    place(bp, asize);
    return bp;
}

/*
 *  mm_free - Frees a block. Does nothing (example)
 */
void mm_free(void *ptr)
{
    //puts("in Free");

    /* YOUR IMPLEMENTATION */
    size_t size = GET_SIZE(HDRP(ptr));

    PUT(HDRP(ptr), PACK(size, 0));
    PUT(FTRP(ptr), PACK(size, 0));
    coalesce(ptr);
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
    //puts("in exit");
    void *cur, *end;
    cur = mem_heap_lo() + 4 * WSIZE;
    end = mem_heap_hi(); /*
    printf("cur-: %u\n", cur - WSIZE);
    printf("cur-g: %u\n", GET(cur - WSIZE));
    printf("cur-gs: %u\n", GET_SIZE(cur - WSIZE));
    printf("curalloc: %u\n", GET_ALLOC(cur - WSIZE));
    printf("cur: %u\n", cur);
    printf("curg: %u\n", GET(cur));
    printf("curgs: %u\n", GET_SIZE(cur));
    printf("curalloc: %u\n", GET_ALLOC(cur));
    printf("cur+: %u\n", cur + WSIZE);
    printf("cur+g: %u\n", GET(cur + WSIZE));
    printf("cur+gs: %u\n", GET_SIZE(cur + WSIZE));
    printf("curalloc: %u\n", GET_ALLOC(cur + WSIZE));
    printf("cur+2: %u\n", cur + 2 * WSIZE);
    printf("cur+2g: %u\n", GET(cur + 2 * WSIZE));
    printf("cur+2gs: %u\n", GET_SIZE(cur + 2 * WSIZE));
    printf("curalloc: %u\n", GET_ALLOC(cur + 2 * WSIZE));
    printf("cur+3: %u\n", cur + 3 * WSIZE);
    printf("cur+3g: %u\n", GET(cur + 3 * WSIZE));
    printf("cur+3gs: %u\n", GET_SIZE(cur + 3 * WSIZE));
    printf("curalloc: %u\n", GET_ALLOC(cur + 3 * WSIZE));*/
    while (cur < end)
    { /*
        puts("in while");
        printf("cur-: %u\n", cur - WSIZE);
        printf("cur-g: %u\n", GET(cur - WSIZE));
        printf("cur-gs: %u\n", GET_SIZE(cur - WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur - WSIZE));
        printf("cur: %u\n", cur);
        printf("curg: %u\n", GET(cur));
        printf("curgs: %u\n", GET_SIZE(cur));
        printf("curalloc: %u\n", GET_ALLOC(cur));*/
        if (GET_ALLOC(cur - WSIZE))
        {
            mm_free(cur);
        }
        /*
        puts("after if");
        printf("cur-: %u\n", cur - WSIZE);
        printf("cur-g: %u\n", GET(cur - WSIZE));
        printf("cur-gs: %u\n", GET_SIZE(cur - WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur - WSIZE));
        printf("cur: %u\n", cur);
        printf("curg: %u\n", GET(cur));
        printf("curgs: %u\n", GET_SIZE(cur));
        printf("curalloc: %u\n", GET_ALLOC(cur));
*/
        cur = NEXT_BLKP(cur);
        /*
        printf("cur-: %u\n", cur - WSIZE);
        printf("cur-g: %u\n", GET(cur - WSIZE));
        printf("cur-gs: %u\n", GET_SIZE(cur - WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur - WSIZE));
        printf("cur: %u\n", cur);
        printf("curg: %u\n", GET(cur));
        printf("curgs: %u\n", GET_SIZE(cur));
        printf("curalloc: %u\n", GET_ALLOC(cur));
        printf("cur+: %u\n", cur + WSIZE);
        printf("cur+g: %u\n", GET(cur + WSIZE));
        printf("cur+gs: %u\n", GET_SIZE(cur + WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur + WSIZE));
        printf("cur+2: %u\n", cur + 2 * WSIZE);
        printf("cur+2g: %u\n", GET(cur + 2 * WSIZE));
        printf("cur+2gs: %u\n", GET_SIZE(cur + 2 * WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur + 2 * WSIZE));
        printf("cur+3: %u\n", cur + 3 * WSIZE);
        printf("cur+3g: %u\n", GET(cur + 3 * WSIZE));
        printf("cur+3gs: %u\n", GET_SIZE(cur + 3 * WSIZE));
        printf("curalloc: %u\n", GET_ALLOC(cur + 3 * WSIZE));*/
    }
    /* YOUR IMPLEMENTATION */
    //puts("end exit");
}
