//
//  RDImageScrollViewController.m
//  AppFunction
//
//  Created by yang song on 2018/7/13.
//  Copyright © 2018 yangsong. All rights reserved.
//

// 2显示，1从缓存获取，3下载
// 快速滑动，图片加载暂停，降低性能消耗

#import "RDImageScrollViewController.h"



@interface RDImageScrollViewController () < UIScrollViewDelegate >

@property (nonatomic, strong) UIScrollView *imageScrollView;
@property (nonatomic, strong) NSMutableArray<UIImageView *> *imageViewArray;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RDImageScrollViewController
- (void)showSome {
    NSLog(@"打印了");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.timer = /*[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(showSome) userInfo:nil repeats:YES];*/
    self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1.0 target:self selector:@selector(showSome) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];


    self.imageViewArray = [NSMutableArray array];

    CGFloat TopMargin = 0;
    if (@available(iOS 11.0, *)) {
        TopMargin = self.view.safeAreaInsets.top;
    } else {
        TopMargin = 44.0;
    }

    self.imageScrollView = [[UIScrollView alloc] init];
    self.imageScrollView.delegate = self;

    CGRect frame = self.imageScrollView.frame;
    frame.size = CGSizeMake(CGRectGetWidth(self.view.frame), 300);
    self.imageScrollView.frame = frame;
    // 先确定大小，再确定位置
    self.imageScrollView.center = self.view.center;

    self.imageScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 3, 300);
    self.imageScrollView.pagingEnabled = YES;
    self.imageScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageScrollView];

    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), 300)];
        imageView.backgroundColor = [UIColor colorWithRed:i * 80 / 255.0 green:i * 80 / 255.0 blue:i * 80 / 255.0 alpha:1];
        [self.imageScrollView addSubview:imageView];

        [self.imageViewArray addObject:imageView];
    }

//    UIPageControl *pageControl = [[UIPageControl alloc] init];
//
//    CGRect pageFrame = pageControl.frame;
//    pageFrame.size = CGSizeMake(CGRectGetWidth(self.imageScrollView.frame) - 2 * 50, 50);
//    pageControl.frame = pageFrame;
//    pageControl.center = CGPointMake(CGRectGetMidX(self.imageScrollView.frame), CGRectGetHeight(self.imageScrollView.frame) - CGRectGetHeight(pageControl.frame));
//    pageControl.backgroundColor = [UIColor redColor];
//
//    pageControl.numberOfPages = 5;
//    [pageControl sizeForNumberOfPages:3];
//
//
//    pageControl.pageIndicatorTintColor = [UIColor purpleColor];
//    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
//    [self.imageScrollView addSubview:pageControl];

}


#pragma mark - scroll delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", scrollView.gestureRecognizers);
}


@end


#pragma mark - model
@interface ImageModel : NSObject
/** 图片网络url或本地名 */
@property (nonatomic, strong) NSArray *imageUrls;

@end

@implementation ImageModel

- (instancetype)initWithDic:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        self.imageUrls = dataDic[@"image"];
    }
    return self;
}

@end
