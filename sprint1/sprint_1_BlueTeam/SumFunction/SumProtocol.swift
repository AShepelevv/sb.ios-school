//
//  SumProtocol.swift
//  sprint_1_BlueTeam
//
//  Created by Onie on 31.10.2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

import Foundation

protocol NumericOrString {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Float: NumericOrString {}
extension Double: NumericOrString {}
extension Int: NumericOrString{}
extension Int32: NumericOrString{}
extension Int64: NumericOrString{}
extension String: NumericOrString{}
