//
//  NSObject+AlertController.m
//  AppFunctionGroup
//
//  Created by yang song on 21/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#pragma mark - static_ or define variable


#import "NSObject+AlertController.h"
#import "NSObject+GeneralConroller.h"

@implementation NSObject (AlertController)

#pragma mark - Public method

- (void) showAlertWithTitle:(NSString *)title message:(NSString *)message {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"confir" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [self.thisController presentViewController:alert animated:YES completion:nil];
}
@end
