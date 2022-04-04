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

struct MusicStations{
    
    let lofiStudy = Station(name: "Lofi Study", image: #imageLiteral(resourceName: "lofi chill"), songs: [
        
        Song(name: "Exhale", artist: "No Spirit", fileName: "NoSpiritExhale", fileType: "MP3"),
        Song(name: "Dancing In The Dark", artist: "Mondo Loops x Aiguille", fileName: "Mondo Loops x Aiguille - Dancing In The Dark", fileType: "mp3"),
        Song(name: "CoffeeJazz", artist: "Coffee", fileName: "CoffeeJazz", fileType: "m4a"),
        Song(name: "Redbone", artist: "LAV8", fileName: "Redbone", fileType: "m4a")
    
    ])
    
}
