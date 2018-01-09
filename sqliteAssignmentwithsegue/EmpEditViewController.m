//
//  EmpEditViewController.m
//  sqliteAssignmentwithsegue
//
//  Created by Student-12 on 23/08/17.
//  Copyright © 2017 vaishnavi. All rights reserved.
//

#import "EmpEditViewController.h"
#import <sqlite3.h>

@interface EmpEditViewController ()

@end

@implementation EmpEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _empidtf.text=[NSString stringWithFormat:@"%d",_temp.empid];
    _empnametf.text=_temp.empname;
    _empaddresstf.text=_temp.empaddress;
    
    
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

- (IBAction)editrecord:(id)sender
{
    _updatebtn.hidden=false;
    _deletebtn.hidden=false;
    _cancelbtn.hidden=false;
    
    _editbtn.hidden=true;
    
    _empidtf.enabled=true;
    _empnametf.enabled=true;
    _empaddresstf.enabled=true;

    
}

- (IBAction)updaterecord:(id)sender
{
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Emp.sqlite",[dircontents lastObject]];
    
    sqlite3 *db;
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"update employee set name=\"%@\",address=\"%@\" where id=\"%@\"",_empnametf.text,_empaddresstf.text,_empidtf.text];
        if (sqlite3_exec(db, [query UTF8String], NULL, NULL, NULL)==SQLITE_OK)
        {
            NSLog(@"updated succesfully");
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

}

- (IBAction)deleterecord:(id)sender
{
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Emp.sqlite",[dircontents lastObject]];
    
    sqlite3 *db;
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"delete from employee where id=\"%@\"",_empidtf.text];
        if (sqlite3_exec(db, [query UTF8String], NULL, NULL, NULL)==SQLITE_OK)
        {
            NSLog(@"updated succesfully");
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

}

- (IBAction)cancel:(id)sender
{
    _updatebtn.hidden=true;
    _deletebtn.hidden=true;
    _cancelbtn.hidden=true;
    
    _editbtn.hidden=false;
    
    _empidtf.enabled=false;
    _empnametf.enabled=false;
    _empaddresstf.enabled=false;
}
@end
