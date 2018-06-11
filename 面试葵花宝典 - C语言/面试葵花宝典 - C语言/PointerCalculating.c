//
//  PointerCalculating.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/6/11.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include "PointerCalculating.h"

void calculateNormalVar(void);
void calculateArrayVar(void);

void calculatePointerAndMemory(void) {

    calculateArrayVar();
}

void calculateNormalVar() {
    /************** 普通变量 **************/
    int a = 20;
    int b = 30;
    printf("address of a, b is : %p --- %p\n", &a, &b);
    int *p1 = &a;
    int *p2 = &b;
    printf("address of p1, p2 is : %p --- %p\n", p1, p2);
        // &a+n ==> 实际是a的地址上向高地址偏移n*sizeof(int)字节大小
    printf("address of &a+1 is : %p\n", &a+1);
        // &a-n ==> 实际是a的地址上向低地址偏移n*sizeof(int)字节大小
    printf("address of &a-1 is : %p\n", &a-1);
        // &a-&b ==> 地址相减实际是 (a地址-b地址) / sizeof(int)
    printf("address of &a-&b is : %ld\n", &a-&b);
        // 地址的直接运算一定要指定当前地址中内容的类型，否则运算结果未知,并且两者类型要一致
    printf("address of &a-&b is : %ld\n", &a-(int *)0x7ffeefbff498);
}

void calculateArrayVar() {
    /************** 数组变量 **************/
    int a[5] = {10, 3, 5, 7, 9};
    printf("address of a, &a is : %p --- %p\n", a, &a);
    int *p = a;
    printf("address of p is : %p\n", p);
    printf("\n\n");
    for(int i=0; i<5; i++){
        printf("*a+%d=%d, %d, %d\n", i, *(a+i), *(p+i), a[i]);
    }
    printf("&a = %d, %p\n", *((int *)&a), &a);
    // &a+1  偏移了整个数组大小：可以将数组类比为一个类型，类型大小为元素类型大小*元素个数
    printf("&a+1 = %p, added %ld \n", &a+1, ((int *)(&a+1)-(int *)&a));

}
