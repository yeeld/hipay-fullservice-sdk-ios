//
//  HPTForwardSafariViewController.m
//  Pods
//
//  Created by Jonathan TIRET on 29/10/2015.
//
//

#import "HPTForwardSafariViewController.h"
#import "HPTForwardViewController_Protected.h"

@interface HPTForwardSafariViewController ()

@end

@implementation HPTForwardSafariViewController

- (instancetype)initWithTransaction:(HPTTransaction *)transaction
{
    self = [super initWithTransaction:transaction];
    if (self) {
        [self initializeComponentsWithURL:transaction.forwardUrl];
    }
    return self;
}

- (instancetype)initWithHostedPaymentPage:(HPTHostedPaymentPage *)hostedPaymentPage
{
    self = [super initWithHostedPaymentPage:hostedPaymentPage];
    if (self) {
        [self initializeComponentsWithURL:hostedPaymentPage.forwardUrl];
    }
    return self;
}

- (void)initializeComponentsWithURL:(NSURL *)URL
{
    safariViewController = [[SFSafariViewController alloc] initWithURL:URL];
    safariViewController.delegate = self;    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:safariViewController];
    [self.view addSubview:safariViewController.view];
    
    safariViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:safariViewController.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:safariViewController.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:safariViewController.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:safariViewController.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.hidesWhenStopped = YES;
    spinner.color = [UIColor darkGrayColor];
    spinner.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:spinner];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [self cancelBackgroundTransactionLoading];
    [self.delegate forwardViewControllerDidCancel:self];
}

+ (BOOL)isCompatible
{
    return NSClassFromString(@"SFSafariViewController") != nil;
}

@end
