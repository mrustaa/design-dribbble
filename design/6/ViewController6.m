






#import "ViewController6.h"


@interface ViewController6 () <UITextViewDelegate> {
    CGFloat screenWidth  ;
    CGFloat screenHeight ;
}

@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (strong, nonatomic) IBOutlet UITextView *body;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@property (nonatomic, strong) NSAttributedString *textToAnalyze;
@end



@implementation ViewController6

- (IBAction)buckbutton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated: YES
                                                      completion: NULL ];
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n" ]) [textView resignFirstResponder];
    return 1;
}




- (IBAction)buttton:(UIButton *)sender {
    [self.body.textStorage    addAttribute:NSForegroundColorAttributeName
                                     value:sender.backgroundColor
                                     range:self.body.selectedRange         ];
}

- (IBAction)unoutlineee {
    [self.body.textStorage removeAttribute:NSForegroundColorAttributeName
                                     range:self.body.selectedRange         ];
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange         ];
}
- (IBAction)uno1252:(id)sender {
    [self.body.textStorage addAttributes: @{NSStrokeWidthAttributeName:@-3,
                                            NSStrokeColorAttributeName:[UIColor greenColor]}
                                   range:self.body.selectedRange];
    
}

- (void)viewDidLoad     {   [super viewDidLoad];

    
    self.body.autocorrectionType = UITextAutocorrectionTypeNo;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    screenWidth  = screenSize.width;
    screenHeight = screenSize.height;
}
- (IBAction)buttn:(id)sender {
    [self performSegueWithIdentifier:@"Seguee" sender:self];
}



- (void)viewWillAppear:		(BOOL)animated 	{	[super viewWillAppear:animated];
    NSLog(@"Step 1: view will appear");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [ [NSNotificationCenter defaultCenter]    addObserver:self
                                                 selector:@selector(preferredFontsChanged)
                                                     name:UIContentSizeCategoryDidChangeNotification
                                                   object:nil];
    
}

- (void)viewWillDisappear:	(BOOL)animated 	{	[super viewWillDisappear:animated];
    NSLog(@"Step 2: view will disappear"); NSLog(@"--Bye--");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [ [NSNotificationCenter defaultCenter] removeObserver:self
                                                     name:UIContentSizeCategoryDidChangeNotification
                                                   object:nil];
    
}
- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName {
    
    NSMutableAttributedString *characters =[[NSMutableAttributedString alloc] init];
    NSInteger index =0;
    while (index< [self.textToAnalyze length]) {
        NSRange range;
        id value =[self.textToAnalyze attribute: attributeName
                                        atIndex: index
                                 effectiveRange: &range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index =range.location + range.length;
        }
        else { index++; }
    }
    return characters;
    
}

- (void)keyboardWillShow:(NSNotification *)notification {
    self.textToAnalyze = self.body.textStorage;
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu цветных символов",
                                         (unsigned long)[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu выделенных символов",
                                         (unsigned long)[[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
    NSDictionary *userInfo = [notification userInfo];
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.f
                        options:[[notification userInfo][UIKeyboardAnimationCurveUserInfoKey] intValue] << 16
                     animations:^
     {
         _btn1.frame = CGRectMake(_btn1.frame.origin.x,_btn1.frame.origin.y-95,_btn1.frame.size.width,_btn1.frame.size.height);
         _btn2.frame = CGRectMake(_btn2.frame.origin.x,_btn2.frame.origin.y-95,_btn2.frame.size.width,_btn2.frame.size.height);
         _btn3.frame = CGRectMake(_btn3.frame.origin.x,_btn3.frame.origin.y-95,_btn3.frame.size.width,_btn3.frame.size.height);
         _btn4.frame = CGRectMake(_btn4.frame.origin.x,_btn4.frame.origin.y-95,_btn4.frame.size.width,_btn4.frame.size.height);
         _body.frame = CGRectMake(_body.frame.origin.x,_body.frame.origin.y,_body.frame.size.width,_body.frame.size.height-96);
         
         NSLog(@" %f %f %f %f ",
               _body.frame.origin.x    ,
               _body.frame.origin.y    ,
               _body.frame.size.width  ,
               _body.frame.size.height  );
         
     } completion:^(BOOL finished) {  }];
    
    [_body layoutIfNeeded];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    self.textToAnalyze = self.body.textStorage;
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu color символов",
                                         (unsigned long)[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu stroke символов",
                                         (unsigned long)[[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
    
    NSDictionary *userInfo = [notification userInfo];
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.f
                        options:[[notification userInfo][UIKeyboardAnimationCurveUserInfoKey] intValue] << 16
                     animations:^
     {
         _btn1.frame = CGRectMake(_btn1.frame.origin.x,_btn1.frame.origin.y+95,_btn1.frame.size.width,_btn1.frame.size.height);
         _btn2.frame = CGRectMake(_btn2.frame.origin.x,_btn2.frame.origin.y+95,_btn2.frame.size.width,_btn2.frame.size.height);
         _btn3.frame = CGRectMake(_btn3.frame.origin.x,_btn3.frame.origin.y+95,_btn3.frame.size.width,_btn3.frame.size.height);
         _btn4.frame = CGRectMake(_btn4.frame.origin.x,_btn4.frame.origin.y+95,_btn4.frame.size.width,_btn4.frame.size.height);
         _body.frame = CGRectMake(_body.frame.origin.x,_body.frame.origin.y,_body.frame.size.width,_body.frame.size.height+96);
         
         
     } completion:^(BOOL finished) {  }];
    
}



- (void)preferredFontsChanged {

    self.body.font = [ UIFont preferredFontForTextStyle: UIFontTextStyleBody ];
}





@end












