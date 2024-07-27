//
//  Recom.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//

import Foundation

struct Recom: Decodable {
    let lat: Double
    let lng: Double
    let location: String
    let recommendation: String
    let salesPrediction: Int
    let timeSlot: String
}
