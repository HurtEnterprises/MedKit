//
//  PGConversationListViewController.h
//  Project BlackSky
//
//  Created by Deven  on 11/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

#ifndef PGConversationListViewController_h
#define PGConversationListViewController_h
#import <LayerKit/LayerKit.h>
#import <Atlas/Atlas.h>

@interface PGConversationListViewController : ATLConversationListViewController <ATLParticipantTableViewControllerDelegate>
- (void)selectConversation:(LYRConversation *)conversation;
+ (NSSet *)participants;
@end
#endif /* PGConversationListViewController_h */
