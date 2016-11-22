//
//  chatInstall.h
//  Project BlackSky
//
//  Created by Deven  on 11/17/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef chatInstall_h
#define chatInstall_h


#endif /* chatInstall_h */
#import <LayerKit/LayerKit.h>
#import <Atlas/Atlas.h>


@interface CustomObject : NSObject

@property (strong, nonatomic) id layerClient;

@property (strong, nonatomic) id isConnected;

- (void) verifyLayer;

- (void)layerClient:(LYRClient *)client didReceiveAuthenticationChallengeWithNonce:(NSString *)nonce;

- (void)deactivateLayer;

@end
