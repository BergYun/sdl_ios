//
//  SDLPerformAppServiceInteractionResponse.h
//  SmartDeviceLink
//
//  Created by Nicole on 2/6/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLRPCResponse.h"


NS_ASSUME_NONNULL_BEGIN

/*
 *  Response to the request to request an app service.
 */
@interface SDLPerformAppServiceInteractionResponse : SDLRPCResponse

/**
 *  The service can provide specific result strings to the consumer through this param. These results should be described in the URI schema set in the Service Manifest.
 *
 *  String, Optional
 */
@property (nullable, strong, nonatomic) NSString *serviceSpecificResult;

@end

NS_ASSUME_NONNULL_END
