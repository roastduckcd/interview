//
//  main.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/6/6.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include <stdio.h>
// 最好将参数和整个宏都括起来
// 不要使用分号
#define MIN(A, B) (((A) < (B)) ? (A) : (B))

void usingDefine(void);

int main(int argc, const char * argv[]) {
    // insert code here...

    usingDefine();
    return 0;
}

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

