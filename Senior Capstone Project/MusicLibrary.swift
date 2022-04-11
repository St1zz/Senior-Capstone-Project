//
//  MusicLibrary.swift
//  Senior Capstone Project
//
//  Created by Justin Wallen on 3/8/22.
//

import AVFoundation
import Foundation
import UIKit

class Song{
    
    var name:String
    var artist:String
    var fileName:String
    var fileType:String
    
    init(name:String, artist:String, fileName:String, fileType:String){
        
        self.name = name
        self.artist = artist
        self.fileName = fileName
        self.fileType = fileType
    }
}

class Station{
    
    var name:String
    var image:UIImage
    var songs:[Song]
    
    init(name:String, image:UIImage, songs:[Song]){
        
        self.name = name
        self.image = image
        self.songs = songs
    }
    
}

let musicStations = [
    
    Station(name: "Lofi Study", image: #imageLiteral(resourceName: "lofi chill"), songs: [
            
        Song(name: "Exhale", artist: "No Spirit", fileName: "No Spirit - Exhale", fileType: "m4a"),
        Song(name: "Dancing In The Dark", artist: "Mondo Loops x Aiguille", fileName: "Mondo Loops x Aiguille - Dancing In The Dark", fileType: "m4a"),
        Song(name: "Redbone", artist: "LAV8", fileName: "Redbone", fileType: "m4a")
    ]),
    
    Station(name: "Lofi Jazz", image: #imageLiteral(resourceName: "LofiJazz"), songs:[
        
        Song(name: "Blessed", artist: "LVDS", fileName: "LVDS - Blessed", fileType: "m4a"),
        Song(name: "CoffeeJazz", artist: "Coffee", fileName: "CoffeeJazz", fileType: "m4a"),
        Song(name: "holiday party", artist: "Mr.Woox", fileName: "holiday party - Mr.Woox", fileType: "m4a"),
    ]),
        
    Station(name: "Chill Drive", image: #imageLiteral(resourceName: "lofi Car"), songs:[
            
        Song(name: "Road Is Mine", artist: "Project AER", fileName: "Road Is Mine", fileType: "m4a"),
            
        Song(name: "Lonely in a Crowd", artist: "G R I Z", fileName: "G R I Z - Lonely in a Crowd", fileType: "m4a"),
            
        Song(name: "Phoenix", artist: "JazzyCal, Purrple Cat", fileName: "Phoenix", fileType: "m4a"),
    ])
]
