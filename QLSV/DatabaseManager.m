//
//  DatabaseManager.m
//  QLSV
//
//  Created by Nguyen Ngoc Cuong on 10/14/15.
//  Copyright (c) 2015 Nguyen Cuong. All rights reserved.
//

#import "DatabaseManager.h"
#import "SinhVien.h"

@interface DatabaseManager ()

@end

@implementation DatabaseManager
+(DatabaseManager *)shareManager
{
    static DatabaseManager *shareMyManager=nil;
    if(shareMyManager ==nil)
        shareMyManager=[[self alloc]init];
    return  shareMyManager;
}
-(id)init{
    if(self ==[super init])
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath =[mainBundle pathForResource:@"dssv" ofType:@"sqlite"];
        if(sqlite3_open([filePath UTF8String], &database)==SQLITE_OK)
        {
            NSLog(@"Ket noi thanh cong");
        }
        else
        {
            NSLog(@"Ket noi that bai");
            
        }
            
    }
    return  self;
}
-(NSMutableArray *)listStudent
{
    NSMutableArray *dssinhvien =[[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    NSString * querySQL =@"select *form SinhVien";
    const char *query_stm =[querySQL UTF8String];
    
    if(sqlite3_prepare_v2(database, query_stm, -1, &statement, NULL)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            
            int mssv_sv = sqlite3_column_int(statement, 0);
            char *hoten_sv =(char *)sqlite3_column_text(statement, 1);
            char *giotinh_sv =(char *)sqlite3_column_text(statement, 2);
            char *lop_sv =(char *)sqlite3_column_text(statement, 3);
            char *gvcn_sv =(char *)sqlite3_column_text(statement, 4);
            
            NSString *hoten_st =[NSString stringWithUTF8String:hoten_sv];
            NSString *gioitinh_st =[NSString stringWithUTF8String:giotinh_sv];
            NSString *lop_st =[NSString stringWithUTF8String:lop_sv];
            NSString *gvcn_st =[NSString stringWithUTF8String:gvcn_sv];
            
            SinhVien *sv =[[SinhVien alloc]init];
            sv.mssv=mssv_sv;
            sv.hoten=hoten_st;
            sv.gioitinh=gioitinh_st;
            sv.lop=lop_st;
            sv.gvcn=gvcn_st;
            [dssinhvien addObject:sv];
        
    }
    }
    return  dssinhvien;
}

@end
