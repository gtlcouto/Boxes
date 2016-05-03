//
//  Box.m
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import "Box.h"

@implementation Box

-(instancetype)initWithHeight:(float)height Width:(float)width Length:(float)length
{
    self = [super init];
    if (self)
    {
        _height = height;
        _width = width;
        _length = length;
    }
    return self;
}


-(float)volume
{
    return self.height * self.width * self.length;
}

-(int)fitsInside:(Box *)box
{
    Box * biggerBox = self;
    Box * smallerBox = box;
    if([box volume] > [self volume])
    {
        biggerBox = box;
        smallerBox  = self;
    }

    return [biggerBox volume] / [smallerBox volume];

}
@end
