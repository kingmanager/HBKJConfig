//
//  HBKJTextView.h
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBKJTextView : UITextView

@property(copy,readwrite,nonatomic)NSString *placeholder;
@property(strong,readonly,nonatomic)UILabel *placeholderLabel;
@property(strong,readwrite,nonatomic)UIColor *placeholderColor;

-(void)textViewChanged;



@end

NS_ASSUME_NONNULL_END
