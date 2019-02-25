//
//  SDLNavigationServiceManifest.m
//  SmartDeviceLink
//
//  Created by Nicole on 2/25/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLNavigationServiceManifest.h"

#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLNavigationServiceManifest

- (instancetype)initWithAcceptsWayPoints:(BOOL)acceptsWayPoints {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.acceptsWayPoints = @(acceptsWayPoints);

    return self;
}

- (void)setAcceptsWayPoints:(nullable NSNumber<SDLBool> *)acceptsWayPoints {
    [store sdl_setObject:acceptsWayPoints forName:SDLNameAcceptsWayPoints];
}

- (nullable NSNumber<SDLBool> *)acceptsWayPoints {
    return [store sdl_objectForName:SDLNameAcceptsWayPoints];
}

@end

NS_ASSUME_NONNULL_END
