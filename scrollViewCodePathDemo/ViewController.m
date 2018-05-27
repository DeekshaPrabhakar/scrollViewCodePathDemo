//
//  ViewController.m
//  scrollViewCodePathDemo
//
//  Created by Deeksha Prabhakar on 5/27/18.
//  Copyright © 2018 Deeksha Prabhakar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *data;
NSString *CellIdentifier = @"com.codepath.MyFirstTableViewCell";
int lastIndex = 0;
bool isMoreDataLoading = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data = [[NSMutableArray alloc] init];
    int limit = lastIndex+20;
    int i = 0;
    for(i=lastIndex; i< limit; i++){
        [data addObject: [NSNumber numberWithInt:i]];
    }
    lastIndex = i;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!isMoreDataLoading){
        
        // Calculate the position of one screen length before the bottom of the results
        int scrollViewContentHeight = self.tableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.tableView.bounds.size.height;
        
        // When the user has scrolled past the threshold, start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.tableView.isDragging) {
            isMoreDataLoading = true;
            [self loadMoreData];
        }
    }
}

- (void)loadMoreData {
    int limit = lastIndex + 20;
    int i = lastIndex;
    
    for(i=lastIndex; i< limit; i++){
        [data addObject: [NSNumber numberWithInt:i]];
    }
    lastIndex = i;
    isMoreDataLoading = false;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", data[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}

@end
