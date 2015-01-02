//
//  NewsTableView.m
//  AutolayoutDemo
//
//  Created by song on 15/1/2.
//  Copyright (c) 2015年 song. All rights reserved.
//

#import "NewsTableView.h"
#import "NewsTableViewCell.h"
#import "WTNetWork.h"
@interface NewsTableView () <UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic, strong) NSArray *dataList;
@end
@implementation NewsTableView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UINib *nib = [UINib nibWithNibName:@"NewsTableViewCell"
                                    bundle:nil];
        
        [self registerNib:nib
             forCellReuseIdentifier:@"NewsTableViewCell"];
        
    }
    return self;
}

-(void)reloadData
{

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = _dataList.count;
    if (count == 0) {
        tableView.hidden = YES;
    }else
    {
        tableView.hidden = NO;
    }
    return count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
    
    NewsTableViewCell *temp = (NewsTableViewCell*)cell;
    temp.newsData = _dataList[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier:@"pushToDetail"
//                              sender:_dataList[indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end