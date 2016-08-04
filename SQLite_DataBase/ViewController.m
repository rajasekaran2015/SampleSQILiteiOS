//
//  ViewController.m
//  SQLite_DataBase
//
//  Created by Admin on 04/08/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (IBAction)findBtn:(id)sender {
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber:
                     self.findRegNo.text];
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        self.regNo.text = @"";
        self.nameTxt.text =@"";
        self.deptTxt.text = @"";
        self.yearTxt.text =@"";
    }
    else{
        self.regNo.text = self.findRegNo.text;
        self.nameTxt.text =[data objectAtIndex:0];
        self.deptTxt.text = [data objectAtIndex:1];
        self.yearTxt.text =[data objectAtIndex:2];
    }
}

- (IBAction)saveBtn:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (self.regNo.text.length>0 &&self.nameTxt.text.length>0 &&
        self.deptTxt.text.length>0 &&self.yearTxt.text.length>0 )
    {
        success = [[DBManager getSharedInstance]saveData:
                   self.regNo.text name:self.nameTxt.text department:
                   self.deptTxt.text year:self.yearTxt.text];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
