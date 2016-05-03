//
//  Box.h
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property (nonatomic) float height;
@property (nonatomic) float width;
@property (nonatomic) float length;

-(instancetype)initWithHeight:(float)height Width:(float)width Length:(float)length;

-(float)volume;
-(int)fitsInside:(Box *)box;


@end
