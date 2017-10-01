//
//  ViewController.m
//  app2
//
//  Created by Admin on 12.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewController23.h"

@interface ViewController23 ()
<UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray *array1;

}

@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIImageView *air;
@property (weak, nonatomic) IBOutlet UIImageView *airlines;

@property (weak, nonatomic) IBOutlet UIImageView *gradientView;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end

@implementation ViewController23


- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ];}


- (IBAction)faefw:(id)sender {
    
    [UIView animateWithDuration: 0.5
                     animations: ^(void)
    {
        self.air.transform = CGAffineTransformMakeRotation(-0.8);


                    } completion: ^(BOOL finished) {
    
    [UIView animateWithDuration: 1.6
                          delay: 0.6
         usingSpringWithDamping: 0.5
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void)
     {
         self.air.transform = CGAffineTransformIdentity;

     } completion: ^(BOOL finished) { }];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[ [UITapGestureRecognizer alloc] initWithTarget: self action: @selector( method_tap: ) ]];
    
    UITapGestureRecognizer *
    touchHold = [ UITapGestureRecognizer alloc ];
    touchHold.delegate = self;
    [ self.view addGestureRecognizer: touchHold ];
    
    // скрыть подсказки клавиатуры
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    NSLog(@"tyt");
    
    self.air.transform = CGAffineTransformMakeRotation(-0.8);
    self.airlines.alpha = 0;
    
    array1 = [[NSMutableArray alloc] init];
    array1 = [@[ @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]mutableCopy];

    
    
    self.pickerView.transform = CGAffineTransformMakeRotation( -90 * (M_PI / 180));
    
      self.pickerView.frame = CGRectMake
    ( self.pickerView.frame.origin.x + 48,
     self.pickerView.frame.origin.y -55 ,
     self.pickerView.frame.size.width +20,// расширяет колличество затухаемых ячеек - то есть чем больше размер , тем больше видно ячеек
     self.pickerView.frame.size.height ); // тут размер высоты 1 ячейки
    
    
    self.pickerView.delegate    = self ;
    self.pickerView.dataSource  = self ;
    [self.pickerView selectRow:2 inComponent:0 animated:1]; // стартовая позицияы
    
    /*
    // тень
    self.air.layer .shadowOffset 	= CGSizeMake(3,15); // смещение от центра
    self.air.layer .shadowOpacity 	= 0.1; 	// непрозрачность
    self.air.layer .shadowRadius 	= 1.5;	// уровень размытия
    self.air.layer .shadowColor 	=
    [ [ UIColor colorWithRed: 0.0/255.0	green: 0.0/255.0 blue:0.0/255.0 alpha: 1.0 ] CGColor ];
    */

   
}
- (void)viewDidAppear:(BOOL)animated {
    
    
    [UIView animateWithDuration: 3.0
                     animations: ^(void) { self.airlines.alpha = 1; }
                     completion: ^(BOOL finished) {}];
    
    [UIView animateWithDuration: 1.4
                          delay: 1
         usingSpringWithDamping: 2.5
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void) { self.air .transform = CGAffineTransformIdentity; }
                     completion: ^(BOOL finished) { }];
    
    
     [self animateBackgroundColor];
}
- (void)animateBackgroundColor {
    
    [UIView animateWithDuration: 70 // 75
                          delay: 0
                        options: ( UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat )
                     animations: ^(void)
     {   int x = -(self.gradientView.frame.size.width - self.view.frame.size.width);
         self.gradientView.transform = CGAffineTransformMakeTranslation(x, 0); }
                     completion: ^(BOOL finished) { }   ];
    
    
}
// _______________________________________________________________________________________________


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    [self hideKeyboard_blackViewAlpha];  return 1; }
- (BOOL)textFieldShouldReturn: (UITextField *)textField {
    [self hideKeyboard_blackViewAlpha];  return 1; }
- (IBAction)method_tap: (UIPanGestureRecognizer *)sender {
    [self hideKeyboard_blackViewAlpha]; }

-(void)hideKeyboard_blackViewAlpha {
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {   self.blackView.alpha = 0; [self.textField resignFirstResponder]; }
                     completion: ^(BOOL finished) {}];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {  self.blackView.alpha = 0.5; }
                     completion: ^(BOOL finished) {}];
    return 1;
}


// _______________________________________________________________________________________________

-(UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }

// _______________________________________________________________________________________________




// колличество компонентов
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {    return 1;}

// колличетсво ячеек
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [array1 count];
}
// размер одной ячейки
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {    return 30;}
// если хочешь вернуть ячейку только с текстом
-(NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [array1 objectAtIndex:row];}
// если хочешь вернуть View

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIView *
    viiew = [UIView new];
    viiew.frame = CGRectMake(0,0,30,30); // 0> 0v  >> vv
    viiew.backgroundColor = [UIColor clearColor];
    // _________________________________________
    UILabel *
    label = [[UILabel alloc] initWithFrame: CGRectMake(0,-3,30,30)]; // границы
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor =  [UIColor colorWithRed: 82.0/255.0 green: 99.0/255.0 blue: 109.0/255.0 alpha: 1.0];
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label.text =  [array1 objectAtIndex:row]; //какой-нибудь текст
    [viiew addSubview: label]; //добавляем наш текст в иерархию View
    // _________________________________________
    
    
    viiew.transform = CGAffineTransformMakeRotation( 90 * (M_PI / 180));
    
    return  viiew;
 
}




@end




























