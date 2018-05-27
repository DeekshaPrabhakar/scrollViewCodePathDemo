//
//  ViewController.h
//  scrollViewCodePathDemo
//
//  Created by Deeksha Prabhakar on 5/27/18.
//  Copyright © 2018 Deeksha Prabhakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

