//
//  optionOption.swift
//  
//
//  Created by 老房东 on 2022-09-14.
//

import SwiftUI

public struct OptionOption: Identifiable{
    public var id = UUID()
    public var name : String
    public var active: Bool
    public var value: Bool{
        return active
    }
    
    public init(
        name: String,
        active:Bool=true
    ){
        self.name = name
        self.active = active
    }
    
    public var valueString : String{
        let formatted = String(value)
        return formatted
    }
}

