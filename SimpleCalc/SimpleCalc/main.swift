//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let allNums = args[args.count - 1]
    
        switch allNums {
        case "count":
            return args.count - 1
        case "avg":
            return averageCalc(args)
        case "fact":
            return factorialCalc(args)
        default:
            let firstNumber = Int(args[0])
            let secondNumber = Int(args[2])
            let operatation = args[1]
        
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
                return remainderCalc(firstNumber!, secondNumber: secondNumber!)
            }
        }
    }

    func remainderCalc(_ firstNumber: Int, secondNumber: Int) -> Int {
        var divsionRemainder = firstNumber
        let dividingNumber = secondNumber

        while divsionRemainder >= dividingNumber {
            divsionRemainder -= dividingNumber
        }
        return divsionRemainder
    }

    func factorialCalc(_ nums: [String]) -> Int  {
        if nums.count == 2 {
            let theEnd = Int(nums[0])
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
        var count = 0
        var sum = 0
        if nums.count == 1 {
            return 0
        }
        while count < nums.count - 1 {
            sum += Int(nums[count])!
            count += 1
        }
        return sum / (nums.count - 1)
        
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


