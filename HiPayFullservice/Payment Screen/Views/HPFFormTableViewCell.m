//
//  HPFFormTableViewCell.m
//  Pods
//
//  Created by Jonathan TIRET on 06/11/2015.
//
//

#import "HPFFormTableViewCell.h"

@implementation HPFFormTableViewCell

- (void)awakeFromNib
{
    defaultTextLabelColor = self.textLabel.textColor;
}

- (BOOL)isValid
{
    return YES;
}

- (void)setEnabled:(BOOL)enabled
{
    _enabled = enabled;
    
    self.userInteractionEnabled = enabled;
}

@end
