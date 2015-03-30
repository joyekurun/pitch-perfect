//
//  RecordedAudio.swift
//  PitchPerfect
//
//  Created by Amrit Joyekurun on 3/26/15.
//  Copyright (c) 2015 Amrit Joyekurun. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject
{
    var filePathUrl: NSURL!
    var title: String!
    
    init(title:String, url:NSURL) {
        self.title=title
        self.filePathUrl=url
    }
}