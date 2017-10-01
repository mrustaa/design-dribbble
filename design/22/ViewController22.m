



#import "ViewController22.h"


@interface  ViewController22 ()
< UITableViewDelegate, UITableViewDataSource > {
    int i;
}
@property (strong, nonatomic) IBOutlet  UIButton    * buttonPencil;
@property (strong, nonatomic) IBOutlet  UIButton    * buttonMessage;
@property (strong, nonatomic) IBOutlet  UIButton    * buttonTime;

@property (strong, nonatomic) IBOutlet  UIButton    * buttonAction;
@property (strong, nonatomic) IBOutlet  UIView      * view__Action;
@property (strong, nonatomic) IBOutlet  UIView      * view2_Action;

@property (strong, nonatomic) IBOutlet  UITableView * tableViewStroboard;
@property (strong, nonatomic)           UITableView * tableView;
@property (strong, nonatomic)           NSArray     * tableData;
@property (strong, nonatomic)           NSArray     * tableData2;
@property (strong, nonatomic)           NSArray     * tableData3;
@property (strong, nonatomic)           NSArray     * tableData4;

@property (strong, nonatomic) IBOutlet  UIView      * viewWeekDate;
@property (strong, nonatomic) IBOutlet  UIView      * viewWeatherLocation;

@end

@implementation ViewController22



- (BOOL)prefersStatusBarHidden { return  1;}

- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ];}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.viewWeekDate.transform           = CGAffineTransformMakeTranslation(-self.viewWeekDate.frame.size.width,0);
    self.viewWeatherLocation.transform    = CGAffineTransformMakeTranslation( self.viewWeatherLocation.frame.size.width,0);
    
    i=1;
    self.view2_Action.transform = CGAffineTransformMakeScale(.1 ,.1);
    self.buttonPencil.transform     = CGAffineTransformMakeTranslation(  0 , 15 );
    self.buttonMessage.transform    = CGAffineTransformMakeTranslation( 11 , 11 );
    self.buttonTime.transform       = CGAffineTransformMakeTranslation( 15 ,  0 );

}

- (void)animateTableCells {
    
    NSArray *cells = self.tableViewStroboard.visibleCells;
    NSLog(@"%@",cells);
    
    for ( UITableViewCell *cell in cells ) {
        NSLog(@"%@",cell);
        cell.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width,0);
    }
    CGFloat delay = 0.5;
    for ( UITableViewCell *cell in cells) {
        [UIView animateWithDuration: 0.2
                              delay: delay
             usingSpringWithDamping: 0.7
              initialSpringVelocity: 0
                            options: 0
                         animations: ^(void) { ;
                             
                             cell.transform = CGAffineTransformIdentity;
                         }  completion: ^(BOOL finished) {}  ];
        delay = delay + 0.1;
    }
    
}

-(void)viewDidAppear:(BOOL)animated { [super viewWillAppear:   animated];
    
    self.tableData  =  @[ @"Finish Home Screen",
                          @"Lunch Break",
                          @"Design Stand Up" ];
    self.tableData2 =  @[ @"Web App",   @"",  @"Hangouts" ];
    self.tableData3 =  @[ @"8"  , @"11",  @"2" ];
    self.tableData4 =  @[ @"AM" , @"AM",  @"PM" ];
    
    [self.tableViewStroboard reloadData ];
    [self animateTableCells];
    
    [UIView animateWithDuration: 0.3
                          delay: 0.3
         usingSpringWithDamping: 0.7
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void) { ;
                         self.viewWeekDate.transform     = CGAffineTransformIdentity;
                         self.viewWeatherLocation.transform    = CGAffineTransformIdentity;
                     }  completion: ^(BOOL finished) {}  ];
    
}

- (CGFloat)     tableView: (UITableView *)tableView
  heightForRowAtIndexPath: (NSIndexPath *)indexPath {
    

    
    if (self.view.frame.size.height >= 667) {
             if (indexPath.row == 0) return 68;
        else if (indexPath.row == 1) return 57 ;
        else if (indexPath.row == 2) return 118 ;

    } else {
             if (indexPath.row == 0) return 60;
        else if (indexPath.row == 1) return 48 ;
        else if (indexPath.row == 2) return 107 ;
    }
    
    
    return 1;
}

// устанавливает колличество строк
- (NSInteger)	tableView: (UITableView *)tableView
    numberOfRowsInSection: (NSInteger    )section    {
   
    return [self.tableData count];
    
}

