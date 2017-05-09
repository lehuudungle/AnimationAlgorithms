//
//  LinearSearch.swift
//  Algorithms
//
//  Created by TTung on 5/8/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation

class LinearSearch {
    var act: String!
    var arrayInput = [Int]()
    
    init(arrayInput: [Int], search: Int) {
        self.arrayInput = arrayInput
        linearSearch(arrayInput, search)

    }
    
    func linearSearch<T: Equatable>(_ array: [T], _ object: T) {
        
        
        
        for (index, obj) in array.enumerated()  {
            
            
            if obj == object{
                act = "true"
                print(index)
            }
            else {
                act = "false"
            }
        }
    }
}
