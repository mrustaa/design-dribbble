




#import "ViewController13.h"
#import "UIImage+animatedGIF.h"

@interface ViewController13 () <UIScrollViewDelegate >

@property (strong, nonatomic) IBOutlet UIImageView *urlImageView;

@property (strong, nonatomic) IBOutlet UITableView   *tableView;
@property (strong, nonatomic)          NSArray       *tableData;

@property (strong, nonatomic) IBOutlet UIScrollView  *featureScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *featurePageControll;

@property (strong, nonatomic) NSDictionary *feature1;
@property (strong, nonatomic) NSDictionary *feature2;
@property (strong, nonatomic) NSDictionary *feature3;

@property (strong, nonatomic) NSArray  *featureArray;

@end

@implementation ViewController13

- (IBAction)buckbutton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    old=0;

    self.urlImageView.image =
    [UIImage animatedImageWithAnimatedGIFURL:
     [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"1test"]
                             withExtension:@"gif"]];
    
    
    _featurePageControll.pageIndicatorTintColor =[UIColor colorWithRed: 108.0/255.0 green: 108.0/255.0 blue: 129.0/255.0 alpha: 1.0];
    _featurePageControll.currentPageIndicatorTintColor=[UIColor colorWithRed: 179.0/255.0 green: 155.0/255.0 blue: 165.0/255.0 alpha:1.0];

    
    _feature1 = @{ @"title": @"Mountain"       , @"views": @"Views: 70,130", @"likes": @"Likes: 2,257", @"image": @"!1" };
    _feature2 = @{ @"title": @"Egypt pyramids" , @"views": @"Views: 20,594", @"likes": @"Likes: 927"  , @"image": @"!2" };
    _feature3 = @{ @"title": @"Dream"          , @"views": @"Views: 35,232", @"likes": @"Likes: 1,446", @"image": @"!3" };



    _featureArray = @[ _feature1, _feature2 , _feature3 ];
    

    _featureScrollView.pagingEnabled = 1;    // По умолчанию НЕТ. 	как я понял. остановится когда передет границы 1 вьюхи на 2 вьюху
    
     // это размер,области прокручивания,как далеко можно заходить, по картинке. картинка может быть маленькой, а облась большой
    _featureScrollView.contentSize = CGSizeMake (self.view.bounds.size.width * [_featureArray count], 0);
    
    [self loadFeatures];
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[ UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
    
}
- (void)loadFeatures {
    int i=0;
    
     for( NSDictionary *feature in _featureArray ) { 
    
         UIView *
         view = [UIView new];
         view.frame = CGRectMake(0, 0, self.view.frame.size.width , 214);
         view.backgroundColor = [UIColor colorWithRed: 55.0/255.0 green: 54.0/255.0 blue: 63.0/255.0 alpha: 1.0];
         
         UILabel *
         scaleNumber = [[UILabel alloc] initWithFrame:CGRectMake(32, 59, 170, 23)]; // границы
         scaleNumber.font = [UIFont systemFontOfSize:24];
         scaleNumber.textColor = [UIColor whiteColor]; //задаем цвет текста
         scaleNumber.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
         scaleNumber.text = [feature objectForKey:@"title"] ;
         scaleNumber.adjustsFontSizeToFitWidth = YES; //можно сделать, чтобы текст автоматически уменьшался,
         [view addSubview:scaleNumber]; //добавляем наш текст в иерархию View
         
         UILabel *
         label = [[UILabel alloc] initWithFrame:CGRectMake(32, 114, 145, 23)]; // границы
         label.font = [UIFont systemFontOfSize:16];
         label.textColor = [UIColor whiteColor]; //задаем цвет текста
         label.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
         label.text = [feature objectForKey:@"likes"] ;
         label.adjustsFontSizeToFitWidth = YES; //можно сделать, чтобы текст автоматически уменьшался,
         [view addSubview: label]; //добавляем наш текст в иерархию View
         
         UILabel *
         label2 = [[UILabel alloc] initWithFrame:CGRectMake(32, 137, 145, 23)]; // границы
         label2.font = [UIFont systemFontOfSize:14];
         label2.textColor = [UIColor whiteColor]; //задаем цвет текста
         label2.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
         label2.text =  [feature objectForKey:@"views"] ;
         label2.adjustsFontSizeToFitWidth = YES; //можно сделать, чтобы текст автоматически уменьшался,
         [view addSubview: label2]; //добавляем наш текст в иерархию View
         
         UIImageView *
         imageView = [UIImageView new];
         imageView.frame = CGRectMake( self.view.frame.size.width - 128 ,58, 104, 104);
         imageView.image = [UIImage imageNamed: [feature objectForKey:@"image"] ] ;
         [view addSubview: imageView];
         
         
         
         view.frame = CGRectMake
         ( i * self.view.bounds.size.width ,
          view.frame.origin.y,
          view.frame.size.width,
          view.frame.size.height );
         
         [_featureScrollView addSubview: view ];

         i++;

    }
}

int old;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if(_featureScrollView == scrollView)
        _featurePageControll.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    int y = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    
    NSString *str;
    
    UIApplication *appl = [UIApplication sharedApplication];
    UIColor *colr1 ;
    UIColor *colr2 ;
    
         if ( y == 0 ) {
        str=@"1";
        [appl setStatusBarStyle:UIStatusBarStyleLightContent animated:1 ];
        colr1 = [UIColor colorWithRed: 179.0/255.0 green: 155.0/255.0 blue: 165.0/255.0 alpha: 1.0];
        colr2 = [UIColor colorWithRed: 108.0/255.0 green: 108.0/255.0 blue: 129.0/255.0 alpha: 1.0];
    }
    else if ( y == 1 ) {
        str=@"2";
        [appl setStatusBarStyle:UIStatusBarStyleLightContent animated:1 ];
        colr1 = [UIColor colorWithRed: 128.0/255.0 green: 200.0/255.0 blue: 172.0/255.0 alpha: 1.0];
        colr2 = [UIColor colorWithRed: 108.0/255.0 green: 108.0/255.0 blue: 129.0/255.0 alpha: 1.0];
    }
    else if ( y == 2 ) {
        str=@"3";
        [appl setStatusBarStyle:UIStatusBarStyleDefault animated:1 ];
        colr1 = [UIColor colorWithRed: 211.0/255.0 green: 190.0/255.0 blue: 138.0/255.0 alpha: 1.0];
        colr2 = [UIColor colorWithRed:  55.0/255.0 green:  54.0/255.0 blue:  63.0/255.0 alpha: 1.0];
        
    }
    
    if (old != y ) {
        

        
        
        [UIView animateWithDuration: 0.3 
                         animations: ^(void) {
                             self.urlImageView.alpha = 0.0;
                         }
                         completion: ^(BOOL finished) {
                             [UIView animateWithDuration:0.8 animations:^{  self.urlImageView.alpha = 1.0; }];
                         } ];
        
             
       
        self.urlImageView.image =
        [UIImage animatedImageWithAnimatedGIFURL:
         [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@test",str]
                                 withExtension:@"gif"]];
        

        
        _featurePageControll.pageIndicatorTintColor = colr2;
        _featurePageControll.currentPageIndicatorTintColor= colr1;
        NSLog(@"%d",y);
    }
    old = y;
}

-(UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }

@end




































