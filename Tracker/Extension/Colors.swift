//
//  Colors.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import UIKit

extension UIColor {
    static var black: UIColor { UIColor(named: "YP Black") ?? UIColor.black }
    static var background: UIColor { UIColor(named: "YP Background") ?? UIColor.darkGray }
    static var white: UIColor { UIColor(named: "YP White") ?? UIColor.white }
    static var green: UIColor { UIColor(named: "YP Green") ?? UIColor.green }
    static var blue: UIColor { UIColor(named: "YP Blue") ?? UIColor.blue }
    static var red: UIColor { UIColor(named: "YP Red") ?? UIColor.red }
    static var gray: UIColor { UIColor(named: "YP Gray") ?? UIColor.gray }
    static var lightGray: UIColor { UIColor(named: "YP Light Gray") ?? UIColor.lightGray }
    
    static var customColorSelection1: UIColor {
        guard let color = UIColor(named: "Color selection 1") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection2: UIColor {
        guard let color = UIColor(named: "Color selection 2") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection3: UIColor {
        guard let color = UIColor(named: "Color selection 3") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection4: UIColor {
        guard let color = UIColor(named: "Color selection 4") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection5: UIColor {
        guard let color = UIColor(named: "Color selection 5") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection6: UIColor {
        guard let color = UIColor(named: "Color selection 6") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection7: UIColor {
        guard let color = UIColor(named: "Color selection 7") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection8: UIColor {
        guard let color = UIColor(named: "Color selection 8") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection9: UIColor {
        guard let color = UIColor(named: "Color selection 9") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection10: UIColor {
        guard let color = UIColor(named: "Color selection 10") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection11: UIColor {
        guard let color = UIColor(named: "Color selection 11") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection12: UIColor {
        guard let color = UIColor(named: "Color selection 12") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection13: UIColor {
        guard let color = UIColor(named: "Color selection 13") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection14: UIColor {
        guard let color = UIColor(named: "Color selection 14") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection15: UIColor {
        guard let color = UIColor(named: "Color selection 15") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection16: UIColor {
        guard let color = UIColor(named: "Color selection 16") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection17: UIColor {
        guard let color = UIColor(named: "Color selection 17") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    static var customColorSelection18: UIColor {
        guard let color = UIColor(named: "Color selection 18") else {
            assertionFailure("Unable to load color")
            return UIColor.white
        }
        return color
    }
    
}

let colorDictionary: [String: UIColor] = [
        "Color selection 1": UIColor.customColorSelection1,
        "Color selection 2": UIColor.customColorSelection2,
        "Color selection 3": UIColor.customColorSelection3,
        "Color selection 4": UIColor.customColorSelection4,
        "Color selection 5": UIColor.customColorSelection5,
        "Color selection 6": UIColor.customColorSelection6,
        "Color selection 7": UIColor.customColorSelection7,
        "Color selection 8": UIColor.customColorSelection8,
        "Color selection 9": UIColor.customColorSelection9,
        "Color selection 10": UIColor.customColorSelection10,
        "Color selection 11": UIColor.customColorSelection11,
        "Color selection 12": UIColor.customColorSelection12,
        "Color selection 13": UIColor.customColorSelection13,
        "Color selection 14": UIColor.customColorSelection14,
        "Color selection 15": UIColor.customColorSelection15,
        "Color selection 16": UIColor.customColorSelection16,
        "Color selection 17": UIColor.customColorSelection17,
        "Color selection 18": UIColor.customColorSelection18
    ]

