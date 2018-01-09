//
//  EmpEditViewController.h
//  sqliteAssignmentwithsegue
//
//  Created by Student-12 on 23/08/17.
//  Copyright © 2017 vaishnavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface EmpEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *empidtf;
@property (weak, nonatomic) IBOutlet UITextField *empnametf;
@property (weak, nonatomic) IBOutlet UITextField *empaddresstf;
@property (weak, nonatomic) IBOutlet UIButton *editbtn;


@property (weak, nonatomic) IBOutlet UIButton *updatebtn;
@property (weak, nonatomic) IBOutlet UIButton *deletebtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelbtn;

- (IBAction)editrecord:(id)sender;


- (IBAction)updaterecord:(id)sender;

- (IBAction)deleterecord:(id)sender;


- (IBAction)cancel:(id)sender;

@property(nonatomic,retain)Employee *temp;


@end
