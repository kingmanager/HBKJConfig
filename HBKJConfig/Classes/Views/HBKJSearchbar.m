//
//  HBKJSearchbar.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/25.
//

#import "HBKJSearchbar.h"

@implementation HBKJSearchbar

-(instancetype)initWithPlaceholder:(NSString *)placeholder{
    self=[super init];
    if (self) {
        if (placeholder.length==0 || placeholder==nil) {
            self.placeholder=@"请输入关键字";
        }else{
            self.placeholder=placeholder;
        }
        self.searchBarStyle=UISearchBarIconSearch;
        UITextField *searchField;
        if (@available(iOS 13.0, *)) {
            searchField=self.searchTextField;
        }else{
            searchField=[self valueForKey:@"_searchField"];
        }
        NSMutableAttributedString *arrStr=[[NSMutableAttributedString alloc]initWithString:self.placeholder attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        searchField.attributedPlaceholder=arrStr;
    }
    return self;
}



@end
