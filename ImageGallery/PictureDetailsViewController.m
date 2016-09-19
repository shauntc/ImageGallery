//
//  PictureDetailsViewController.m
//  ImageGallery
//
//  Created by Shaun Campbell on 2016-09-19.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "PictureDetailsViewController.h"

@interface PictureDetailsViewController () <UIScrollViewDelegate>
@property (nonatomic) UIImage* picture;
@property (nonatomic) UIScrollView* scrollView;
@property (nonatomic) UIImageView* imageView;

@end

@implementation PictureDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.scrollView = [self setUpScrollView];
    
    self.imageView = [self setUpImageViewToView:self.scrollView];
    
    
    self.scrollView.contentSize = self.imageView.frame.size;
    
    self.scrollView.maximumZoomScale = 4.0;
    self.scrollView.minimumZoomScale = 0.25;
    
    
    
    
}


-(UIImageView*)setUpImageViewToView:(id)view
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.picture];
    
    [view addSubview:imageView];
    
    NSLayoutConstraint *yLoc = [NSLayoutConstraint constraintWithItem:imageView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0];
    [view addConstraint:yLoc];
    
    NSLayoutConstraint *xLoc = [NSLayoutConstraint constraintWithItem:imageView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];
    [view addConstraint:xLoc];
    
    return imageView;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


-(UIScrollView*)setUpScrollView
{
    UIScrollView *new = [[UIScrollView alloc] init];
    
    [self.view addSubview:new];
    
    new.delegate = self;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:new
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1
                                                              constant:0];
    [self.view addConstraint:width];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:new
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeHeight
                                                             multiplier:1
                                                               constant:0];
    [self.view addConstraint:height];
    
    NSLayoutConstraint *yLoc = [NSLayoutConstraint constraintWithItem:new
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:yLoc];
    
    NSLayoutConstraint *xLoc = [NSLayoutConstraint constraintWithItem:new
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:xLoc];
    
    
    return new;
}

- (instancetype)initWithPicture:(UIImage*)picture
{
    self = [super init];
    if (self) {
        _picture = picture;
        _imageView = nil;
        _scrollView = nil;
    }
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
