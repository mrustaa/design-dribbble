

#import "tableViewCell17.h"

@implementation tableViewCell17


- (void)setupImage:(UIImage *)image {
    self.cellImage  = [UIImageView new];
    self.cellImage .frame = CGRectMake(0, 0, 375 , 320);
    
    self.cellImage .contentMode = UIViewContentModeScaleToFill;
    [self addSubview: self.cellImage];
    self.cellImage.image = image;

    
}

@end
