//
//  HPTForwardPaymentProductViewController.m
//  Pods
//
//  Created by Jonathan TIRET on 27/10/2015.
//
//

#import "HPTForwardPaymentProductViewController.h"
#import "HPTGatewayClient.h"
#import <SafariServices/SafariServices.h>
#import <WebKit/WebKit.h>
#import "HPTForwardViewController.h"
#import "HPTAbstractPaymentProductViewController_Protected.h"
#import "HPTPaymentScreenLocalization.h"

@interface HPTForwardPaymentProductViewController ()

@end

@implementation HPTForwardPaymentProductViewController

- (instancetype)initWithPaymentPageRequest:(HPTPaymentPageRequest *)paymentPageRequest andSelectedPaymentProduct:(HPTPaymentProduct *)paymentProduct
{
    self = [super initWithPaymentPageRequest:paymentPageRequest];
    if (self) {
        _paymentProduct = paymentProduct;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Forward controller

- (void)forwardViewControllerDidCancel:(HPTForwardViewController *)viewController
{
    [self refreshTransactionStatus:transaction];
}

- (void)forwardViewController:(HPTForwardViewController *)viewController didEndWithTransaction:(HPTTransaction *)theTransaction
{
    [self checkTransactionStatus:theTransaction];
}

- (void)forwardViewController:(HPTForwardViewController *)viewController didFailWithError:(NSError *)error
{
    [self checkTransactionError:error];
}

#pragma mark - Payment workflow

- (HPTOrderRequest *)createOrderRequest
{
    HPTOrderRequest *orderRequest = [[HPTOrderRequest alloc] initWithOrderRelatedRequest:self.paymentPageRequest];
    
    orderRequest.paymentProductCode = self.paymentProduct.code;
    
    return orderRequest;
}

- (void)paymentButtonTableViewCellDidTouchButton:(HPTPaymentButtonTableViewCell *)cell
{
    HPTOrderRequest *orderRequest = [self createOrderRequest];
    
    [super setPaymentButtonLoadingMode:YES];
    
    [[HPTGatewayClient sharedClient] requestNewOrder:orderRequest withCompletionHandler:^(HPTTransaction *theTransaction, NSError *error) {
       
        if (theTransaction != nil) {
            transaction = theTransaction;
            
            if (transaction.forwardUrl != nil) {
                
                HPTForwardViewController *viewController = [HPTForwardViewController relevantForwardViewControllerWithTransaction:transaction];
                
                viewController.delegate = self;
                
                [self presentViewController:viewController animated:YES completion:nil];
            }
            
            else {
                [self checkTransactionStatus:transaction];
            }
        }
        
        else {
            [self checkTransactionError:error];
        }
        
        [super setPaymentButtonLoadingMode:NO];

    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        
        return [NSString stringWithFormat:HPTLocalizedString(@"PAY_WITH_THIS_METHOD"), self.paymentProduct.paymentProductDescription];
    }
    
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    if (section == (self.tableView.numberOfSections - 1)) {
        return HPTLocalizedString(@"PAYMENT_REDIRECTION_DETAILS");
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HPTPaymentButtonTableViewCell *cell = [super dequeuePaymentButtonCell];
    
    cell.delegate = self;
    
    return cell;
}


@end
