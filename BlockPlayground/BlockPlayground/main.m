//
//  main.m
//  BlockPlayground
//
//  Created by Nick Paulson on 7/16/11.
//  Copyright 2011 Linebreak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BlockPlaygroundAppDelegate.h"

int main(int argc, char *argv[])
{
    int retVal = 0;
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([BlockPlaygroundAppDelegate class]));
		[pool release];
    return retVal;
}
