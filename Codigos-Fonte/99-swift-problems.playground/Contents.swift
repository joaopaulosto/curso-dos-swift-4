//: Playground - noun: a place where people can play

import UIKit

public class List<T> {
    var last: T!
    var value: T!
    var nextItem: List<T>?
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init!(var _ values: Array<T>) {
        if values.count == 0 {
            return nil
        }
        value = values.removeFirst()
        nextItem = List(values)
    }
}



