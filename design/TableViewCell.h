//
//  TableViewCell.h
//  tableImage
//
//  Created by robert on 04.09.17.
//  Copyright (c) 2017 robert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageVieww;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UITextView *subtitle;
- (void)methdo;
@end
