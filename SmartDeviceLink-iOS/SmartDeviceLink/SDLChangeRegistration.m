//  SDLChangeRegistration.m
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "SDLChangeRegistration.h"

#import "SDLNames.h"

@implementation SDLChangeRegistration

-(id) init {
    if (self = [super initWithName:NAMES_ChangeRegistration]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setLanguage:(SDLLanguage*) language {
    if (language != nil) {
        [parameters setObject:language forKey:NAMES_language];
    } else {
        [parameters removeObjectForKey:NAMES_language];
    }
}

-(SDLLanguage*) language {
    NSObject* obj = [parameters objectForKey:NAMES_language];
    if ([obj isKindOfClass:SDLLanguage.class]) {
        return (SDLLanguage*)obj;
    } else {
        return [SDLLanguage valueOf:(NSString*)obj];
    }
}

-(void) setHmiDisplayLanguage:(SDLLanguage*) hmiDisplayLanguage {
    if (hmiDisplayLanguage != nil) {
        [parameters setObject:hmiDisplayLanguage forKey:NAMES_hmiDisplayLanguage];
    } else {
        [parameters removeObjectForKey:NAMES_hmiDisplayLanguage];
    }
}

-(SDLLanguage*) hmiDisplayLanguage {
    NSObject* obj = [parameters objectForKey:NAMES_hmiDisplayLanguage];
    if ([obj isKindOfClass:SDLLanguage.class]) {
        return (SDLLanguage*)obj;
    } else {
        return [SDLLanguage valueOf:(NSString*)obj];
    }
}

@end