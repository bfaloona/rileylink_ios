//
//  MealBolusNightscoutTreatment.swift
//  RileyLink
//
//  Created by Pete Schwamb on 3/10/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public class MealBolusNightscoutTreatment: NightscoutTreatment {
    
    let carbs: Int
    let absorptionTime: TimeInterval?
    let insulin: Double?
    let glucose: Int?
    let units: Units? // of glucose entry
    let glucoseType: GlucoseType?

    public init(timestamp: Date, enteredBy: String, id: String?, carbs: Int, absorptionTime: TimeInterval? = nil, insulin: Double? = nil, glucose: Int? = nil, glucoseType: GlucoseType? = nil, units: Units? = nil) {
        self.carbs = carbs
        self.absorptionTime = absorptionTime
        self.glucose = glucose
        self.glucoseType = glucoseType
        self.units = units
        self.insulin = insulin
        super.init(timestamp: timestamp, enteredBy: enteredBy, id: id)
    }
    
    override public var dictionaryRepresentation: [String: Any] {
        var rval = super.dictionaryRepresentation
        rval["eventType"] = "Meal Bolus"
        rval["carbs"] = carbs
        if let absorptionTime = absorptionTime {
            rval["absorptionTime"] = absorptionTime.minutes
        }
        rval["insulin"] = insulin
        if let glucose = glucose {
            rval["glucose"] = glucose
            rval["glucoseType"] = glucoseType?.rawValue
            rval["units"] = units?.rawValue
        }
        return rval
    }
}
