//
//  main.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/6/6.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include <stdio.h>

#include "DefinePointerVariable.h"
#include "ArrayAndPointer.h"
#include "PointerCalculating.h"
#include "PointerPlusPlus.h"
#include "exercise.h"
#include "Sort.h"
#include "BinarySearch.h"

// 最好将参数和整个宏都括起来
// 不要使用分号
#define MIN(A, B) (((A) < (B)) ? (A) : (B))

void usingDefine(void);
void usingConst(void);
void sizeOfPoint(void);

int main(int argc, const char * argv[]) {
    // insert code here...
//    sort();
    int a[] = {0,1,2,3,4,5,6,7,8,9};
    binarySearch(a, sizeof(a) / sizeof(int),10);
    return 0;
}

/**
 宏定义的副作用：因为近视简单替换，需要注意自增、减，边界效应等
 最好将参数和整个宏都括起来
 不要使用分号
 */
void usingDefine() {

//    int a = 1;
//    int b = 10;
//
//    printf("former address of a = %p and former value of a = %d\n", &a, a);
//    // 宏仅是简单的替换
//    // ((a++) < b) ? (a++) : (b)  自增两次
//    int least = MIN(a++, b);
//
//    printf("address of a = %p and value of a =  %d\n", &a, a);
//    printf("least = %d\n", least);
    int b = 8;
    int c = 5;
    int *p = &c;
    // 先用后加
    printf("former p = %d and address = p\n", *p++);
    int now = MIN(*p++, b);
    printf("p = %d and p address = %p and now = %d\n", *p, p, now);


    printf("int size = %lu\n", sizeof(int));
    printf("b address = %p\n", &b);
    printf("watch p+1 = %p and value = %d\n", p-1, *(p-1));
    printf("watch p+2 = %p and value = %d\n", p+2, *(p+2));


}

/**
 const 常量关键字的使用情景
 */
void usingConst() {

    // 常整形
    const int a = 10;
    int const b = 10;

        // 常整形指针:指针指向的值不可变，指针可变, *p 是取值，当然值不变
    int c = 20;
    int const *p = &c;
    const int *q = &c;
//    *p = 30; 不可改
    int d = 30;
    p = &d;

        // 整形常指针:指针指向的值可变，但是指针不能变
    int e = 6;
    int * const m = &e;
    *m = 66;
//    int f = 666;
//    m = &f;

        // 常整形常指针:指针指向的值不变，指针也不能变
    int g = 8;
    int const * const n = &g;
//    *n = 88;
//    int h = 888;
//    n = &h;

}

/**
 验证指针的大小
 */
void sizeOfPoint() {
    int a = 10;
    int *p1 = &a;

    double b = 100.32;
    double *p2 = &b;
    printf("p1 size = %lu\n", sizeof(p1));
    printf("p2 size = %lu\n", sizeof(p2));
}
