//
//  SDLGetAppServiceDataResponse.m
//  SmartDeviceLink
//
//  Created by Nicole on 2/6/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLGetAppServiceDataResponse.h"

#import "NSMutableDictionary+Store.h"
#import "SDLAppServiceData.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLGetAppServiceDataResponse

- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameGetAppServiceData]) {
    }
    return self;
}

- (instancetype)initWithAppServiceData:(SDLAppServiceData *)serviceData {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.serviceData = serviceData;
    
    return self;
}

- (void)setServiceData:(SDLAppServiceData *)serviceData {
    [parameters sdl_setObject:serviceData forName:SDLRPCParameterNameServiceData];
}

- (SDLAppServiceData *)serviceData {
    return [parameters sdl_objectForName:SDLRPCParameterNameServiceData ofClass:SDLAppServiceData.class];
}

@end

NS_ASSUME_NONNULL_END
