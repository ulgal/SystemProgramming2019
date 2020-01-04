//------------------------------------------------------------------------------
/// @brief Kernel Lab: Page Table Walk (dbfs_ptrav.c)
///
/// @section license_section License
/// Copyright (c) 2018-2019, Computer Systems and Platforms Laboratory, SNU
/// All rights reserved.
///
/// Redistribution and use in source and binary forms,  with or without modifi-
/// cation, are permitted provided that the following conditions are met:
///
/// - Redistributions of source code must retain the above copyright notice,
///   this list of conditions and the following disclaimer.
/// - Redistributions in binary form must reproduce the above copyright notice,
///   this list of conditions and the following disclaimer in the documentation
///   and/or other materials provided with the distribution.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
/// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,  THE
/// IMPLIED WARRANTIES OF MERCHANTABILITY  AND FITNESS FOR A PARTICULAR PURPOSE
/// ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER  OR CONTRIBUTORS BE
/// LIABLE FOR ANY DIRECT,  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSE-
/// QUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE
/// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
/// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT
/// LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE)  ARISING IN ANY WAY
/// OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
/// DAMAGE.
//------------------------------------------------------------------------------
#include <linux/debugfs.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/uaccess.h>
#include <asm/pgtable.h>

MODULE_LICENSE("Dual BSD/GPL");

struct packet
{
        pid_t pid;
        unsigned long pages_1g, pages_2m, pages_4k;
};

static struct dentry *dir, *output;
static struct task_struct *task;

static ssize_t read_output(struct file *fp,
                           char __user *user_buffer,
                           size_t length,
                           loff_t *position)
{
        // Implement read file operations
        struct packet pckt;
        pgd_t *l4_entry;
        pud_t *l3_entry;
        pmd_t *l2_entry;
        pte_t *l1_entry;

        unsigned long pages_1g = 0;
        unsigned long pages_2m = 0;
        unsigned long pages_4k = 0;

        unsigned long vaddr = 0;

        unsigned long PGD_CNT = 0x8000000000;
        unsigned long PUD_CNT = 0x40000000;
        unsigned long PMD_CNT = 0x200000;
        unsigned long PTE_CNT = 0x1000;

        // Fill in the arguments below

        copy_from_user(&pckt, user_buffer, sizeof(struct packet));

        task = pid_task(find_vpid(pckt.pid), PIDTYPE_PID);

        for (vaddr = 0; vaddr <= 0x00007FFFFFFFFFFF; vaddr += PTE_CNT)
        {
                l4_entry = pgd_offset(task->mm, vaddr);
                if (pgd_present(*l4_entry))
                {
                        l3_entry = pud_offset(l4_entry, vaddr);
                        if (pud_present(*l3_entry))
                        {
                                if (pud_val(*l3_entry) & 0x80)
                                {
                                        pages_1g++;
                                        vaddr += (PUD_CNT - PTE_CNT);
                                }
                                else
                                {
                                        l2_entry = pmd_offset(l3_entry, vaddr);
                                        if (pmd_present(*l2_entry))
                                        {
                                                if (pmd_val(*l2_entry) & 0x80)
                                                {
                                                        pages_2m++;
                                                        vaddr += (PMD_CNT - PTE_CNT);
                                                }
                                                else
                                                {
                                                        l1_entry = pte_offset_kernel(l2_entry, vaddr);
                                                        if (pte_present(*l1_entry))
                                                        {
                                                                pages_4k++;
                                                        }
                                                }
                                        }
                                        else
                                        {
                                                vaddr += (PMD_CNT - PTE_CNT);
                                        }
                                }
                        }
                        else
                        {
                                vaddr += (PUD_CNT - PTE_CNT);
                        }
                }
                else
                {
                        vaddr += (PGD_CNT - PTE_CNT);
                }
        }

        pckt.pages_1g = pages_1g;
        pckt.pages_2m = pages_2m;
        pckt.pages_4k = pages_4k;

        // Fill in the arguments below
        copy_to_user(user_buffer, &pckt, sizeof(struct packet));

        return length;
}

static const struct file_operations dbfs_fops = {
    // Mapping file operations with your functions
    .read = read_output};

static int __init dbfs_module_init(void)
{
        // Implement init module
        printk("Init Module\n");

        dir = debugfs_create_dir("ptrav", NULL);

        if (!dir)
        {
                printk("Cannot create paddr dir\n");
                return -1;
        }

        // Fill in the arguments below
        output = debugfs_create_file("output", 0444, dir, NULL, &dbfs_fops);

        return 0;
}

static void __exit dbfs_module_exit(void)
{
        // Implement exit module
        debugfs_remove_recursive(dir);
        printk("Exit Module\n");
}

module_init(dbfs_module_init);
module_exit(dbfs_module_exit);

/*
mm(memory management)
task->mm->pgd // first level page

rss binary는 test program의 pid를 받는다.

각 entry에 meta data가 있다?
lsb가 present bit이므로 이걸 체크해서 들어가야 함?
tricky part -> user space는 절반만 사용한다. pgd에서는 0-255만 체크하면 됨
meta data에서 certain bit은 1gb인지 2mb인지 알려줌 // 1gb는 gentoo에 없지만 체크하는 코드 들어가야 함.

cat /proc/<pid>/status <- 여기서 VMRSS 확인해서 비교
*/