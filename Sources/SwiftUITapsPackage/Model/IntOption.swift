import SwiftUI

public struct IntOption: Identifiable{
    public var id = UUID()
    public var name : String
    public var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue
            }
        }
    }
    public var value: Int
    public var defaultValue : Int
    public var range: ClosedRange<Double>
    public var isOption = false
    
    public init(
        name: String, 
        active:Bool=false, 
        value:Int, 
        defaultValue: Int? = nil,
        range: ClosedRange<Double>,
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
        self.range = range
        self.isOption = isOption
    }
    
    public var doubleValue : Double{
        set{
            value = Int(newValue)
        }
        get{
            return Double(value)
        }
    }
    
    public var valueString : String{
        let formatted = String(value)
        return formatted
    }
}
