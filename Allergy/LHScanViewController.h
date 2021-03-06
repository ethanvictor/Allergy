//
//  LHScanViewController.h
//  Allergy
//
//  Created by Xinlei Xu on 7/11/14.
//  Copyright (c) 2014 LinkedIn Hackday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface LHScanViewController : UIViewController <ZBarReaderDelegate>{
    UITextView *resultText;
}
// NSURLConnectionDownloadDelegate
@property (nonatomic, retain) UIImageView *results;
@property (nonatomic, strong) NSString *barcode;
@property (nonatomic, strong) UIButton *scanButton;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSArray *usersAllergen;
@end
