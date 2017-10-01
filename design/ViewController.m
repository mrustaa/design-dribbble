

#import "ViewController.h"

@interface MyCell : UITableViewCell

@end

@interface  ViewController ()
< UITableViewDelegate, UITableViewDataSource >

@property (strong, nonatomic)     UITableView * tableView;
@property (strong, nonatomic)     NSArray     * tableData;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:
        CGRectMake(self.view.frame.origin.x         ,
                   self.view.frame.origin.y     +20 ,
                   self.view.frame.size.width       ,
                   self.view.frame.size.height  -20 ) ];
    
    self.tableData =
                        
      @[    @"Раскраска букв в тексте + добавление контура + подсчет измененных букв"
        ,   @"Градиент, IB_DESIGNABLE, IBInspectable"
        ,   @"Создать горизонтальный UIScrollView + PageContoll \n"
        ,   @"Desing SkyApp - Login Password\n"
        ,   @"Desing Mountain - Login Password +анимированная кнопка"
        ,   @"\nDesing Trending Now - анимация градиента\n"
        ,   @"\nDesing Zelda \n"
        ,   @"\nTinder-Like-Swipe \n"
        ,   @"\nHotelCanada - горизонтальный UIPickerView \n"
        ,   @"\ndribbble \n"
        ,   @"\nInVision \n"
        ,   @"\nTravel style 1\n"
        ,   @"\nTravel style 2\n"
     ];
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;

    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:	  (BOOL)animated {
    [self.tableView reloadData];
}




- (NSInteger)	tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger    )section    {

    return [self.tableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell" ];

    cell.textLabel.text = self.tableData[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13.f];

    cell.textLabel.numberOfLines = 0;

    cell.accessoryView = [ [UIView alloc] initWithFrame:CGRectMake(0, 0, 53, 80)];
    
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.0];
    

    cell.accessoryView.layer.borderWidth = 1; 		
    cell.accessoryView.layer.borderColor = [[UIColor orangeColor]	CGColor];
    cell.accessoryView.layer.contents =
    (id)[ UIImage imageNamed: [NSString stringWithFormat:@"%d",(int)indexPath.row+1] ].CGImage;

    cell.accessoryView.layer.contentsGravity = kCAGravityResize;

    return cell;
    
}

- (void)        tableView: (UITableView *)tableView
  didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    
    
    [self performSegueWithIdentifier: [NSString stringWithFormat:@"%d",(int)indexPath.row] //@"level"
                              sender: nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }

@end
