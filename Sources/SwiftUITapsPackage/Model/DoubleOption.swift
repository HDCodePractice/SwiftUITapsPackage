import SwiftUI


public struct DoubleOption: Identifiable{
    public var id = UUID()
    public var name : String
    public var active: Bool = false {
        willSet{
            if !newValue {
                value = defaultValue ?? 0
            }
        }
    }
    public var value: Double
    public var defaultValue : Double?
    public var range: ClosedRange<Double>
    public var isOption = false
    
    public init(
        name: String, 
        active:Bool=false, 
        value:Double, 
        defaultValue: Double? = nil,
        range: ClosedRange<Double> ,
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
    
    public var valueString : String{
        let formatted = String(format: "%.2f", value)
        return formatted
    }
}
