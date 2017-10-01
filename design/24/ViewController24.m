//
//  ViewController.m
//  app1
//
//  Created by Admin on 11.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewController24.h"
#import "customSegmentView24.h"


@interface ViewController24 ()
@property (weak, nonatomic) IBOutlet UIButton   *buttonView;

@end

@implementation ViewController24

- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ];}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //NSLog(@"Call Stack: %@", [NSThread callStackSymbols]);
    NSLocalizedString(@"dw", vv);
        //NSLog(@"\n\n класс %s [строк кода %d]", __PRETTY_FUNCTION__, __LINE__ );
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)send:(customSegmentView24 *)sender {
    
    NSLog(@" ! %d",(int)sender.selectedSegmentIndex);

}



- (BOOL)prefersStatusBarHidden {return 1;}

@end






















