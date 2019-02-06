//
//  SDLPublishAppService.h
//  SmartDeviceLink
//
//  Created by Nicole on 1/25/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLRPCRequest.h"
#import "SDLAppServiceManifest.h"

/**
 *  Registers a service offered by this app on the module
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLPublishAppService : SDLRPCRequest

/**
 *  Convenience init for creating a PublishAppService request with a app service manifest.
 *
 *  @param appServiceManifest   The app service manifest
 *  @return                     A SDLPublishAppService object
 */
- (instancetype)initWithAppServiceManifest:(SDLAppServiceManifest *)appServiceManifest;

/**
 *  The manifest of the service that wishes to be published.
 *
 *  SDLAppServiceManifest, Required
 */
@property (strong, nonatomic) SDLAppServiceManifest *appServiceManifest;

@end

NS_ASSUME_NONNULL_END
