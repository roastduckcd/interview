//
//  UIImage+RDThumbnail.m
//  AppFunction
//
//  Created by yang song on 2018/7/5.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "UIImage+RDThumbnail.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (RDThumbnail)

- (UIImage *)scaleImageToSizeByUIkit:(CGSize)size scale:(CGFloat)scale{

    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = self.size;
    }

    if (scale < 0.0 || scale > 1.0) {
        scale = 0.0;
    }
    // opaque 设为 YES，能提高性能
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    // 先画出来，才能通过上下文获取到
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaleImageToSizeByCGGraphiscs:(CGSize)size {

    CGImageRef image = self.CGImage;
    // 获取原始图片信息
    size_t bitsPerConmponent = CGImageGetBitsPerComponent(image);
    size_t bytesPerRow = CGImageGetBytesPerRow(image);
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image);
    uint32_t bitmapInfo = CGImageGetBitmapInfo(image);

    CGContextRef context = CGBitmapContextCreate(nil, (NSInteger)size.width, (NSInteger)size.height, bitsPerConmponent, bytesPerRow, colorSpace, bitmapInfo);

    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);

    CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), image);
    
    CGImageRef cgimage = CGBitmapContextCreateImage(context);
    UIImage *scaledImage = [UIImage imageWithCGImage:cgimage];

    CFRelease(context);
    CFRelease(cgimage);
    return scaledImage;
}

- (UIImage *)scaleImageToSizeByImageIO:(CGSize)size {
    // 获取最大像素边
    CGFloat maxPixel = MAX(size.width, size.height);
    // 将图片转换为png格式的二进制数据
    NSData *imageData = UIImagePNGRepresentation(self);
    if (imageData) {
        // 根据data创建图片源，c函数，注意释放对象
        CGImageSourceRef imageSource = CGImageSourceCreateWithData((CFDataRef)imageData, nil);
        // 设定图片缩略属性
        // c String  -> CFStringRef: CFStringCreateWithCString()
        //TODO: 直接创建CFDictionaryRef
//        void *optionKeys[] = {
//            (char *)kCGImageSourceThumbnailMaxPixelSize,
//            (char *)kCGImageSourceCreateThumbnailFromImageAlways
//        };
//        void *optionValues[] = {
//            &maxPixel,
//            kCFBooleanTrue
//        }
//        CFDictionaryRef options = CFDictionaryCreate()
        // 图片创建所需的选项
        // kCGImageSourceThumbnailMaxPixelSize 指定最大像素边，以此为基准等比例缩略
        // kCGImageSourceCreateThumbnailFromImageAlways 使用原图
        NSDictionary *imageOptions = @{
                                       (NSString *)kCGImageSourceThumbnailMaxPixelSize: @(maxPixel),
                                       (NSString *)kCGImageSourceCreateThumbnailFromImageAlways: @YES
                                       };
        // 创建缩略图片
        CGImageRef cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, (CFDictionaryRef)imageOptions);
        UIImage *thumbnailedImage = [UIImage imageWithCGImage:cgImage];
        // 释放资源
        CFRelease(cgImage);
        CFRelease(imageSource);
        return thumbnailedImage;
    } else {

        return nil;
    }
}

- (UIImage *)scaleImageToSizeByCoreImage:(CGSize)size {

    // 拿到图片的CGImage
    CGImageRef cgImage = self.CGImage;
    // 获取当前图片和缩略图的比例
    CGFloat scale = size.width / self.size.width;// 或者用height
    // 获取滤镜图片   CIImage：用于滤镜的图片
    CIImage *inputCIImage = [CIImage imageWithCGImage:cgImage];

    // 创建基于缩放的滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CILanczosScaleTransform"];
    // 滤镜创建后立即设定自定义值
    // 滤镜使用的图片
    [filter setValue:inputCIImage forKey:kCIInputImageKey];
    // 滤镜使用的缩放比例, 默认为1.0
    [filter setValue:@(scale) forKey:kCIInputScaleKey];
    // 滤镜使用的图像显示方式，默认1.0
    [filter setValue:@1.0 forKey:kCIInputAspectRatioKey];

    // 输出过滤后的图片
    CIImage *outputCIImage = [filter valueForKey:kCIOutputImageKey];

    // 获取上下文, 并且不使用软解码
    CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer: @NO}];

    // 获取新图片
    CGImageRef filteredCGImage = [ciContext createCGImage:outputCIImage fromRect:outputCIImage.extent];
    UIImage *filteredImage = [UIImage imageWithCGImage:filteredCGImage];

    CFRelease(filteredCGImage);
    return filteredImage;
}

- (UIImage *)scaleImageToSizeByVImage:(CGSize)size {
    // 拿到图片的CGImage
    CGImageRef cgImage = self.CGImage;
    vImage_CGImageFormat format = {
            .bitsPerComponent = 8,
            .bitsPerPixel = 32,
            .colorSpace = NULL,   // don't forget to release this!
            .bitmapInfo = kCGBitmapAlphaInfoMask,
            .version = 0,        // must be 0
            .decode = NULL,
            .renderingIntent = kCGRenderingIntentDefault
        };
    // 结构体的初始化 {}
    CGFloat newWidth = size.width;
    CGFloat newHeight = size.height;
    CGFloat bytesPerPixel = CGImageGetBitsPerPixel(cgImage) / 8;
    CGFloat newBytesPerRow = bytesPerPixel * newWidth;
    void *destData = alloca(newHeight * newBytesPerRow);
    vImage_Buffer sourceBuffer = {
//        .data = destData,
//        .width = newWidth,
//        .height = newHeight,
//        .rowBytes = newBytesPerRow
    };
    sourceBuffer.data = destData;
    sourceBuffer.width = newWidth;
    sourceBuffer.height = newHeight;
    sourceBuffer.rowBytes = newBytesPerRow;
    // 这是一个枚举值
    vImage_Error error = vImageBuffer_InitWithCGImage(&sourceBuffer, &format, nil, cgImage, kvImageNoFlags);
    if (error != kvImageNoError) {
        return nil;
    }

//    CGFloat newWidth = size.width;
//    CGFloat newHeight = size.height;
//    CGFloat bytesPerPixel = CGImageGetBitsPerPixel(cgImage) / 8;
//    CGFloat newBytesPerRow = bytesPerPixel * newWidth;
//    void *destData = alloca(newHeight * newBytesPerRow);
    vImage_Buffer destBuffer = {
        .data = destData,
        .width = newWidth,
        .height = newHeight,
        .rowBytes = newBytesPerRow
    };

    // 图片缩放
    error = vImageScale_ARGB8888(&sourceBuffer, &destBuffer, nil, kvImageHighQualityResampling);
    if (error != kvImageNoError) {
        return nil;
    }

    // 创建新图片
    CGImageRef newCGImage = vImageCreateCGImageFromBuffer(&destBuffer, &format, nil, nil, kvImageNoFlags, &error);
    if (error != kvImageNoError) {
        CFRelease(newCGImage);
        return nil;
    }
    UIImage *scaledImage = [UIImage imageWithCGImage:newCGImage scale:0.0 orientation:self.imageOrientation];

    CFRelease(newCGImage);
    free(sourceBuffer.data);
    return scaledImage;
}
@end
