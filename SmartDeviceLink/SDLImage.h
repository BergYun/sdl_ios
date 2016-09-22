//  SDLImage.h
//

#import "SDLRPCMessage.h"

@class SDLImageType;


/**
 *Specifies, which image shall be used, e.g. in SDLAlerts or on SDLSoftbuttons provided the display supports it.
 * 
 * @since SDL 2.0
 */
@interface SDLImage : SDLRPCStruct

/**
 * @abstract The static hex icon value or the binary image file name identifier (sent by SDLPutFile)
 *
 * Required, max length = 65535
 */
@property (strong) NSString *value;

/**
 * @abstract Describes, whether it is a static or dynamic image
 *
 * Required
 */
@property (strong) SDLImageType *imageType;

@end
