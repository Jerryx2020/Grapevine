//
//  AutoReview.swift
//  Grapevine
//
//  Created by Nathan Bronson on 4/26/21.
//

import Foundation
import CoreML

let starrerModel: starrer = try! starrer(configuration: MLModelConfiguration())

func analyzeSentiment(_ text: String) -> Int {
    return Int((try! starrerModel.prediction(text: text).featureValue(for: "0")!.doubleValue * 5).rounded())
}
