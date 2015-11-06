//
//  ViewController.m
//  QLSV
//
//  Created by Nguyen Ngoc Cuong on 10/14/15.
//  Copyright (c) 2015 Nguyen Cuong. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseManager.h"
#import "SinhVien.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    DatabaseManager *shareManager =[DatabaseManager shareManager];
    self.tbViewStudent.dataSource =self;
    self.tbViewStudent.delegate=self;
    self.listSV=[shareManager listStudent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID =@"cell_ID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell ==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    SinhVien *sv =[[SinhVien alloc]init];
    sv=[self.listSV objectAtIndex:indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",sv.hoten];
    return cell;
    
}
-(NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listSV count];
}

@end
