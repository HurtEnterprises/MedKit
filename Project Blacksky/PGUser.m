//
//  PGUser.m
//  Project BlackSky
//
//  Created by Deven  on 11/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGUser.h"

// PGUser.m
@implementation PGUser

- (instancetype)initWithParticipantIdentifier:(NSString *)participantIdentifier {
    self = [super init];
    if (self) {
        _participantIdentifier = participantIdentifier;
        _firstName = participantIdentifier;
        _lastName = participantIdentifier;
        _fullName = participantIdentifier;
        _avatarInitials = [participantIdentifier substringToIndex:1];
    }
    
    return self;
}

+ (instancetype)userWithParticipantIdentifier:(NSString *)participantIdentifier {
    return [[self alloc] initWithParticipantIdentifier:participantIdentifier];
}

@end
