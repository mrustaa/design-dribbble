

#import "ViewController18_.h"
#import "ViewController18.h"
#import "TableViewCell18.h"

@interface ViewController18 () < UITableViewDelegate, UITableViewDataSource >
@property (strong, nonatomic) IBOutlet UITableView *tableView;



@property (strong, nonatomic)           NSArray     *tableDataImage;
@property (strong, nonatomic)           NSArray     *tableDataTitle;
@property (strong, nonatomic)           NSArray     *tableDataSubtitle;

@end

@implementation ViewController18

- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ]; }


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableDataImage=
  @[[UIImage imageNamed:@"1Zelda"],
    [UIImage imageNamed:@"2Link"],
    [UIImage imageNamed:@"3Epona"],
    [UIImage imageNamed:@"4Revali"],
    [UIImage imageNamed:@"5Daruk"],
    [UIImage imageNamed:@"6Urbosa"]  ];
    self.tableDataTitle=  @[ @"Zelda", @"Link", @"Epona" , @"Revali", @"Daruk", @"Urbosa"];

    
    [self.view addSubview:self.tableView];
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    //[button setBackgroundImage:[ UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"text-list-7.png"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
    
}




- (NSInteger)	tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger    )section    {

    return [self.tableDataImage count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    TableViewCell18 *cell = [[TableViewCell18 alloc] initWithStyle: UITableViewCellStyleDefault  reuseIdentifier: @"cell" ];

    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.imageVieww  = [UIImageView new];
    cell.imageVieww .frame = CGRectMake(0, 0, 90, 90);
    cell.imageVieww.contentMode =  UIViewContentModeScaleAspectFit;
    [cell addSubview: cell.imageVieww];
    
    cell.imageVieww.image = self.tableDataImage[indexPath.row];
 
    
    cell.title = [[UILabel alloc] initWithFrame:CGRectMake(116, 11, 186, 35)];
    cell.title.font = [UIFont fontWithName:@"MedulaOne-Regular" size:33];
    cell.title.textColor = [UIColor whiteColor]; //задаем цвет текста
    cell.title.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    cell.title.text = self.tableDataTitle[indexPath.row];
    [cell addSubview: cell.title];

    
    cell.subtitle = [[UITextView alloc] initWithFrame:CGRectMake(111, 49, 206, 50)];
    cell.subtitle.font = [UIFont fontWithName:@"Helvetica Neue" size:13];
    cell.subtitle.selectable = 0;
    cell.subtitle.textColor = [UIColor whiteColor]; //задаем цвет текста
    cell.subtitle.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    cell.subtitle.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipi..";
    [cell addSubview: cell.subtitle];
    
  return cell;
    
}
- (void)	  tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"!");
    

    [self performSegueWithIdentifier:@"segue"
                              sender:
     @{ @"title" : self.tableDataTitle[indexPath.row],
        @"image" : self.tableDataImage[indexPath.row]}];
}
- (void)prepareForSegue: (UIStoryboardSegue *)segue
                 sender: (id)sender {
    
    NSDictionary *dicc = sender;
    
    NSLog(@"%@ %@",[ dicc objectForKey:@"image" ],[ dicc objectForKey:@"title" ]);
    
   ViewController18_ *
    classs = segue.destinationViewController;
    [classs setup: [ dicc objectForKey:@"image" ]
            label: [ dicc objectForKey:@"title" ] ];
}
@end












