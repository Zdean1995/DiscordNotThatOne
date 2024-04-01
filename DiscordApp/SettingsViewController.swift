//
//  SettingsViewController.swift
//  DiscordApp
//
//  Created by Zachary on 2024-04-01.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var commanderSwitch: UISwitch!
    @IBOutlet weak var vintageSwitch: UISwitch!
    @IBOutlet weak var legacySwitch: UISwitch!
    @IBOutlet weak var modernSwitch: UISwitch!
    @IBOutlet weak var pioneerSwitch: UISwitch!
    @IBOutlet weak var standardSwitch: UISwitch!
    @IBOutlet weak var vanillaSwitch: UISwitch!
    @IBOutlet weak var chaosSwitch: UISwitch!
    @IBOutlet weak var funnySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        setSwitches()
    }
    
    @IBAction func changePool(_ sender: UISwitch) {
        switch sender.tag {
        case 0:
            UserDefaults.standard.set(PoolType.commander.rawValue, forKey: "pool")
        case 1:
            UserDefaults.standard.set(PoolType.vintage.rawValue, forKey: "pool")
        case 2:
            UserDefaults.standard.set(PoolType.legacy.rawValue, forKey: "pool")
        case 3:
            UserDefaults.standard.set(PoolType.modern.rawValue, forKey: "pool")
        case 4:
            UserDefaults.standard.set(PoolType.pioneer.rawValue, forKey: "pool")
        case 5:
            UserDefaults.standard.set(PoolType.standard.rawValue, forKey: "pool")
        case 6:
            UserDefaults.standard.set(PoolType.funny.rawValue, forKey: "pool")
        case 7:
            UserDefaults.standard.set(PoolType.vanilla.rawValue, forKey: "pool")
        case 8:
            UserDefaults.standard.set(PoolType.chaos.rawValue, forKey: "pool")
            
        default:
            UserDefaults.standard.set(PoolType.commander.rawValue, forKey: "pool")
            
        }
        setSwitches()
    }
    func setSwitches() {
        let pool = UserDefaults.standard.string(forKey: "pool")
        commanderSwitch.setOn(false, animated: false)
        vintageSwitch.setOn(false, animated: false)
        legacySwitch.setOn(false, animated: false)
        modernSwitch.setOn(false, animated: false)
        standardSwitch.setOn(false, animated: false)
        pioneerSwitch.setOn(false, animated: false)
        vanillaSwitch.setOn(false, animated: false)
        chaosSwitch.setOn(false, animated: false)
        funnySwitch.setOn(false, animated: false)
        switch pool {
        case PoolType.commander.rawValue:
            commanderSwitch.setOn(true, animated: false)
        case PoolType.vintage.rawValue:
            vintageSwitch.setOn(true, animated: false)
        case PoolType.modern.rawValue:
            modernSwitch.setOn(true, animated: false)
        case PoolType.pioneer.rawValue:
            pioneerSwitch.setOn(true, animated: false)
        case PoolType.standard.rawValue:
            standardSwitch.setOn(true, animated: false)
        case PoolType.vanilla.rawValue:
            vanillaSwitch.setOn(true, animated: false)
        case PoolType.chaos.rawValue:
            chaosSwitch.setOn(true, animated: false)
        case PoolType.funny.rawValue:
            funnySwitch.setOn(true, animated: false)
            
        default:
            commanderSwitch.setOn(true, animated: false)
        }
    }
}
