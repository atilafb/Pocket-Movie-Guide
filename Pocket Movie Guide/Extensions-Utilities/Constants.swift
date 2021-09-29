//
//  Constants.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 11/09/21.
//

import UIKit

struct K {
    struct BrandColors {
        static let titleColor = [
            NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        ]
        static let darkBlue = UIColor.init(red: 13/255, green: 37/255, blue: 63/255, alpha: 1.0)
        static let lightBlue = UIColor(red: 1/255, green: 180/255, blue: 228/255, alpha: 1.0)
        static let lightGreen = UIColor(red: 144/255, green: 206/255, blue: 161/255, alpha: 1.0)
    }
    
    struct Cells {
        static let movieTableViewCell = "MovieTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    
}
