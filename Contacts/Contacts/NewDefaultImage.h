//
//  NewDefaultImage.h
//  Contacts
//
//  Created by James Birchall on 04/10/2016.
//  Copyright © 2016 James Birchall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // needed to pass back and create UIImageView

@interface NewDefaultImage : NSObject

// public API to get a default image of size
+ (UIImage *)generateDefaultImageOfSize:(CGSize)size;

@end
