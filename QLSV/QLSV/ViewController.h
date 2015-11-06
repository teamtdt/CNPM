//
//  ViewController.h
//  QLSV
//
//  Created by Nguyen Ngoc Cuong on 10/14/15.
//  Copyright (c) 2015 Nguyen Cuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic) NSMutableArray *listSV;
@property (weak, nonatomic) IBOutlet UITableView *tbViewStudent;


@end

