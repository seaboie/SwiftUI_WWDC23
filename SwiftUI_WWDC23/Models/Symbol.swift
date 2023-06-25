//
//  Symbol.swift
//  SwiftUI_WWDC23
//
//  Created by krit on 24/6/2566 BE.
//

import Foundation

struct Symbol: Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
}

let symbols: [Symbol] = [
    Symbol(name: "tshirt"),
    Symbol(name: "eyes"),
    Symbol(name: "eyebrow"),
    Symbol(name: "nose"),
    Symbol(name: "mustache"),
    Symbol(name: "mouth"),
    Symbol(name: "eyeglasses"),
    Symbol(name: "facemask"),
    Symbol(name: "brain.head.profile"),
    Symbol(name: "brain"),
    Symbol(name: "icloud"),
    Symbol(name: "theatermasks.fill"),
    Symbol(name: "house.fill"),
    Symbol(name: "sun.max.fill"),
    Symbol(name: "cloud.rain.fill"),
    Symbol(name: "pawprint.fill"),
    Symbol(name: "lungs.fill"),
    Symbol(name: "face.smiling"),
    Symbol(name: "gear"),
    Symbol(name: "allergens"),
    Symbol(name: "bolt.heart"),
    Symbol(name: "ladybug.fill"),
    Symbol(name: "bus.fill"),
    Symbol(name: "bicycle.circle"),
    Symbol(name: "faceid"),
    Symbol(name: "gamecontroller.fill"),
    Symbol(name: "timer"),
    Symbol(name: "eye.fill"),
    Symbol(name: "person.icloud"),
    Symbol(name: "tortoise.fill"),
    Symbol(name: "hare.fill"),
    Symbol(name: "leaf.fill"),
    Symbol(name: "wand.and.stars"),
    Symbol(name:"globe.americas.fill"),
    Symbol(name: "globe.europe.africa.fill"),
    Symbol(name: "globe.asia.australia.fill"),
    Symbol(name: "hands.sparkles.fill"),
    Symbol(name: "hand.draw.fill"),
    Symbol(name: "waveform.path.ecg.rectangle.fill"),
    Symbol(name: "gyroscope"),
    
]
