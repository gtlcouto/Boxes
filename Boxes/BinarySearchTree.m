//
//  BinarySearchTree.m
//  Boxes
//
//  Created by Gustavo Couto on 2016-05-03.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySearchTree.h"

@implementation BinarySearchTree

//BST-Insert(x, z, k)
//1: if x = nil then return “Error”
//2: y ← x
//3: while true do {
//    4: if key[y] < k
//        5: then z ← left[y]
//        6: else z ← right[y]
//            7: if z = nil break
//                8: }
//9: if key[y] > k then left[y] ← z
//10: else right[p[y]] ← z

- (void)insertObject:(NSObject *)newObject
{
        BinaryTreeNode *tempNode = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *current;

        tempNode.object = newObject;
        tempNode.leftChild = NULL;
        tempNode.rightChild = NULL;

        //if tree is empty
        if(self.root == NULL){
            self.root = tempNode;
        }else {
            //current is root
            current = self.root;
            tempNode.parent = NULL;

            while(1){
                tempNode.parent = current;

                //go to left of the tree
                if(newObject < tempNode.parent.object){
                    current = current.leftChild;
                    //insert to the left

                    if(current == NULL){
                        tempNode.parent.leftChild = tempNode;
                        return;
                    }
                }//go to right of the tree
                else{
                    current = current.rightChild;
                    //insert to the right
                    if(current == NULL){
                        tempNode.parent.rightChild = tempNode;
                        return;
                    }
                }
            }            
        }

}

- (BinaryTreeNode *)find:(NSObject *)object{
    BinaryTreeNode *current = self.root;
    printf("Visiting elements: ");

    while(current.object != object){

        if(current != NULL) {

            //go to left tree
            if(current.object > object){
                current = current.leftChild;
            }//else go to right tree
            else {
                current = current.rightChild;
            }

            //not found
            if(current == NULL){
                return NULL;
            }
        }			
    }
    return current;
}

//-(void)rebalanceTree
//{
//    int count;
//    if(self.root != NULL)
//    {
//        count++;
//    }
//    while(self.root.leftChild != NULL)
//    {
//        count++;
//    }
//    while(self.root.rightChild != NULL)
//    {
//        count++;
//    }
//
//}

@end
