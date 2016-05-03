//
//  main.m
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import "Box.h"
#import <Foundation/Foundation.h>
#import "BinarySearchTree.h"
#define START NSDate *startTime = [NSDate date]
#define FINISH                                                                 \
NSLog(@"%s Time: %f", __func__, -[startTime timeIntervalSinceNow])

NSNumber *findIndexByValue(NSArray *sortedArray, NSNumber *target) {
    START;
    if ([@([sortedArray indexOfObject:target]) isEqual:target]) {
        FINISH;
        NSLog(@"FOUND");
        return @([sortedArray indexOfObject:target]);
    }
    FINISH;
    NSLog(@"NOT FOUND");
    return @-1;
    // FINISH;
}

NSNumber *findIndexByValueBinary(NSArray *sortedArray, NSNumber *target) {
    START;
    int lowerBound = 0;
    int upperBound = (int)sortedArray.count;
    int midPoint = -1;
    int index = -1;

    while (lowerBound <= upperBound) {

        midPoint = lowerBound + (upperBound - lowerBound) / 2;
        if (sortedArray[midPoint] == target) {
            NSLog(@"FOUND");
            index = midPoint;
            break;
        } else {
            if (sortedArray[midPoint] < target) {
                lowerBound = midPoint + 1;
            }
            else {
                upperBound = midPoint - 1;
            }
        }
    }
    FINISH;
    return @(index);
}

NSNumber *findIndexByValueRecursiveExtended(NSArray *sortedArray,
                                            NSNumber *start, NSNumber *end,
                                            NSNumber *target) {

    NSNumber *middle = @(([start intValue] + [end intValue]) / 2);
    if (end < start) {
        return @-1;
    }
    if (target == [sortedArray objectAtIndex:[middle longValue]]) {
        // FOUND
        NSLog(@"Found");
        return middle;
    } else if (target < [sortedArray objectAtIndex:[middle longValue]]) {
        return findIndexByValueRecursiveExtended(sortedArray, start,
                                                 @([middle intValue] - 1), target);
    } else {
        return findIndexByValueRecursiveExtended(sortedArray, @([middle intValue] + 1),
                                                 end, target);
    }
}

NSNumber *findIndexByValueRecursive(NSArray *sortedArray, NSNumber *target) {
    return findIndexByValueRecursiveExtended(sortedArray, @0,
                                             @(sortedArray.count - 1), target);
}

int findIndexByValueC(int sortedArray[1000000], int targetValue) {
    START;
    for (int i = 0; i < 1000000; i++) {
        if (sortedArray[i] == targetValue) {
            FINISH;
            NSLog(@"FOUND");
            return i;
        }
    }

    FINISH;
    NSLog(@"NOT FOUND");
    return -1;
}

int main(int argc, const char *argv[]) {

#pragma mark - ASSIGNMENT 1
    Box *box1 = [[Box alloc] initWithHeight:5.5f Width:3.3f Length:4.4f];
    NSLog(@"%f", [box1 volume]);
    Box *box2 = [[Box alloc] initWithHeight:2.5f Width:1.3f Length:4.f];
    NSLog(@"%f", [box2 volume]);
    NSLog(@"A box fits %d times inside the other", [box1 fitsInside:box2]);
    NSLog(@"A box fits %d times inside the other", [box2 fitsInside:box1]);

#pragma mark - ASSIGNMENT SEARCHING ALGORITHMS
    BinarySearchTree* myBST = [[BinarySearchTree alloc] init];
    int sortedArray[1000000];
    NSMutableArray *sortedMutableArray = [[NSMutableArray alloc] init];

    for (int x = 0; x < 1000000; x++) {
        sortedArray[x] = x;
        [sortedMutableArray addObject:@(x)];
    }

    //BINARY SEARCH TREE INSERTION
    for (int x = 0; x < 100000; x++) {
        int randomNum = arc4random_uniform(100000);
        [myBST insertObject:@(randomNum)];
    }
    
    findIndexByValue(sortedMutableArray, @999999);
    findIndexByValueBinary(sortedMutableArray, @999999);

    findIndexByValueRecursive(sortedMutableArray, @999999);


    BinaryTreeNode* myNode = [myBST find:@999];
    if(myNode != NULL)
    {
        NSLog(@"BST Found %@", myNode.object);
    } else {
        NSLog(@"BST Did Not Find the object");
    }


    
    findIndexByValueC(sortedArray, 999999);




    
    return 0;
}
