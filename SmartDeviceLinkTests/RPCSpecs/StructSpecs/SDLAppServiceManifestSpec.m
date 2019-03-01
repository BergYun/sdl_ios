//
//  SDLAppServiceManifestSpec.m
//  SmartDeviceLinkTests
//
//  Created by Nicole on 1/30/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLAppServiceManifest.h"
#import "SDLAppServiceType.h"
#import "SDLFunctionID.h"
#import "SDLImage.h"
#import "SDLNavigationServiceManifest.h"
#import "SDLMediaServiceManifest.h"
#import "SDLNames.h"
#import "SDLSyncMsgVersion.h"
#import "SDLWeatherServiceManifest.h"

QuickSpecBegin(SDLAppServiceManifestSpec)

describe(@"Getter/Setter Tests", ^ {
    __block NSString *testServiceName = nil;
    __block NSString *testServiceType = nil;
    __block SDLImage *testServiceIcon = nil;
    __block NSNumber<SDLBool> *testAllowAppConsumers = nil;
    __block SDLSyncMsgVersion *testRPCSpecVersion = nil;
    __block NSArray<NSNumber<SDLInt> *> *testHandledRPCs = nil;
    __block SDLWeatherServiceManifest *testWeatherServiceManifest = nil;
    __block SDLMediaServiceManifest *testMediaServiceManifest = nil;
    __block SDLNavigationServiceManifest *testNavigationServiceManifest = nil;

    beforeEach(^{
        testServiceName = @"testService";
        testServiceType = SDLAppServiceTypeMedia;
        testServiceIcon = [[SDLImage alloc] initWithName:@"testImage" isTemplate:false];
        testAllowAppConsumers = @YES;
        testRPCSpecVersion = [[SDLSyncMsgVersion alloc] initWithMajorVersion:5 minorVersion:2 patchVersion:1];
        testHandledRPCs = [[NSArray alloc] initWithObjects:[SDLFunctionID.sharedInstance functionIdForName:SDLNameAddCommand], [SDLFunctionID.sharedInstance functionIdForName:SDLNameCreateInteractionChoiceSet], nil];
        testWeatherServiceManifest = [[SDLWeatherServiceManifest alloc] initWithCurrentForecastSupported:true maxMultidayForecastAmount:3 maxHourlyForecastAmount:0 maxMinutelyForecastAmount:0 weatherForLocationSupported:false];
        testMediaServiceManifest = [[SDLMediaServiceManifest alloc] init];
        testNavigationServiceManifest = [[SDLNavigationServiceManifest alloc] init];
    });

    it(@"Should set and get correctly", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] init];
        testStruct.serviceName = testServiceName;
        testStruct.serviceType = testServiceType;
        testStruct.serviceIcon = testServiceIcon;
        testStruct.allowAppConsumers = testAllowAppConsumers;
        testStruct.rpcSpecVersion = testRPCSpecVersion;
        testStruct.handledRPCs = testHandledRPCs;
        testStruct.weatherServiceManifest = testWeatherServiceManifest;
        testStruct.mediaServiceManifest = testMediaServiceManifest;
        testStruct.navigationServiceManifest = testNavigationServiceManifest;

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(match(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(equal(testWeatherServiceManifest));
        expect(testStruct.mediaServiceManifest).to(equal(testMediaServiceManifest));
        expect(testStruct.navigationServiceManifest).to(equal(testNavigationServiceManifest));
    });

    it(@"Should get correctly when initialized with a dictionary", ^{
        NSDictionary *dict = @{SDLNameServiceName:testServiceName,
                               SDLNameServiceType:testServiceType,
                               SDLNameServiceIcon:testServiceIcon,
                               SDLNameAllowAppConsumers:testAllowAppConsumers,
                               SDLNameRPCSpecVersion:testRPCSpecVersion,
                               SDLNameHandledRPCs:testHandledRPCs,
                               SDLNameWeatherServiceManifest:testWeatherServiceManifest,
                               SDLNameMediaServiceManifest:testMediaServiceManifest,
                               SDLNameNavigationServiceManifest:testNavigationServiceManifest
                               };
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithDictionary:dict];

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(equal(testWeatherServiceManifest));
        expect(testStruct.mediaServiceManifest).to(equal(testMediaServiceManifest));
        expect(testStruct.navigationServiceManifest).to(equal(testNavigationServiceManifest));
    });

    it(@"Should init correctly with initWithServiceType:", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithServiceType:testServiceType];

        expect(testStruct.serviceName).to(beNil());
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(beNil());
        expect(testStruct.allowAppConsumers).to(beNil());
        expect(testStruct.rpcSpecVersion).to(beNil());
        expect(testStruct.handledRPCs).to(beNil());
        expect(testStruct.weatherServiceManifest).to(beNil());
        expect(testStruct.mediaServiceManifest).to(beNil());
        expect(testStruct.navigationServiceManifest).to(beNil());
    });

    it(@"Should init correctly with initWithServiceName:serviceType:serviceIcon:allowAppConsumers:rpcSpecVersion:handledRPCs:mediaServiceManifest:", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithServiceName:testServiceName serviceType:testServiceType serviceIcon:testServiceIcon allowAppConsumers:testAllowAppConsumers rpcSpecVersion:testRPCSpecVersion handledRPCs:testHandledRPCs mediaServiceManifest:testMediaServiceManifest];

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(beNil());
        expect(testStruct.mediaServiceManifest).to(equal(testMediaServiceManifest));
        expect(testStruct.navigationServiceManifest).to(beNil());
    });

    it(@"Should init correctly with initWithServiceName:serviceType:serviceIcon:allowAppConsumers:rpcSpecVersion:handledRPCs:weatherServiceManifest:", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithServiceName:testServiceName serviceType:testServiceType serviceIcon:testServiceIcon allowAppConsumers:testAllowAppConsumers rpcSpecVersion:testRPCSpecVersion handledRPCs:testHandledRPCs weatherServiceManifest:testWeatherServiceManifest];

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(equal(testWeatherServiceManifest));
        expect(testStruct.mediaServiceManifest).to(beNil());
        expect(testStruct.navigationServiceManifest).to(beNil());
    });

    it(@"Should init correctly with initWithServiceName:serviceType:serviceIcon:allowAppConsumers:rpcSpecVersion:handledRPCs:navigationServiceManifest:", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithServiceName:testServiceName serviceType:testServiceType serviceIcon:testServiceIcon allowAppConsumers:testAllowAppConsumers rpcSpecVersion:testRPCSpecVersion handledRPCs:testHandledRPCs navigationServiceManifest:testNavigationServiceManifest];

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(beNil());
        expect(testStruct.mediaServiceManifest).to(beNil());
        expect(testStruct.navigationServiceManifest).to(equal(testNavigationServiceManifest));
    });

    it(@"Should init correctly with initWithServiceName:serviceType:serviceIcon:allowAppConsumers:rpcSpecVersion:handledRPCs:mediaServiceManifest:weatherServiceManifest:navigationServiceManifest:", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] initWithServiceName:testServiceName serviceType:testServiceType serviceIcon:testServiceIcon allowAppConsumers:testAllowAppConsumers rpcSpecVersion:testRPCSpecVersion handledRPCs:testHandledRPCs mediaServiceManifest:testMediaServiceManifest weatherServiceManifest:testWeatherServiceManifest navigationServiceManifest:testNavigationServiceManifest];

        expect(testStruct.serviceName).to(match(testServiceName));
        expect(testStruct.serviceType).to(equal(testServiceType));
        expect(testStruct.serviceIcon).to(equal(testServiceIcon));
        expect(testStruct.allowAppConsumers).to(beTrue());
        expect(testStruct.rpcSpecVersion).to(equal(testRPCSpecVersion));
        expect(testStruct.handledRPCs).to(equal(testHandledRPCs));
        expect(testStruct.weatherServiceManifest).to(equal(testWeatherServiceManifest));
        expect(testStruct.mediaServiceManifest).to(equal(testMediaServiceManifest));
        expect(testStruct.navigationServiceManifest).to(equal(testNavigationServiceManifest));
    });

    it(@"Should return nil if not set", ^{
        SDLAppServiceManifest *testStruct = [[SDLAppServiceManifest alloc] init];

        expect(testStruct.serviceName).to(beNil());
        expect(testStruct.serviceType).to(beNil());
        expect(testStruct.serviceIcon).to(beNil());
        expect(testStruct.allowAppConsumers).to(beNil());
        expect(testStruct.rpcSpecVersion).to(beNil());
        expect(testStruct.handledRPCs).to(beNil());
        expect(testStruct.weatherServiceManifest).to(beNil());
        expect(testStruct.mediaServiceManifest).to(beNil());
        expect(testStruct.navigationServiceManifest).to(beNil());
    });
});

QuickSpecEnd
