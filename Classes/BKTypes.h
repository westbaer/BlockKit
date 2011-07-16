//
//  BKTypes.h
//  BlockKit
//
//  Created by Tristan O'Tierney on 7/16/11.
//


typedef void (^BKVoidBlock)(void);
typedef void (^BKCompletionBlock)(BOOL finished);
typedef void (^BKContextBlock)(CGContextRef context);
typedef id (^BKCacheBlock)();
typedef void (^BKIndexPathBlock)(NSIndexPath *indexPath);
typedef void (^BKButtonIndexBlock)(NSInteger buttonIndex);