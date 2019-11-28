//
//  HBKJTextView.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/25.
//

#import "HBKJTextView.h"

@implementation HBKJTextView

#pragma mark ===初始化
-(void)awakeFromNib{
    [super awakeFromNib];
    self.placeholder=@"";
    self.placeholderColor=[UIColor lightGrayColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewChanged) name:UITextViewTextDidChangeNotification object:nil];
}

-(id)initWithFrame:(CGRect)frame{
    if ((self=[super initWithFrame:frame])) {
        self.placeholder=@"";
        self.placeholderColor=[UIColor lightGrayColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewChanged) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark ===NSNotification
-(void)textViewChanged{
    if (self.placeholder.length==0)
        return;
    if (self.text.length==0) {
        [[self viewWithTag:999] setAlpha:1];
    } else {
        [[self viewWithTag:999] setAlpha:0];
    }
}

-(void)setText:(NSString *)text{
    [super setText:text];
    [self textViewChanged];
}

-(void)drawRect:(CGRect)rect{
    if (self.placeholder.length>0) {
        if (!_placeholderLabel) {
            _placeholderLabel=[[UILabel alloc] initWithFrame:CGRectMake(5, 8, self.bounds.size.width-10, 0)];
            _placeholderLabel.lineBreakMode=NSLineBreakByWordWrapping;
            _placeholderLabel.numberOfLines=0;
            _placeholderLabel.font=self.font;
            _placeholderLabel.backgroundColor=[UIColor clearColor];
            _placeholderLabel.textColor=self.placeholderColor;
            _placeholderLabel.alpha=0;
            _placeholderLabel.tag=999;
            [self addSubview:_placeholderLabel];
        }
        _placeholderLabel.text=self.placeholder;
        [_placeholderLabel sizeToFit];
        [self sendSubviewToBack:_placeholderLabel];
    }
    if (self.text.length==0 && self.placeholder.length>0) {
        [[self viewWithTag:999] setAlpha:1];
    }
    [super drawRect:rect];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
