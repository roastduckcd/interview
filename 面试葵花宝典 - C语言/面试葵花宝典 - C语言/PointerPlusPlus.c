//
//  PointerPlusPlus.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/8/15.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include "PointerPlusPlus.h"


void pointerPlusPlus(void) {
    int a[] = {2, 4, 6, 8, 10};
    int *p;
    p = a;
    printf("p = %p, *p = %d\n", p, *p);
    // 1. 先用 p, 再 p+1 = p + 1 * sizeof(int)
//    printf("*p++ = %d, p = %p, *p = %d\n", *p++, p, *p);
    // 2. 先用 *p = 表达式值, *p 的值再 ++， 其实值已改变
    printf("(*p)++ = %d, *p = %d\n", (*p)++, *p);
    // 3. 同1，先用 p, 再 p+1 = p + 1 * sizeof(int)
//    printf("*(p++) = %d, p = %p, *p = %d\n", *(p++), p, *p);
}
