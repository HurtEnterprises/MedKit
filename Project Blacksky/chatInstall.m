//
//  chatInstall.m
//  
//
//  Created by Deven  on 11/17/16.
//
//

#import <Foundation/Foundation.h>
#import "chatInstall.h"
#import <LayerKit/LayerKit.h>
#import <Atlas/Atlas.h>

@implementation CustomObject : NSObject
static NSString *const kLayerAppID = @"layer:///apps/staging/bb8517a4-207d-11e6-99e9-0700d2050d6f"; // TODO Update layer app id here

-(void) verifyLayer {
    NSURL *appID = [NSURL URLWithString:@"layer:///apps/staging/bb8517a4-207d-11e6-99e9-0700d2050d6f"];
    
    self.layerClient = [LYRClient clientWithAppID:appID options:nil];
    [_layerClient connectWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"Sucessfully connected to Layer!");
        } else {
            NSLog(@"Failed connection to Layer with error: %@", error);
        }
    }];
    
    [_layerClient requestAuthenticationNonceWithCompletion:^(NSString *nonce, NSError *error) {
        
        /*
         * 2. Connect to your backend to generate an identity token.
         */
        NSString *identityToken = @"ErWniUj2abklI8N8sooKT74WGUd5Egl8cEGUrxlmRjGDwa5h";
        
        /*
         * 3. Submit identity token to Layer for validation
         */
        [_layerClient authenticateWithIdentityToken:identityToken completion:^(LYRIdentity *authenticatedUser, NSError *error) {
            if (authenticatedUser) {
                NSLog(@"Authenticated as User: %@", authenticatedUser);
            }
        }];
    }];
    
    
//    // Setup Layer
//    NSURL *appID = [NSURL URLWithString:@"layer:///apps/staging/bb8517a4-207d-11e6-99e9-0700d2050d6f"];
//    self.layerClient = [LYRClient clientWithAppID:appID options:nil];
//    self.layerClient.autodownloadMIMETypes = [NSSet setWithObjects:ATLMIMETypeImageJPEGPreview, ATLMIMETypeTextPlain, nil];
//    [self.layerClient connectWithCompletion:^(BOOL success, NSError *error) {
//        if (!success) {
//            NSLog(@"Failed to connect to Layer: %@", error);
//        } else {
//            // TODO This will usually be in a view controller after the user authenticates
//            // For the purposes of this Quick Start project, let's authenticate as a user named 'Device/Simulator'.
//#if TARGET_IPHONE_SIMULATOR
//            NSString *userIDString = @"Simulator";
//#else // TARGET_IPHONE_SIMULATOR
//            NSString *userIDString = @"Device";
//#endif // TARGET_IPHONE_SIMULATOR
//            
//            // Once connected, authenticate user.
//            // Check Authenticate step for authenticateLayerWithUserID source
//            [_layerClient requestAuthenticationNonceWithCompletion:^(NSString *nonce, NSError *error) {
//                        /*
//                         * 2. Connect to your backend to generate an identity token.
//                         */
//                        NSString *identityToken = @"ErWniUj2abklI8N8sooKT74WGUd5Egl8cEGUrxlmRjGDwa5h";
//                
//                        /*
//                         * 3. Submit identity token to Layer for validation
//                         */
//                        [_layerClient authenticateWithIdentityToken:identityToken completion:^(LYRIdentity *authenticatedUser, NSError *error) {
//                            if (authenticatedUser) {
//                                NSLog(@"Authenticated as User: %@", authenticatedUser);
//                            }
//                        }];
//                    }];
//        }
//    }];
}


- (void)layerClient:(LYRClient *)client didReceiveAuthenticationChallengeWithNonce:(NSString *)nonce
{
    NSLog(@"Layer Client did receive an authentication challenge with nonce=%@", nonce);
    
    /*
     * 1. Connect to your backend to generate an identity token using the provided nonce.
     */
    //TODO: @Mehrab
    NSString *identityToken = @"ErWniUj2abklI8N8sooKT74WGUd5Egl8cEGUrxlmRjGDwa5h";
    
    /*
     * 2. Submit identity token to Layer for validation
     */
    [_layerClient authenticateWithIdentityToken:identityToken completion:^(LYRIdentity *authenticatedUser, NSError *error) {
        if (authenticatedUser) {
            NSLog(@"Authenticated as User: %@", authenticatedUser);
        }
    }];
}

-(void)deactivateLayer{
    [self.layerClient deauthenticateWithCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"Failed to deauthenticate user: %@", error);
        } else {
            NSLog(@"User was deauthenticated");
        }
    }];
}

@end
