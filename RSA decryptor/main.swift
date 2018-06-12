//
//  main.swift
//  RSA decryptor
//
//  Created by Посудин Константин Михайлович on 12.06.2018.
//  Copyright © 2018 tin. All rights reserved.
//

import Foundation
func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding:String.Encoding.utf8.rawValue)! as String
}

print("Enter decryption key")
var d_s=input()
print("Enter module N")
var N_s=input()
print(d_s)
let d_key = (d_s as NSString).integerValue
let N = (N_s as NSString).integerValue
print("Enter message")
var E1_s=input()
var E2_s=input()
var E3_s=input()

let E1 = (E1_s as NSString).integerValue
let E2 = (E2_s as NSString).integerValue
let E3 = (E3_s as NSString).integerValue


var C1=Int(pow(Double(E1),Double(d_key))) % N
var C2=Int(pow(Double(E2),Double(d_key))) % N
var C3=Int(pow(Double(E3),Double(d_key))) % N

print("Decrypted message:",C1,C2,C3)

