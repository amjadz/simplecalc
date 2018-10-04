//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    
    public func calculate(_ args: [String]) -> Int {
        var allNums = args[args.count - 1]
    
        switch allNums {
        case "count":
            return args.count - 1
        case "avg":
            return averageCalc(args)
        case "fact":
            return factorialCalc(args)
        default:
            var firstNumber = Int(args[0])
            var secondNumber = Int(args[2])
            var operatation = args[1]
        
            switch operatation{
            case "+":
                return firstNumber! + secondNumber!
            case "-":
                return firstNumber! - secondNumber!
            case "/":
                return firstNumber! / secondNumber!
            case "*":
                return firstNumber! * secondNumber!
            default:
                return remainderCalc(firstNumber!, numberTwo: secondNumber!)
            }
        }
        return 0
    }

    func remainderCalc(_ numberOne: Int, numberTwo: Int) -> Int {
        var divsionRemainder = numberOne
        var dividingNumber = numberTwo
        
        while divsionRemainder >= dividingNumber {
            divsionRemainder -= dividingNumber
        }
        return divsionRemainder
    }

    func factorialCalc(_ nums: [String]) -> Int  {
        if nums.count == 2 {
            var theEnd = Int(nums[0])
            var answer = 1;
            for index in 1...theEnd!{
                answer *= index
            }
            return answer
        } else {
            return 0
        }
    }
    
    func averageCalc(_ nums: [String]) ->  Int {
        var average = 0;
        var count = nums.count - 1
        
        if count > 0 {
            var negative = false
            for index in 0...nums.count - 2 {
                if nums[index] == "-"{
                    negative = true
                    
                } else {
                    var nextNum = Int(nums[index])
                    if negative {
                        nextNum = nextNum! * 1
                        negative = false
                    }
                    average += nextNum!
                }
                
                return average / count
                
            }
        } else {
            return 0
        }
       return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


