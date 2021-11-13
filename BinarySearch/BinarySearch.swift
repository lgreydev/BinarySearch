//
//  BinarySearch.swift
//  BinarySearch
//
//  Created by Sergey Lukaschuk on 13.11.2021.
//

import Foundation

class BinarySearch {
    
    
    func binarySearch(in numbers: [Int], for value: Int) -> (Int?, Int?) {
        
        // The left and right bounds of the array
        var left = 0
        var right = numbers.count - 1
        var counter = 0
        
        while left <= right {
            counter += 1
            let middle = Int(floor(Double(left + right) / 2.0))
            
            if numbers[middle] < value {
                left = middle + 1
            } else if numbers[middle] > value {
                right = middle - 1
            } else {
                return (middle, counter)
            }
        }
        return (nil, nil)
    }
}
