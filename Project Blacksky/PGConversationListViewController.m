//
//  PGConversationListViewController.m
//  Project BlackSky
//
//  Created by Deven  on 11/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGConversationListViewController.h"
#import "PGConversationViewController.h"
#import "PGUser.h"

@implementation PGConversationListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set data source and delegate
    self.dataSource = self;
    self.delegate = self;
    
    // Add a create chat button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewChat:)];
}

#pragma mark - Conversation List Data Source

- (NSString *)conversationListViewController:(ATLConversationListViewController *)conversationListViewController titleForConversation:(LYRConversation *)conversation {
    NSMutableSet *participantIdentifiers = [conversation.participants mutableCopy];
    [participantIdentifiers minusSet:[NSSet setWithObject:self.layerClient.authenticatedUser]];
    
    if (participantIdentifiers.count == 0) return @"Personal Conversation";
    NSMutableSet *participants = [[self participantsForIdentifiers:participantIdentifiers] mutableCopy];
    if (participants.count == 0) return @"No Matching Participants";
    if (participants.count == 1) return [[participants allObjects][0] fullName];
    
    NSMutableArray *firstNames = [NSMutableArray new];
    [participants enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        id <ATLParticipant> participant = obj;
        if (participant.firstName) {
            // Put the last message sender's name first
            if ([conversation.lastMessage.sender isEqual:participant.userID]) {
                [firstNames insertObject:participant.firstName atIndex:0];
            } else {
                [firstNames addObject:participant.firstName];
            }
        }
    }];
    NSString *firstNamesString = [firstNames componentsJoinedByString:@", "];
    return firstNamesString;
}

#pragma mark - Conversation List Delegate

- (void)conversationListViewController:(ATLConversationListViewController *)conversationListViewController didSelectConversation:(LYRConversation *)conversation {
    [self presentConversationControllerForConversation:conversation];
}

#pragma mark - Participant Delegate

- (void)participantTableViewController:(ATLParticipantTableViewController *)participantTableViewController didSelectParticipant:(id <ATLParticipant>)participant {
    [self.navigationController popViewControllerAnimated:NO];
    
    // Create a new conversation
    NSError *error = nil;
    LYRConversation *conversation = [self.layerClient newConversationWithParticipants:[NSSet setWithArray:@[self.layerClient.authenticatedUser, participant.userID]] options:nil error:&error];
    if (!conversation) {
        NSLog(@"New Conversation creation failed: %@", error);
    } else {
        [self presentConversationControllerForConversation:conversation];
    }
}

- (void)participantTableViewController:(ATLParticipantTableViewController *)participantTableViewController didSearchWithString:(NSString *)searchText completion:(void (^)(NSSet *filteredParticipants))completion {
}

#pragma mark - Helpers

- (void)presentConversationControllerForConversation:(LYRConversation *)conversation {
    ATLConversationViewController *conversationViewController = [PGConversationViewController conversationViewControllerWithLayerClient:self.layerClient];
    conversationViewController.conversation = conversation;
    [self.navigationController pushViewController:conversationViewController animated:YES];
}

- (NSSet *)participantsForIdentifiers:(NSSet *)identifiers {
    NSMutableSet *participants = [[NSMutableSet alloc] initWithCapacity:identifiers.count];
    for (NSString *identifier in identifiers) {
        [participants addObject:[PGUser userWithParticipantIdentifier:identifier]];
    }
    return participants;
}

#pragma mark - User Interaction

- (void)createNewChat:(id)sender {
    ATLParticipantTableViewController *participantTableViewController = [ATLParticipantTableViewController participantTableViewControllerWithParticipants:[PGConversationListViewController participants] sortType:ATLParticipantPickerSortTypeFirstName];
    participantTableViewController.delegate = self;
    [self.navigationController pushViewController:participantTableViewController animated:YES];
}

#pragma mark - Static

+ (NSSet *)participants {
    
    __block NSSet *participants;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        participants = [NSSet setWithArray:@[[PGUser userWithParticipantIdentifier:@"Device"], [PGUser userWithParticipantIdentifier:@"Simulator"]]];
    });
    return participants;
}

@end
