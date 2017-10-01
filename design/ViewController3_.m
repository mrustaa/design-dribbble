
#import "ViewController3_.h"

@interface ViewController3_ ()

@property (weak, nonatomic) IBOutlet UIView *popupView;

@end



@implementation ViewController3_
-(void)setup:(UIImage *)img label:(NSString *)lbl {
    NSLog(@"%d %@",!!_laabbel  , lbl);

    
    
    for( id obj in self.view.subviews) {
        NSLog(@"%@",[obj class]);
        if ([[obj class] isEqual: [UIView class]] ) {
            for( __strong id obj2 in ((UIView *)obj).subviews) {
                if ([[obj2 class] isEqual: [UILabel class]] ) {
                    ((UILabel *)obj2).text = lbl;
                }
                if ([[obj2 class] isEqual: [UIImageView class]] ) {
                    ((UIImageView *)obj2).image = img;
                }
                    
            }
        }
    }
    
}
- (void)viewDidLoad {
    
    self.popupView.layer.cornerRadius  = 20;
    self.popupView.layer.masksToBounds = true;
    
}

- (IBAction)closeBttn:(UIButton *)sender {
    // presentingViewController - контроллер который представил этот класс
    [self.presentingViewController dismissViewControllerAnimated: YES // dismissViewControllerAnimated 	удаляет с экрана этот класс
                                                      completion: NULL ];
    
    
}



@end
