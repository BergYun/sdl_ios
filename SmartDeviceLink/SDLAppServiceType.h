//
//  SDLAppServiceType.h
//  SmartDeviceLink
//
//  Created by Nicole on 1/25/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLEnum.h"

/**
 * Enumeration listing possible app service types.
 */
typedef SDLEnum SDLAppServiceType SDL_SWIFT_ENUM;

/**
 * The app will have a service type of media.
 */
extern SDLAppServiceType const SDLAppServiceTypeMedia;

/**
 * The app will have a service type of weather.
 */
extern SDLAppServiceType const SDLAppServiceTypeWeather;

/**
 * The app will have a service type of navigation.
 */
extern SDLAppServiceType const SDLAppServiceTypeNavigation;

/**
 * The app will have a service type of voice assistant.
 */
extern SDLAppServiceType const SDLAppServiceTypeVoiceAssistant;

/**
 * The app will have a service type of generic.
 */
extern SDLAppServiceType const SDLAppServiceTypeGeneric;

/**
 * The app will have a service type of communication VOIP.
 */
extern SDLAppServiceType const SDLAppServiceTypeCommunicationVOIP;

/**
 * The app will have a service type of messaging.
 */
extern SDLAppServiceType const SDLAppServiceTypeMessaging;

/**
 * The app will have a service type of TTS.
 */
extern SDLAppServiceType const SDLAppServiceTypeTTS;
