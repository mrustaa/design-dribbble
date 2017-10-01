



#import "ViewController16_.h"

@interface ViewController16_ () <UIGestureRecognizerDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *myTextView;
@property (strong, nonatomic) IBOutlet UITextField *myTextView2;

@end

@implementation ViewController16_


- (IBAction)closeBttn:(UIButton *)sender {
    // presentingViewController - контроллер который представил этот класс
    [self.presentingViewController dismissViewControllerAnimated: YES   completion: NULL ];
    
    
}

- (void)viewDidLoad     {   [super viewDidLoad];
    _myTextView.delegate = self;
    _myTextView2.delegate = self;
    
			 UITapGestureRecognizer * touchHold = [ UITapGestureRecognizer alloc ];
    touchHold.delegate = self;
    [ self.view addGestureRecognizer: touchHold ];
    
    // скрыть подсказки клавиатуры
    _myTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    _myTextView2.autocorrectionType = UITextAutocorrectionTypeNo;
}

// жест 1нажатие
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    [_myTextView resignFirstResponder];
    [_myTextView2 resignFirstResponder];
    return 1;
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

CG_INLINE CGRect
sizeChange(CGRect r, CGFloat x, CGFloat y, CGFloat w, CGFloat h)
{
    
    r.origin.x    = r.origin.x   + x ;
    r.origin.y    = r.origin.y   + y ;
    r.size.width  = r.size.width + w ;
    r.size.height = r.size.height + h ;
    
    return r;
}

int i = 70;

- (void)keyboardWillShow:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.f
                        options:[[notification userInfo][UIKeyboardAnimationCurveUserInfoKey] intValue] << 16
                     animations:^
     {
         
         self.view.frame       = sizeChange(self.view.frame ,     0, -i, 0, 0);
         
         
     } completion:^(BOOL finished) {  }];
    
}
- (void)keyboardWillHide:(NSNotification *)notification {
    
    
    NSDictionary *userInfo = [notification userInfo];
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.f
                        options:[[notification userInfo][UIKeyboardAnimationCurveUserInfoKey] intValue] << 16
                     animations:^
     {
         
         self.view.frame        = sizeChange(self.view.frame ,     0, i, 0, 0);
         
         
     } completion:^(BOOL finished) {  }];
    
}

@end
