//
//  LXMainViewController.m
//  weibo_webView
//
//  Created by xinliu on 14-12-17.
//  Copyright (c) 2014年 xinliu. All rights reserved.
//

#import "LXMainViewController.h"

@interface LXMainViewController ()<UIWebViewDelegate>
@property (weak,nonatomic) UIWebView *webView;
@property (weak,nonatomic) UIActivityIndicatorView *indicator;
@end

@implementation LXMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    self.webView = webView;
    webView.delegate = self;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:indicator];
    self.indicator = indicator;
    indicator.color = [UIColor blueColor];
    indicator.hidesWhenStopped = YES;
    indicator.center = self.webView.center;
    
    [self loadWeibo];
}

- (void)loadWeibo
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weibo.com"]];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.indicator stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",error);
    [self.indicator stopAnimating];
}
@end
