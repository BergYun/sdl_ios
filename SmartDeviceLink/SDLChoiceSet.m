//
//  SDLChoiceSet.m
//  SmartDeviceLink
//
//  Created by Joel Fischer on 5/21/18.
//  Copyright © 2018 smartdevicelink. All rights reserved.
//

#import "SDLChoiceSet.h"

#import "SDLChoiceCell.h"
#import "SDLLogMacros.h"
#import "SDLTTSChunk.h"
#import "SDLVrHelpItem.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLChoiceSet

static NSTimeInterval _defaultTimeout = 10.0;
static SDLChoiceSetLayout _defaultLayout = SDLChoiceSetLayoutList;

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }

    _timeout = self.class.defaultTimeout;
    _layout = self.class.defaultLayout;

    return self;
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<SDLChoiceSetDelegate>)delegate choices:(NSArray<SDLChoiceCell *> *)choices {
    return [self initWithTitle:title delegate:delegate layout:SDLChoiceSet.defaultLayout timeout:SDLChoiceSet.defaultTimeout initialPrompt:nil timeoutPrompt:nil helpPrompt:nil vrHelpList:nil choices:choices];
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<SDLChoiceSetDelegate>)delegate layout:(SDLChoiceSetLayout)layout timeout:(NSTimeInterval)timeout initialPromptString:(nullable NSString *)initialPrompt timeoutPromptString:(nullable NSString *)timeoutPrompt helpPromptString:(nullable NSString *)helpPrompt vrHelpList:(nullable NSArray<SDLVRHelpItem *> *)helpList choices:(NSArray<SDLChoiceCell *> *)choices {
    NSArray<SDLTTSChunk *> *initialTTS = [SDLTTSChunk textChunksFromString:initialPrompt];
    NSArray<SDLTTSChunk *> *timeoutTTS = [SDLTTSChunk textChunksFromString:timeoutPrompt];
    NSArray<SDLTTSChunk *> *helpTTS = [SDLTTSChunk textChunksFromString:helpPrompt];

    return [self initWithTitle:title delegate:delegate layout:layout timeout:timeout initialPrompt:initialTTS timeoutPrompt:timeoutTTS helpPrompt:helpTTS vrHelpList:helpList choices:choices];
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<SDLChoiceSetDelegate>)delegate layout:(SDLChoiceSetLayout)layout timeout:(NSTimeInterval)timeout initialPrompt:(nullable NSArray<SDLTTSChunk *> *)initialPrompt timeoutPrompt:(nullable NSArray<SDLTTSChunk *> *)timeoutPrompt helpPrompt:(nullable NSArray<SDLTTSChunk *> *)helpPrompt vrHelpList:(nullable NSArray<SDLVRHelpItem *> *)helpList choices:(NSArray<SDLChoiceCell *> *)choices {
    self = [self init];
    if (!self) { return nil; }

    if (choices.count == 0 || choices.count > 100) {
        SDLLogW(@"Attempted to create a choice set with %lu choices; Only 1 - 100 choices are valid", choices.count);
        return nil;
    }

    if (timeout < 5 || timeout > 100) {
        SDLLogW(@"Attempted to create a choice set with a %f second timeout; Only 5 - 100 seconds is valid", timeout);
        return nil;
    }

    if (title.length == 0 || title.length > 500) {
        SDLLogW(@"Attempted to create a choice set with a %lu length. Only 500 characters are supported", title.length);
        return nil;
    }

    NSMutableSet<NSString *> *choiceTextSet = [NSMutableSet setWithCapacity:choices.count];
    NSMutableSet *vrCheckSet = [NSMutableSet set];
    for (SDLChoiceCell *cell in choices) {
        [choiceTextSet addObject:cell.text];
        if (cell.voiceCommands.count > 0) {
            [vrCheckSet addObject:cell.voiceCommands];
        }
    }
    if (choiceTextSet.count < choices.count) {
        SDLLogW(@"Attempted to create a choice set with duplicate cell text. Cell text must be unique. The choice set will not be set.");
        return nil;
    }
    if (vrCheckSet.count > 0 && vrCheckSet.count < choices.count) {
        SDLLogE(@"If using voice recognition commands, all of the choice set cells must have unique VR commands. There are %lu unique VR commands and %lu choice set items. The choice set will not be set.", (unsigned long)vrCheckSet.count, (unsigned long)choices.count);
        return nil;
    }

    NSMutableArray<NSString *> *nonNilVoiceCommands = [NSMutableArray array];
    for (SDLChoiceCell *cell in choices) {
        if (cell.voiceCommands != nil) {
            [nonNilVoiceCommands addObjectsFromArray:cell.voiceCommands];
        }
    }
    NSMutableSet<NSArray<NSString *> *> *choiceVoiceCommandSet = [NSMutableSet setWithArray:nonNilVoiceCommands];
    if (choiceVoiceCommandSet.count < nonNilVoiceCommands.count) {
        SDLLogE(@"Attempted to create a choice set with duplicate voice commands. Voice commands must be unique. The choice set will not be set.");
        return nil;
    }

    for (NSUInteger i = 0; i < helpList.count; i++) {
        helpList[i].position = @(i + 1);
    }

    _title = title;
    _delegate = delegate;
    _layout = layout;
    _timeout = timeout;
    _initialPrompt = initialPrompt;
    _timeoutPrompt = timeoutPrompt;
    _helpPrompt = helpPrompt;
    _helpList = helpList;
    _choices = choices;

    return self;
}

#pragma mark - Getters / Setters

+ (NSTimeInterval)defaultTimeout {
    return _defaultTimeout;
}

+ (void)setDefaultTimeout:(NSTimeInterval)defaultTimeout {
    _defaultTimeout = defaultTimeout;
}

+ (SDLChoiceSetLayout)defaultLayout {
    return _defaultLayout;
}

+ (void)setDefaultLayout:(SDLChoiceSetLayout)defaultLayout {
    _defaultLayout = defaultLayout;
}

#pragma mark - Etc.

- (NSString *)description {
    return [NSString stringWithFormat:@"SDLChoiceSet: \"%@\", layout: %@", _title, (_layout == SDLChoiceSetLayoutList ? @"List" : @"Tiles")];
}

@end

NS_ASSUME_NONNULL_END
