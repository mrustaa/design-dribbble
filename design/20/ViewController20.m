
#import "ViewController20.h"

@interface ViewController20 () <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray *arrayPrice1;
    NSMutableArray *arrayPrice2;
    NSMutableArray *arrayDayWeek;
    NSMutableArray *arrayDayYear;
    NSMutableArray *sites;
}

@property (strong, nonatomic) IBOutlet UIPickerView *arrivalDayPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *depertureDayPicker;

@end

@implementation ViewController20
- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ];}


- (void)viewDidLoad {
    
    
    [super viewDidLoad];

    arrayPrice1  = [[NSMutableArray alloc] init];
    arrayPrice2  = [[NSMutableArray alloc] init];
    arrayDayWeek = [[NSMutableArray alloc] init];
    arrayDayYear = [[NSMutableArray alloc] init];
    
    arrayPrice1 = [@[ @"80", @"75", @"70", @"100", @"120", @"95", @"70", @"100"]mutableCopy];
    arrayPrice2 = [@[ @"80", @"75", @"70", @"70", @"100", @"120", @"95", @"80" ]mutableCopy];
    
    arrayDayWeek = [@[
                     @"Monday",
                     @"Tuesday",
                     @"Wednesday",
                     @"Thursday",
                     @"Friday",
                     @"Saturday",
                     @"Sunday",
                     @"Monday",
                     ]mutableCopy];
    arrayDayYear = [@[
                     @"01 MAY 2017",
                     @"02 MAY 2017",
                     @"03 MAY 2017",
                     @"04 MAY 2017",
                     @"05 MAY 2017",
                     @"06 MAY 2017",
                     @"07 MAY 2017",
                     @"08 MAY 2017",
                    ] mutableCopy];

    
    sites = [[NSMutableArray alloc] init];
    [sites addObject:@"Canada"];
    [sites addObject:@"USA"];
    

    
    CGFloat  y = _depertureDayPicker.frame.origin.y;
    _depertureDayPicker.transform = CGAffineTransformMakeRotation( -90 * (M_PI / 180));
    _depertureDayPicker.frame = CGRectMake(-75, y, self.view.frame.size.width  + 150, 162);
    _depertureDayPicker.delegate    = self ;
    _depertureDayPicker.dataSource  = self ;
    
    
    
    y = _arrivalDayPicker.frame.origin.y;
    _arrivalDayPicker.transform = CGAffineTransformMakeRotation( -90 * (M_PI / 180));
    _arrivalDayPicker.frame = CGRectMake( -75, y,   self.view.frame.size.width + 150  , 162);
    _arrivalDayPicker.delegate      = self ;
    _arrivalDayPicker.dataSource    = self ;
    [_arrivalDayPicker selectRow:2 inComponent:0 animated:1];
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    //[button setBackgroundImage:[ UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor blackColor]];
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
    
    
}
// колличество компонентов
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {    return 1;}

// колличетсво ячеек
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [arrayDayWeek count];
}
// размер одной ячейки
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {    return 88;}
// если хочешь вернуть ячейку только с текстом
-(NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"";}
// если хочешь вернуть View
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIView *
    viiew = [UIView new];
    viiew.frame = CGRectMake(0,0,88,88); // 0> 0v  >> vv
    viiew.backgroundColor = [UIColor clearColor];
    // _________________________________________
    UILabel *
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 88, 21)]; // границы
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor]; //задаем цвет текста
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label.text =  [arrayDayWeek objectAtIndex:row]; //какой-нибудь текст
    [viiew addSubview: label]; //добавляем наш текст в иерархию View
    // _________________________________________
    UILabel *
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 23, 88, 38)]; // границы
    label2.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:37.f];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor]; //задаем цвет текста
    label2.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label2.text = [NSString stringWithFormat:@"$%@", [arrayPrice2 objectAtIndex:row]]; //какой-нибудь текст
    [viiew addSubview: label2]; //добавляем наш текст в иерархию View
    // _________________________________________
    UILabel *
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 62, 88, 21)]; // границы
    label3.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor whiteColor]; //задаем цвет текста
    label3.backgroundColor = [UIColor colorWithWhite:0 alpha:0]; //создаем прозрачный фон,
    label3.text =  [arrayDayWeek objectAtIndex:row]; //какой-нибудь текст
    [viiew addSubview: label3]; //добавляем наш текст в иерархию View

    viiew.transform = CGAffineTransformMakeRotation( 90 * (M_PI / 180));
    
    return  viiew;

}


@end
