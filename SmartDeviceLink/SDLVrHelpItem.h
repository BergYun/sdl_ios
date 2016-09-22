//  SDLVRHelpItem.h
//

#import "SDLRPCMessage.h"

@class SDLImage;


@interface SDLVRHelpItem : SDLRPCStruct

@property (strong) NSString *text;
@property (strong) SDLImage *image;
@property (strong) NSNumber *position;

@end
