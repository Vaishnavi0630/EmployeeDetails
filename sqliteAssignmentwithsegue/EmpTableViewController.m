//
//  EmpTableViewController.m
//  sqliteAssignmentwithsegue
//
//  Created by Student-12 on 23/08/17.
//  Copyright © 2017 vaishnavi. All rights reserved.
//

#import "EmpTableViewController.h"
#import <sqlite3.h>
#import "Employee.h"
#import "EmpEditViewController.h"

@interface EmpTableViewController ()

@end

@implementation EmpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _emparray=[[NSMutableArray alloc]init];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [_emparray removeAllObjects];
    
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dbpath=[NSString stringWithFormat:@"%@/Emp.sqlite",[dircontents lastObject]];
    sqlite3 *db;
    sqlite3_stmt *buffer;
    
    if (sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=@"select * from employee";
        if (sqlite3_prepare(db, [query UTF8String], -1, &buffer, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(buffer)==SQLITE_ROW)
            {
                Employee *obj=[[Employee alloc]init];
                obj.empid=sqlite3_column_int(buffer, 0);
                obj.empname=[NSString stringWithFormat:@"%s",sqlite3_column_text(buffer, 1)];
                obj.empaddress=[NSString stringWithFormat:@"%s",sqlite3_column_text(buffer, 2)];
                
                [_emparray addObject:obj];
                
            }
            [self.tableView reloadData];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _emparray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fvctotvc" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"fvctotvc"])
    {
        EmpEditViewController *evc=[segue destinationViewController];
        NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
        evc.temp=[_emparray objectAtIndex:indexpath.row];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Employee*temp=[_emparray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=temp.empname;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
