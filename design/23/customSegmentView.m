

#import "customSegmentView.h"

IB_DESIGNABLE
@interface customSegmentView ()

@property (nonatomic) IBInspectable UIColor *обводка;
@property (nonatomic) IBInspectable CGFloat  толщина_обводки;

@property (nonatomic) IBInspectable UIColor *фон;

@property (nonatomic) IBInspectable CGFloat font;
@property (nonatomic) IBInspectable NSString *string1;

@property (nonatomic) IBInspectable UIColor *все_кнопки;
@property (nonatomic) IBInspectable UIColor *выбранная_кнопка;

@property (nonatomic) IBInspectable UIColor *выбранная_въюха;


@property (nonatomic) NSMutableArray * buttons;
@property (nonatomic) UIView *viiew;



@end



@implementation customSegmentView


-(void)buckbutton:(UIButton *)button {
     int i=-1;
    for( UIButton * btn in self.buttons ) {
        i++;
        [btn setTintColor: self.все_кнопки ];
    

        if (btn == button) {
            self.selectedSegmentIndex = i;

            [UIView animateWithDuration: 0.3
                             animations: ^(void)
             {  _viiew.frame=
                 CGRectMake( (self.frame.size.width / [self.buttons count]) * i,
                            self.viiew.frame.origin.y,
                            self.viiew.frame.size.width,
                            self.viiew.frame.size.height);  }
                             completion: ^(BOOL finished) {}
             ];
            
            [btn setTintColor: self.выбранная_кнопка ];
        }
    }
    [self sendActionsForControlEvents: UIControlEventValueChanged ];
}

- (void)drawRect:(CGRect)rect {
    
    
    // тень
    self.layer.shadowOffset 	= CGSizeMake(0,7);  					// смещение от центра
    self.layer.shadowOpacity 	= 0.12; 								// непрозрачность
    self.layer.shadowRadius 	= 6;									// уровень размытия
   self.layer.shadowColor 		=
    [ [UIColor colorWithRed: 0.0/255.0	green: 0.0/255.0 blue:0.0/255.0 alpha: 1.0        ] CGColor ];
    
    
    self.selectedSegmentIndex = 0;
    
    self.buttons = [NSMutableArray new];
    
    NSArray *arrayString1 = [_string1 componentsSeparatedByString: @","];
    
    for( id obj in self.subviews ) {
        [obj removeFromSuperview];
    }
    

    
    // ---------------------------------------------------------------------------------------

    
    for( id buttonTitle in arrayString1) {
        UIButton *
          button = [UIButton buttonWithType:UIButtonTypeSystem];
        [ button setTitle: buttonTitle forState:UIControlStateNormal];

         [button.titleLabel setFont: [UIFont fontWithName:@"HelveticaNeue-Bold" size:self.font]];

        [ button setTintColor: self.все_кнопки  ];
        
        [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
        [ self.buttons  addObject: button ];
    }
    [((UIButton *)self.buttons[0]) setTintColor: self.выбранная_кнопка ];
    
    // ---------------------------------------------------------------------------------------
    CGFloat radius;
    if ( self.bounds.size.width > self.bounds.size.height)
         { radius = self.bounds.size.height / 2; }
    else { radius = self.bounds.size.width  / 2; }
    
    self.viiew = [UIView new];
    self.viiew.frame = CGRectMake(0,0,self.frame.size.width / [arrayString1 count] ,self.frame.size.height); // 0> 0v  >> vv
    self.viiew.backgroundColor = self.выбранная_въюха;
    self.viiew.layer.cornerRadius     = radius ;
    [self addSubview:self.viiew ];
    
    
    // ---------------------------------------------------------------------------------------
    //Stack View
    UIStackView *
    stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillProportionally;
    stackView.alignment = UIStackViewAlignmentCenter;
    //stackView.spacing = 30;
     
     for ( id obj  in self.buttons   ) {
        [stackView addArrangedSubview: obj];
     }

    stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:stackView];
    /*
    //Layout for Stack View
    [stackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
    [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
    */
    [stackView.  leftAnchor constraintEqualToAnchor: self.  leftAnchor ].active = true;
    [stackView. rightAnchor constraintEqualToAnchor: self. rightAnchor ].active = true;
    [stackView.   topAnchor constraintEqualToAnchor: self.   topAnchor ].active = true;
    [stackView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor ].active = true;
    
    // ---------------------------------------------------------------------------------------


    
    //NSLog(@"\n\n класс %s [строк кода %d]", __PRETTY_FUNCTION__, __LINE__ );
    CALayer *
    llayer = [CALayer layer];
    llayer.frame = CGRectMake(
    self.bounds.origin.x-self.толщина_обводки,
    self.bounds.origin.y-self.толщина_обводки,
    self.bounds.size.width+(self.толщина_обводки*2),
    self.bounds.size.height+(self.толщина_обводки*2));
    
    llayer.borderColor      = self.обводка.CGColor;
    llayer.borderWidth      = self.толщина_обводки;
    llayer.cornerRadius     = radius ;
    llayer.backgroundColor  = [UIColor clearColor].CGColor;
    self.layer.backgroundColor  = self.фон.CGColor;
    self.layer.cornerRadius     = radius-self.толщина_обводки ;

    [self.layer addSublayer:llayer];

}

@end



















