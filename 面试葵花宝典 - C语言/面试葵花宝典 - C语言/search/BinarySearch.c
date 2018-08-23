//
//  BinarySearch.c
//  面试葵花宝典 - C语言
//
//  Created by yang song on 2018/8/23.
//  Copyright © 2018 yangsong. All rights reserved.
//

#include "BinarySearch.h"
#include <string.h>
#include "Common.h"


int binarySearch(int arr[], int count, int item) {
    // 获取数组的中间值
    int former = 0, latter = count-1, midIndex = 0;
    // 不能用值做判断，查找不到会造成死循环
    // arr[midIndex] != item
    // 满足条件的值存在时，former必小鱼latter
    while (former <= latter) {

        midIndex = (former + latter) / 2;
        int midValue = arr[midIndex];
        // 加一减一：一次查找后得到的都是中间值之后或之前的，不包含中间值，除非待查找值就是中间值
        if (midValue < item) {
            former = midIndex+1;
        }else if (midValue > item) {
            latter = midIndex-1;
        }else {
            return midIndex;
        }
    }
    return -1;
}

