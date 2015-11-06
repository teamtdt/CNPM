//
//  DatabaseManager.h
//  QLSV
//
//  Created by Nguyen Ngoc Cuong on 10/14/15.
//  Copyright (c) 2015 Nguyen Cuong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface DatabaseManager : UIViewController
{
    sqlite3 *database;
}
+(DatabaseManager *) shareManager;
-(NSMutableArray *)listStudent;

@end
