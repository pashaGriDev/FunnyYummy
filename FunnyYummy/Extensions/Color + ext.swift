//
//  color.swift
//  FunnyYummy
//
//  Created by Никита Мартьянов on 28.08.23.
//

import SwiftUI

extension Color {
    
    struct Main {
        static var white : Color {
            Color(red: 255/255, green: 255/255, blue: 255/255)
        }
        static var black : Color {
            Color(red: 24/255, green: 24/255, blue: 24/255)
        }
    }
    
    struct Text {
        static var white : Color {
            Color(red: 255/255, green: 255/255, blue: 255/255)
        }
        static var black : Color {
            Color(red: 24/255, green: 24/255, blue: 24/255)
        }
        static var peach : Color {
            Color(red: 248/255, green: 200/255, blue: 154/255)
        }
        static var lightRed : Color {
            Color(red: 243/255, green: 178/255, blue: 178/255)
        }
        static var gray : Color {
            Color(red: 145/255, green: 145/255, blue: 145/255)
        }
    }
    
    struct Button {
        static var red : Color {
            Color(red: 226/255, green: 62/255, blue: 62/255)
        }
        static var gray : Color {
            Color(red: 145/255, green: 145/255, blue: 145/255)
        }
        static var black : Color {
            Color(red: 24/255, green: 24/255, blue: 24/255)
        }
    }
    
    struct Cell {
        static var gray : Color {
            Color(red: 241/255, green: 241/255, blue: 241/255)
        }
    }
}
