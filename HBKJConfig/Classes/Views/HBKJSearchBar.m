//
//  HBKJSearchbar.m
//  HBKJConfig
//
//  Created by HBKJ on 2019/10/25.
//

#import "HBKJSearchBar.h"

@implementation HBKJSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.placeholder=@"请输入关键字";
        self.searchBarStyle=UISearchBarIconSearch;
        UITextField *searchField;
        if (@available(iOS 13.0, *)) {
            searchField=self.searchTextField;
        }else{
            searchField=[self valueForKey:@"_searchField"];
        }
        NSMutableAttributedString *attrStr=[[NSMutableAttributedString alloc]initWithString:self.placeholder attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        searchField.attributedPlaceholder=attrStr;
    }
    return self;
}



@end
