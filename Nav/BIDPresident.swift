//
//  BIDPresident.swift
//  Nav
//
//  Created by demon on 14-7-22.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDPresident: NSObject,NSCoding,NSCopying {
    var number:NSInteger!
    var name:NSString!
    var fromYear:NSString!
    var toYear:NSString!
    var party:NSString!
    
    var kPresidentNumberKey = "President"
    var kPresidentNameKey   = "Name"
    var kPresidentFromKey   = "FromYear"
    var kPresidentToKey     = "ToYear"
    var kPresidentPartyKey  = "Party"
    
    func encodeWithCoder(encoder: NSCoder!){
        encoder.encodeInteger(self.number,forKey:kPresidentNumberKey)
        encoder.encodeObject(self.name ,forKey:kPresidentNameKey)
        encoder.encodeObject(self.fromYear, forKey:kPresidentFromKey)
        encoder.encodeObject(self.toYear,forKey:kPresidentToKey)
        encoder.encodeObject(self.party,forKey:kPresidentPartyKey)
    }
    init() {
        
    }
    init(coder decoder: NSCoder!){
        super.init()
        self.number = decoder.decodeIntegerForKey(kPresidentNumberKey)
        self.name = decoder.decodeObjectForKey(kPresidentNameKey) as NSString
        self.fromYear = decoder.decodeObjectForKey(kPresidentFromKey) as NSString
        self.toYear = decoder.decodeObjectForKey(kPresidentToKey) as NSString
        self.party = decoder.decodeObjectForKey(kPresidentPartyKey) as NSString
        
    }
    func copyWithZone(zone: NSZone) -> AnyObject!{
        var copy:BIDPresident = BIDPresident()
        copy.number = self.number;
        copy.name = self.name;
        copy.fromYear = self.fromYear;
        copy.toYear = self.toYear;
        copy.party = self.party;
        return copy
    }
    
}
