


#import "View15.h"
#import "ViewController15.h"

@interface ViewController15 () <UITextFieldDelegate,UIGestureRecognizerDelegate> { BOOL login; }

@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;

@property (strong, nonatomic) IBOutlet UIView *textField1view;
@property (strong, nonatomic) IBOutlet UIView *textField2view;

@property (strong, nonatomic) IBOutlet UIButton *textFieldbutton1;
@property (strong, nonatomic) IBOutlet UIButton *textFieldbutton2;

@property (strong, nonatomic) IBOutlet View15 *loginView1;
@property (strong, nonatomic) IBOutlet UIButton *loginButton1;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel1;

@property (strong, nonatomic) IBOutlet View15 *loginView2;
@property (strong, nonatomic) IBOutlet UIButton *loginButton2;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel2;

@end

@implementation ViewController15
- (IBAction)loginn:(UIButton *)sender {

    
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {
                         _loginView1.alpha = 0.5;
                         _loginLabel1.alpha = 0.5;
                     }
                     completion: ^(BOOL finished) {
                         [UIView animateWithDuration:0.2 animations:^{
                             _loginView1.alpha = 1.0;
                             _loginLabel1.alpha = 1.0;
                         }];
                     } ];
    
}
- (IBAction)passwr:(UIButton *)sender {
    
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {
                         _loginView2.alpha = 0.5;
                         _loginLabel2.alpha = 0.5;
                     }
                     completion: ^(BOOL finished) {
                         [UIView animateWithDuration:0.2 animations:^{
                             _loginView2.alpha = 1.0;
                             _loginLabel2.alpha = 1.0;
                         }];
                     } ];
    
}

- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ]; }


- (void)viewDidLoad {
    [super viewDidLoad];
    
    login=1;
    
    // скрыть подсказки клавиатуры
    self.textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField2.autocorrectionType = UITextAutocorrectionTypeNo;
    
    
    [ self.view addGestureRecognizer:[ [UITapGestureRecognizer alloc]
                                      initWithTarget: self  action: @selector(method_pan: )] ];
    
    
    UITapGestureRecognizer *
    touchHold = [ UITapGestureRecognizer alloc ];
    touchHold.delegate = self;
    [ self.view addGestureRecognizer: touchHold ];
    

    
    [ _loginButton1 addTarget:self action:@selector(buckbutton3:) forControlEvents:UIControlEventTouchUpInside];
    [ _loginButton2 addTarget:self action:@selector(buckbutton3:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"text-list-7.png"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
}

- (void)viewWillAppear:   (BOOL)animated {
    
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

/*
CG_INLINE CGRect
sizeChange(CGRect r, CGFloat x, CGFloat y, CGFloat w, CGFloat h){

    r.origin.x    = r.origin.x    + x ;
    r.origin.y    = r.origin.y    + y ;
    r.size.width  = r.size.width  + w ;
    r.size.height = r.size.height + h ;
    
    return r;
}*/

- (void)keyboardWillShow:(NSNotification *)notification { }
- (void)keyboardWillHide:(NSNotification *)notification { }


-(UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }


// для управление нажатием клавиши Return и т.д
- (BOOL)textFieldShouldReturn: (UITextField *)textField {
  
    [textField  resignFirstResponder];
    return 1;
}
// делегат 1нажатие
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)sender  {

    
    return 1;
}

- (IBAction)method_pan: (UIPanGestureRecognizer *)sender {
    
    [_textField2  resignFirstResponder];
    [_textField1  resignFirstResponder];

}


- (IBAction)buckbutton3:(id)sender {
    [_loginView1 setBackgroundColor2:[UIColor colorWithRed:246/255.0 green:46/255.0 blue:105/255.0 alpha:1]];
    _loginLabel1.textColor = [UIColor whiteColor];
    [_loginView2 setBackgroundColor2:[UIColor colorWithRed:160/255.0 green:192/255.0 blue:202/255.0 alpha:1]];
    _loginLabel2.textColor = [UIColor whiteColor];
}

@end