// запускается каждый раз ... при скроллинге. отвечает за то, что будет отображаться в строках - возращает таблицу из строк
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell" ];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.numberOfLines = 0;
    
    

    UILabel *
    label = [[UILabel alloc] initWithFrame:CGRectMake(90,10, 235,24)]; // границы
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor]; //задаем цвет текста
    label.alpha = 0.9;
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label.text = self.tableData[indexPath.row];
    label.font =[UIFont fontWithName:@"HelveticaNeue" size:16] ;
    [cell addSubview: label];
    
    UILabel *
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(89,32, 235,18)]; // границы
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = [UIColor whiteColor]; //задаем цвет текста
    label2.alpha = 0.5;
    label2.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label2.text = self.tableData2[indexPath.row];
    label2.font =[UIFont fontWithName:@"HelveticaNeue" size:14] ;
    [cell addSubview: label2];
    
    UILabel *
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(77,29, 235,18)]; // границы
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor whiteColor]; //задаем цвет текста
    label3.alpha = 1;
    label3.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label3.text = self.tableData3[indexPath.row];
    label3.font =[UIFont fontWithName:@"HelveticaNeue-Light" size:25] ;
    

    
    UILabel *
    label4 = [[UILabel alloc] initWithFrame:CGRectMake(22,37,30,18)]; // границы
    label4.textAlignment = NSTextAlignmentCenter;
    label4.textColor = [UIColor whiteColor]; //задаем цвет текста
    label4.alpha = 0.7;
    label4.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label4.text = self.tableData4[indexPath.row];
    label4.font =[UIFont fontWithName:@"HelveticaNeue" size:9] ;
    
    
    if (indexPath.row != 1) { label4.frame = CGRectMake(22,37,30,18); } // границы
    else                    { label4.frame = CGRectMake(22,29,30,18); } // границы
    [cell addSubview: label4];
    
    
    if (indexPath.row != 1) { label3.frame = CGRectMake( 24, 14, 30, 18 ); }
    else                    { label3.frame = CGRectMake( 24,  6, 30, 18 ); }
    [cell addSubview: label3];
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundImage:[ UIImage imageNamed:@"ICOseparator"] forState:UIControlStateNormal];
    button.frame = CGRectMake( ((self.view.frame.size.width  /  ( 100. / 23.750000  ) )) , 0,
                              self.view.frame.size.width - ((self.view.frame.size.width  /  ( 100. / 23.750000  ) )) , 1);

    
    
    if (indexPath.row == 0) {}
    else [cell addSubview:button];
    

    UIImageView *
         imageView = [UIImageView new];
            if (self.view.frame.size.height >= 667) { imageView.frame = CGRectMake( 88, 60, 112, 30 ); }
            else                                    { imageView.frame = CGRectMake( 76, 55, 96, 25 ); }
         imageView.image = [UIImage imageNamed: @"ICOimage"];

    if (indexPath.row == 2)  [cell addSubview: imageView];

    
    return cell;
}

- (IBAction)buttonAction:(UIButton *)sender {

    
    
    [UIView animateWithDuration: 0.2
                     animations: ^(void)
    {
        if (CGAffineTransformEqualToTransform( self.buttonAction.transform , CGAffineTransformIdentity) ) {
            [self openMenu];
        } else {
            [self closeMenu];
        }
    }
                     completion: ^(BOOL finished) {  } ];
    
    if (CGAffineTransformEqualToTransform( self.buttonAction.transform , CGAffineTransformIdentity) ) {}
    else {
        [UIView animateWithDuration: 0.5
                              delay: 0.1
             usingSpringWithDamping: 0.5
              initialSpringVelocity: 0
                            options: 0
                         animations: ^(void) {
             self.buttonPencil.transform     = CGAffineTransformIdentity;
             self.buttonMessage.transform    = CGAffineTransformIdentity;
             self.buttonTime.transform       = CGAffineTransformIdentity;
         }  completion: ^(BOOL finished) {}  ];
    }
   
}
- (void)closeMenu {
    
    self.buttonAction.transform  = CGAffineTransformIdentity;
    self.view__Action.layer.backgroundColor =
    [[UIColor colorWithRed: 240.0 / 255.0
                     green:  53.0 / 255.0
                      blue: 100.0 / 255.0
                     alpha:   1           ] CGColor];
    self.view2_Action.transform = CGAffineTransformMakeScale(.1 ,.1);
    
    self.buttonPencil.transform     = CGAffineTransformMakeTranslation(  0 , 15 );
    self.buttonMessage.transform    = CGAffineTransformMakeTranslation( 11 , 11 );
    self.buttonTime.transform       = CGAffineTransformMakeTranslation( 15 ,  0 );
}

- (void)openMenu {
    
    self.buttonAction.transform  = CGAffineTransformMakeRotation(( 45 * (M_PI/180) ));
    self.view__Action.layer.backgroundColor =
    [[UIColor colorWithRed:141.0/255.0 green:61.0/255.0 blue:89.0/255.0 alpha:.5] CGColor];
    self.view2_Action.transform = CGAffineTransformIdentity;

}


@end
























