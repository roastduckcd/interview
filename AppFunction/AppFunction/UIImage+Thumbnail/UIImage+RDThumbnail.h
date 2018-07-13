//
//  UIImage+RDThumbnail.h
//  AppFunction
//
//  Created by yang song on 2018/7/5.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RDThumbnail)


/**
 使用UIKit中的函数进行图片大小处理
 用于图像大小调整的最高级API
 @param size 缩略后的图片大小
 @param scale 图片的缩放因子，默认0.0，使用主屏幕分辨率变化
 @return 缩放后的图片
 */
- (UIImage *)scaleImageToSizeByUIkit:(CGSize)size scale:(CGFloat)scale;

/**
 利用CoreGraphics中的函数进行图片大小处理
 CoreGraphics / Quartz 2D提供了一套较低级别的API，允许进行更高级的配置。
 给定一个CGImage，使用临时位图上下文来渲染缩放后的图像。
 @param size 处理后的图片大小
 */
- (UIImage *)scaleImageToSizeByCGGraphiscs:(CGSize)size;

/**
 使用ImageIO中的函数进行图片大小处理
 可以在许多不同格式之间读取和写入，访问照片元数据以及执行常见的图像处理操作。
 这个库提供了该平台上最快的图像编码器和解码器，具有先进的缓存机制，甚至可以逐步加载图像。
 @param size 处理后的图片大小
 */
- (UIImage *)scaleImageToSizeByImageIO:(CGSize)size;

/**
 使用CoreImage中的函数进行图片大小处理
 用来对基于像素的图像进行操作与分析。
 IOS提供了很多强大的滤镜(Filter)，这些Filter提供了各种各样的效果，
 并且还可以通过滤镜链将各种效果的Filter叠加起来，形成强大的自定义效果，
 如果你对该效果不满意，还可以子类化滤镜。
 @param size 处理后的图片大小
 */
- (UIImage *)scaleImageToSizeByCoreImage:(CGSize)size;

/**
 使用vImage中的函数进行图片大小处理
 使用CPU的矢量处理器处理大图像。
 强大的图像处理功能，包括Core Graphics和Core Video互操作，格式转换和图像处理。
 #import <Accelerate/Accelerate.h>
 @param size 处理后的图片大小
 */
- (UIImage *)scaleImageToSizeByVImage:(CGSize)size;


@end
