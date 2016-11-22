//
//  PGUser.h
//  Project BlackSky
//
//  Created by Deven  on 11/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef PGUser_h
#define PGUser_h
#endif /* PGUser_h */

// PGUser.h

#import <LayerKit/LayerKit.h>
#import <Atlas/Atlas.h>

@interface PGUser : NSObject <ATLParticipant, ATLAvatarItem>

@property(nonatomic, readonly) NSString *firstName;
@property(nonatomic, readonly) NSString *lastName;
@property(nonatomic, readonly) NSString *fullName;
@property(nonatomic, readonly) NSString *participantIdentifier;
@property(nonatomic, readonly) UIImage *avatarImage;
@property(nonatomic, readonly) NSString *avatarInitials;

- (instancetype)initWithParticipantIdentifier:(NSString *)participantIdentifier;

+ (instancetype)userWithParticipantIdentifier:(NSString *)participantIdentifier;


@end

