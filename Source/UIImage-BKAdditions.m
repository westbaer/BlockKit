//
//  UIImage-BKAdditions.m
//  BlockKit
//
//  Created by Tristan O'Tierney on 2/11/09.
//

#import "UIImage-BKAdditions.h"
#import "BKCoreGraphics.h"
#import "NSURLConnection-BKAdditions.h"

@implementation UIImage (BKAdditions)

#pragma mark Static Methods

+ (UIImage *)imageWithSize:(CGSize)size scale:(CGFloat)scale block:(BKContextBlock)block;
{
	return BKImageWithContextBlock(size, scale, block);
}

+ (void)imageWithData:(NSData *)data block:(BKImageBlock)block;
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		UIImage *img = [[UIImage alloc] initWithData:data];
		dispatch_async(dispatch_get_main_queue(), ^{
			block([img autorelease]);
		});
	});
}

+ (void)imageWithContentsOfFile:(NSString *)filePath block:(BKImageBlock)block;
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		UIImage *img = [[UIImage alloc] initWithContentsOfFile:filePath];
		dispatch_async(dispatch_get_main_queue(), ^{
			block([img autorelease]);
		});
	});
}

+ (void)imageWithContentsOfURL:(NSURL *)URL block:(BKImageBlock)block;
{
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request];
	[connection startWithCompletionBlock:^(NSData *responseData, NSURLResponse *urlResponse, NSError *error) {
		if(!error) {
			dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
				UIImage *img = [[UIImage alloc] initWithData:responseData];
				dispatch_async(dispatch_get_main_queue(), ^{
					block([img autorelease]);
				});
			});
		}
	}];
}

@end
