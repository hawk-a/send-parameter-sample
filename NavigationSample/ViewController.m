//
//  ViewController.m
//  NavigationSample
//
//  Created by HawkA on 2014/05/31.
//  Copyright (c) 2014年 HawkA. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Segueを使用しない場合はIBActionで遷移させる
-(IBAction)willDisplayNavigationController:(id)sender
{
    // 元となるNavigationViewControllerのインスタンスを取得。
    // その先にある値を渡すためのViewController(ResultViewController)をそこから取得
    // 値を渡す。
    UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"navigation"];
    ResultViewController *rvc = (ResultViewController *)nav.visibleViewController;
    rvc.strResult = self.input.text;
    
    // 画面遷移
    [self presentViewController:nav animated:YES completion:nil];
}

// Segueを使用する場合はdelegateメソッドで遷移(modalで繋ぐ)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 遷移元画面で入力したテキストを遷移先画面のLabelに表示させる
    UINavigationController *nav = [segue destinationViewController];
    ResultViewController *rvc = (ResultViewController *)nav.visibleViewController;
    rvc.strResult = self.input.text;
}

@end
