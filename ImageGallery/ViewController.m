//
//  ViewController.m
//  ImageGallery
//
//  Created by Shaun Campbell on 2016-09-19.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "ViewController.h"
#import "PictureDetailsViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) NSArray <UIImageView*>* imageViews;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Static array of images to produce from
    NSArray *pictures = @[
                          [UIImage imageNamed:@"Lighthouse-night"],
                          [UIImage imageNamed:@"Lighthouse-in-Field"],
                          [UIImage imageNamed:@"Lighthouse-zoomed"]
                          ];
    
    
    
    self.scrollView.pagingEnabled = YES;
    
    self.imageViews = [self setUpImageViews:pictures];
    
    [self.scrollView setNeedsLayout];


}


-(NSArray*)setUpImageViews:(NSArray <UIImage *>*)pictures
{
    
    float space = 0;
    NSArray *imageViews = @[];
    
    for(UIImage *image in pictures)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.backgroundColor = [UIColor lightGrayColor];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.scrollView addSubview:imageView];
        
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:imageView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.scrollView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0];
        [self.scrollView addConstraint:width];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:imageView
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.scrollView
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0];
        [self.scrollView addConstraint:height];
        
        NSLayoutConstraint *yLoc = [NSLayoutConstraint constraintWithItem:imageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0];
        [self.scrollView addConstraint:yLoc];
        
        NSLayoutConstraint *xLoc = [NSLayoutConstraint constraintWithItem:imageView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1
                                                                 constant:space];
        [self.scrollView addConstraint:xLoc];
        
        space += self.scrollView.frame.size.width;
        
        
        imageViews = [imageViews arrayByAddingObject:imageView];
        
        
    }
    
    
    
    self.scrollView.contentSize = CGSizeMake(space, self.scrollView.frame.size.height);
    
    return imageViews;
    
    
}





- (IBAction)tapDetected:(UITapGestureRecognizer *)sender {
    
    for(UIImageView* imageView in self.imageViews)
    {
        if(CGRectContainsPoint(imageView.frame, [sender locationInView:self.scrollView]))
        {
            [self presentDetailsControllerForImage:imageView.image];
            
        }
    }
    
}


-(void)presentDetailsControllerForImage:(UIImage *)image
{
    PictureDetailsViewController *new = [[PictureDetailsViewController alloc] initWithPicture:image];
    
    [self.navigationController pushViewController:new animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
