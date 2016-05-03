//
//  main.m
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"



int main(int argc, const char * argv[]) {

    Box* box1 = [[Box alloc] initWithHeight:5.5f Width:3.3f Length:4.4f];
    NSLog(@"%f", [box1 volume]);
    Box* box2 = [[Box alloc] initWithHeight:2.5f Width:1.3f Length:4.f];
    NSLog(@"%f", [box2 volume]);
    NSLog(@"A box fits %d times inside the other",[box1 fitsInside:box2]);
    NSLog(@"A box fits %d times inside the other",[box2 fitsInside:box1]);


    return 0;
}
