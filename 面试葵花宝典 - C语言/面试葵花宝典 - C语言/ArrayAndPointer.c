//
//  ArrayAndPointer.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include "ArrayAndPointer.h"

// 数组全局变量报错：linker command failed with exit code 1.
static int a[5] = {1, 2, 3, 4, 5};
int *ptr = (int *)(&a + 1);

/**
 数组首地址执行数组首元素，直接加1，相当于指针移动到下一个元素
 &a 表示数组整个地址，直接加1， 表示执行数组后面的内容
 */
void arrayNameAndPointer() {
    printf("a+1 address = %p\n &a+1 address = %p\n", a + 1, &a + 1);
    printf("value1 = %d, value2 = %d\n", *(a+1), *(ptr + 1));
}
