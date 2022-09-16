import SwiftUI

public struct BoolOption: Identifiable{
    public var id = UUID()
    public var name : String
    public var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue
            }
        }
    }
    public var value: Bool
    public var defaultValue : Bool
    public var isOption = false
    
    public init(
        name: String, 
        active:Bool=false, 
        value:Bool, 
        defaultValue: Bool? = nil,
        isOption : Bool = false
    ){
        self.name = name
        self.active = active
        self.value = value
        if let defaultValue=defaultValue {
            self.defaultValue=defaultValue
        }else{
            self.defaultValue=value
        }
        self.isOption = isOption
    }
    
    public var valueString : String{
        let formatted = String(value)
        return formatted
    }
}
