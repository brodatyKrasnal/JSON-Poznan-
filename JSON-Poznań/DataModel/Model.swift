//
//JSON-Poznań : Model.swift By: Tymon Golęba Frygies on 10:10. 
// Copyright (c) 2020, Tymon Golęba Frygies. All rights reserved.


import Foundation

struct TopLevel: Codable {
    let features: [Feature]
    let crs: CRS
    let type: String
}

struct CRS: Codable {
    let type: String
    let properties: CRSProperties
}

struct CRSProperties: Codable {
    let code: String
}

struct Feature: Codable {
    let geometry: Geometry
    let id: String
    let type: FeatureType
    let properties: FeatureProperties
}

struct Geometry: Codable {
    let coordinates: [Double]
    let type: GeometryType
}

enum GeometryType: String, Codable {
    case point = "Point"
}

struct FeatureProperties: Codable {
    let freeRacks, bikes, label, bikeRacks: String
    let updated: Updated

    enum CodingKeys: String, CodingKey {
        case freeRacks = "free_racks"
        case bikes, label
        case bikeRacks = "bike_racks"
        case updated
    }
}

enum Updated: String, Codable {
    case the201903211450 = "2019-03-21 14:50"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}



