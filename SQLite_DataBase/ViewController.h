//
//  ViewController.h
//  SQLite_DataBase
//
//  Created by Admin on 04/08/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *findRegNo;
@property (weak, nonatomic) IBOutlet UITextField *regNo;
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UITextField *deptTxt;
@property (weak, nonatomic) IBOutlet UITextField *yearTxt;

- (IBAction)findBtn:(id)sender;
- (IBAction)saveBtn:(id)sender;

@end
