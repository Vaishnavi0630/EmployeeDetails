//
//  EmpAddViewController.m
//  sqliteAssignmentwithsegue
//
//  Created by Student-12 on 23/08/17.
//  Copyright © 2017 vaishnavi. All rights reserved.
//

#import "EmpAddViewController.h"
#import <sqlite3.h>

@interface EmpAddViewController ()

@end

@implementation EmpAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveinfo:(id)sender
{
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Emp.sqlite",[dircontents lastObject]];
    
    sqlite3 *db;
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"insert into employee values(\"%@\",\"%@\",\"%@\")",_empidtf.text,_empnametf.text,_empaddresstf.text];
        if (sqlite3_exec(db, [query UTF8String], NULL, NULL, NULL)==SQLITE_OK)
        {
            NSLog(@"record inserted succesfully");
        }
        else
        {
            NSLog(@"fail to execute query");
        }
    }
    else
    {
        NSLog(@"fail to open database");
    }
    sqlite3_close(db);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}






@end
