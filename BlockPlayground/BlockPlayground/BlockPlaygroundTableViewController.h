//
//  BlockPlaygroundTableViewController.h
//  BlockPlayground
//
//  Created by Nick Paulson on 7/17/11.
//  Copyright 2011 Linebreak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKBlockTableViewDataSource;
@interface BlockPlaygroundTableViewController : UITableViewController {
    BKBlockTableViewDataSource *dataSource;
}

@end
