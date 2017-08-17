//
//  ViewController.m
//  PlayGifImage
//
//  Created by uzone on 2017/8/17.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import "ViewController.h"

#import "FLAnimatedImage.h"
@interface ViewController ()
//本地图片
@property (nonatomic,strong)FLAnimatedImageView *imgView1;
//在线图片
@property (nonatomic,strong)FLAnimatedImageView *imgView2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.imgView1) {
        self.imgView1 = [[FLAnimatedImageView alloc] init];
        self.imgView1.contentMode  = UIViewContentModeScaleAspectFill;
        self.imgView1.clipsToBounds = YES;
    }
    
    [self.view addSubview:self.imgView1];
    
    self.imgView1.frame = CGRectMake(0, 20, self.view.frame.size.width, 200);
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"eat" withExtension:@"gif"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:data];
    self.imgView1.animatedImage = animatedImage;
    
    if (!self.imgView2) {
        self.imgView2 = [[FLAnimatedImageView alloc] init];
        self.imgView2.contentMode = UIViewContentModeScaleAspectFill;
        self.imgView2.clipsToBounds = YES;
    }
    
    [self.view addSubview:self.imgView2];
    
    self.imgView2.frame = CGRectMake(0, 240, self.view.frame.size.width, 400);
    
    FLAnimatedImage *__block animatedImage2 = nil;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url2 = [NSURL URLWithString:@"http://raphaelschaad.com/static/nyan.gif"];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        animatedImage2 = [FLAnimatedImage animatedImageWithGIFData:data2];
        
        self.imgView2.animatedImage = animatedImage2;
        
    });
    
}



@end
