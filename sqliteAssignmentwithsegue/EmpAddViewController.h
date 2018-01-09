//
//  EmpAddViewController.h
//  sqliteAssignmentwithsegue
//
//  Created by Student-12 on 23/08/17.
//  Copyright © 2017 vaishnavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmpAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *empidtf;

@property (weak, nonatomic) IBOutlet UITextField *empnametf;


@property (weak, nonatomic) IBOutlet UITextField *empaddresstf;

- (IBAction)saveinfo:(id)sender;

@end
