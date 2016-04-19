//
//  FirstViewController.m
//  CSUsedInfoApp
//
//  Created by ZihaoLin on 4/10/16.
//  Copyright © 2016 ZihaoLin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<DDRichTextViewDelegate,DDRichTextViewDataSource>

@end

@implementation MainViewController{
  NSMutableArray *ymDataArray;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //图片支持网络异步加载
  NSMutableArray *_imageDataSource = [NSMutableArray arrayWithCapacity:0];
  [_imageDataSource addObject:@"https://octodex.github.com/images/privateinvestocat.jpg"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/gracehoppertocat.jpg"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/jetpacktocat.png"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/minertocat.png"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/luchadortocat.png"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/saritocat.png"];
  [_imageDataSource addObject:@"https://octodex.github.com/images/steroidtocat.png"];
  
  NSMutableArray *_replyDataSource = [[NSMutableArray alloc] init];//回复数据来源
  //[_replyDataSource addObject:@"@Della:@戴伟来 DDRichText棒棒哒！ @daiweilai： @daiweilai @戴伟来:I am Della，这是一个IOS库[em:01:][em:02:][em:03:]"];
  
  ymDataArray =[[NSMutableArray alloc]init];
  
  YMTextData *ymData = [[YMTextData alloc] init];
  ymData.showImageArray = _imageDataSource;
  ymData.foldOrNot = YES;
  ymData.showShuoShuo = @"这是二手信息一级界面的初步模板展示";
  ymData.replyDataSource = _replyDataSource;
  ymData.name = @"Jeremy";
  ymData.intro = @"2016-4-17";
  ymData.headPicURL = @"headPic@2x.png";
  [ymDataArray addObject:ymData];
  self.delegate = self;
  self.dataSource = self;
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - DDRichTextViewController data source
- (NSString *)senderName{
  return @"Jeremy";
}

- (NSInteger)numberOfRowsInDDRichText{
  return 2;
}

- (YMTextData *)dataForRowAtIndex:(NSInteger)index{
  return [ymDataArray objectAtIndex:0];
}

- (BOOL)hideReplyButtonForIndex:(NSInteger)index{
  return YES;
}

-(void)didPromulgatorNameOrHeadPicPressedForIndex:(NSInteger)index name:(NSString *)name{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"浏览发布者个人主页" message:[NSString stringWithFormat:@"姓名：%@\n index：%ld",name,(long)index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
  [alert show];
}


-(void)didRichTextPressedFromText:(NSString*)text index:(NSInteger)index{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"浏览本条二手信息" message:[NSString stringWithFormat:@"点击的内容：%@\n index：%ld",text,(long)index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
  [alert show];
}

/*-(void)didRichTextPressedFromText:(NSString *)text index:(NSInteger)index replyIndex:(NSInteger)replyIndex{
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"评论的富文本点击回调" message:[NSString stringWithFormat:@"点击的内容：%@\n index：%ld \n replyIndex:%ld",text,(long)index,(long)replyIndex] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
 [alert show];
 }
 
 -(void)replyForIndex:(NSInteger)index replyText:(NSString*)text{
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"回复的回调" message:[NSString stringWithFormat:@"回复的内容：%@\n index：%ld",text,(long)index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
 [alert show];
 }*/


@end
