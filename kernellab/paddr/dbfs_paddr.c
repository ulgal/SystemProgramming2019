//------------------------------------------------------------------------------
/// @brief Kernel Lab: VA-PA Translation (dbfs_paddr.c)
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
        unsigned long vaddr;
        unsigned long paddr;
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

        unsigned long vaddr;
        unsigned long paddr = 0;
        unsigned long page_addr = 0;
        unsigned long page_offset = 0;

        // Fill in the arguments below
        copy_from_user(&pckt, user_buffer, sizeof(struct packet));

        task = pid_task(find_vpid(pckt.pid), PIDTYPE_PID);
        vaddr = pckt.vaddr;

        l4_entry = pgd_offset(task->mm, vaddr);
        l3_entry = pud_offset(l4_entry, vaddr);
        l2_entry = pmd_offset(l3_entry, vaddr);
        l1_entry = pte_offset_kernel(l2_entry, vaddr);
        /*
        l4_entry = pgd_offset(task->mm, vaddr);
        l3_entry = pud_offset(l4_entry, vaddr);
        if (pud_present(*l3_entry) && (pud_val(*l3_entry) & 0x80))
        {
                page_addr = pud_val(*l3_entry) & 0xFFFFC0000000;
                page_offset = (vaddr & ~(0xFFFFC0000000));
                paddr = page_addr + page_offset;
        }
        else
        {
                l2_entry = pmd_offset(l3_entry, vaddr);
                if (pmd_present(*l2_entry) && (pmd_val(*l2_entry) * 0x80))
                {
                        page_addr = pmd_val(*l2_entry) & 0xFFFFFFE00000;
                        page_offset = (vaddr & ~(0xFFFFFFE00000));
                        paddr = page_addr + page_offset;
                }
                else
                {
                        l1_entry = pte_offset_kernel(l2_entry, vaddr);

                        page_addr = pte_val(*l1_entry) & 0xFFFFFFFFF000;
                        page_offset = (vaddr & ~(0xFFFFFFFFF000));
                        paddr = page_addr + page_offset;
                }
        }
        */
        page_addr = pte_val(*l1_entry) & 0xFFFFFFFFF000;
        page_offset = (vaddr & ~(0xFFFFFFFFF000));
        paddr = page_addr + page_offset;

        pckt.paddr = paddr;
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
        dir = debugfs_create_dir("paddr", NULL);

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
TA session

output = debugfs_create_file("output", umode, dentry parent, data, &dbfs_fops);
umode에 무엇이 들어가야 하는지? permision

debugfs_create_file이 불리면 어떤 동작을 하는지
read output에 동작을 기술하면 되는지
copy_to_user와 copy_from_user는 뭔지


pgd 접근할 때 virtual memory 값으로 변환해 줘야 한다?
*/
