//
//  LinkedListTest.swift
//  99SwiftProblemnsTests
//
//  Created by João Paulo Scopus on 28/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest

class LLNode{
    var key:Int!
    var nextNode:LLNode!
}

class LinkedList{
    
    var Head:LLNode!
    func insert(key:Int){
        
        if(Head == nil){
            Head = LLNode()
            Head.key = key
            Head.nextNode = nil
        }
        else{
            var current:LLNode! = Head
            while(current.nextNode != nil){
                current = current.nextNode
            }
            
            current.nextNode = LLNode()
            current.nextNode.key = key
            current.nextNode.nextNode = nil
        }
}

public 
