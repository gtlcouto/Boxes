//
//  BinaryTreeNode.m
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"


@interface BinarySearchTree : NSObject

@property (nonatomic, strong) BinaryTreeNode *root;

- (instancetype)initWithObject:(NSObject *)object;
- (void)insertObject:(NSObject *)newObject;
- (BinaryTreeNode *)find:(NSObject *)object;
- (BinaryTreeNode *)deleteObject:(NSObject *)object;

@end

