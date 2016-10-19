//
//  UIView+Fuzzy.m
//  LTProject
//
//  Created by Jonny on 16/8/5.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "UIView+Fuzzy.h"
#import <Accelerate/Accelerate.h>

@implementation UIView (Fuzzy)

- (void)lt_addBlurEffectImageView:(UIImageView *)imageView baseView:(UIView *)baseView {
    
    // 模糊
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *view = [[UIVisualEffectView alloc]initWithEffect:beffect];
    view.frame = imageView.frame;
    [baseView  addSubview:view];
    
}

- (void)lt_addToolbarImageView:(UIImageView *)imageView baseView:(UIView *)baseView {
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:imageView.frame];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    [baseView addSubview:toolBar];
}

- (void)lt_addCoreImage:(UIImageView *)imageView {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CIContext *context = [CIContext contextWithOptions:nil];
        CIImage *ciImage = [CIImage imageWithCGImage:imageView.image.CGImage];
        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
        [filter setValue:ciImage forKey:kCIInputImageKey];
        //设置模糊程度
        [filter setValue:@30.0f forKey: @"inputRadius"];
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        CGRect frame = [ciImage extent];
        NSLog(@"%f,%f,%f,%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
        CGImageRef outImage = [context createCGImage: result fromRect:ciImage.extent];
        UIImage * blurImage = [UIImage imageWithCGImage:outImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = blurImage;
        });
    });
    
}

/**
 *  模糊状态
 *
 *  @param image 图片
 *  @param blur 涂污
 *
 *  @return    图片
 */
- (UIImage *)lt_boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}
@end
