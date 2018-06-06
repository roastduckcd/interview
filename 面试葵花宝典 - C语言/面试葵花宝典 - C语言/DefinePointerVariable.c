//
//  DefinePointerVariable.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/6/6.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include <stdio.h>

// 整形变量
int a;
// 整形指针
int *intP;
// 指向指针的指针，指针又指向整形数
int **intPoint;
// 10个数的整形数组
int array[10];
// 10个指针的数组, 指针指向整数
int *arrP[10];          //类比  int (*)[10] arrP2;
// 一个指向有10个整形的数组的指针
int (*arrayPointer)[10];
// 函数指针：一个整形参数，返回值也是整形数
int (*function)(int);
// 一个含有10个指针的数据，指针指向函数，函数有一个整形参数，且返回值是整形数
int (*arrayFunction[10])(int);

int test(int a){
    printf("使用函数指针调用函数\n");
    return 12;
}


// 使用函数指针
void usingFunctionPointer() {
    function = test;        // 是否使用& 都一样
    printf("函数地址:%p, %p\n", test, &test);
    function(2);
    printf("函数指针地址及内容：%p, %p\n", function, *function);
    (*function)(2);
}
