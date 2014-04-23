//
//  TTViewController.h
//  UITableViewDynamicCells
//
//  Created by sergey on 4/21/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end
