//
//  ViewController.swift
//  myCraps
//
//  Created by Robert N. Brown III on 1/10/16.
//  Copyright © 2016 Robert N. Brown III. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var d1: String = ""
    var d2: String = ""
    var msg: String = ""
    var msg1: String = ""
    var comeOutRoll: Int = 0
    var firstRoll: Bool = true
    var passLineBet: Bool = false
    var dontPassBet: Bool = false
    var point: Int = 0
    var v_fieldBet: Bool = false
    var v_comeBet: Bool = false
    var v_bsix: Bool = false
    var v_beight: Bool = false
    var v_odds: Bool = false
    var v_odds1: Bool = false
    var v_dontCome: Bool = false
    var v_four: Bool = false
    var v_five: Bool = false
    var v_six: Bool = false
    var v_eight: Bool = false
    var v_nine: Bool = false
    var v_ten: Bool = false
    var v_anySeven: Bool = false
    var v_anyCraps: Bool = false
    var v_hardFour: Bool = false
    var v_hardSix: Bool = false
    var v_hardEight: Bool = false
    var v_hardTen: Bool = false
    var v_aceDuce: Bool = false
    var v_aces: Bool = false
    var v_yo: Bool = false
    var v_boxCars: Bool = false
    var v_dc_Four: Bool = false
    var v_dc_Five: Bool = false
    var v_dc_six: Bool = false
    var v_dc_Eight: Bool = false
    var v_dc_Nine: Bool = false
    var v_dc_Ten: Bool = false
    var v_horn: Bool = false
    var v_eleven: Bool = false
    var v_crapcheck: Bool = false
    
    
    @IBOutlet weak var passline: UIButton!
    @IBOutlet weak var passline1: UIButton!
    @IBOutlet weak var dontpass: UIButton!
    @IBOutlet weak var dontpass1: UIButton!
    @IBOutlet weak var field: UIButton!
    @IBOutlet weak var come: UIButton!
    @IBOutlet weak var bsix: UIButton!
    @IBOutlet weak var beight: UIButton!
    @IBOutlet weak var odds: UIButton!
    @IBOutlet weak var odds1: UIButton!
    @IBOutlet weak var dontCome: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var ten: UIButton!
    @IBOutlet weak var anySeven: UIButton!
    @IBOutlet weak var anyCraps: UIButton!
    @IBOutlet weak var hardFour: UIButton!
    @IBOutlet weak var hardSix: UIButton!
    @IBOutlet weak var hardEight: UIButton!
    @IBOutlet weak var hardTen: UIButton!
    @IBOutlet weak var aceDuce: UIButton!
    @IBOutlet weak var aces: UIButton!
    @IBOutlet weak var yo: UIButton!
    @IBOutlet weak var boxCars: UIButton!
    @IBOutlet weak var dc_four: UIButton!
    @IBOutlet weak var dc_five: UIButton!
    @IBOutlet weak var dc_six: UIButton!
    @IBOutlet weak var dc_eight: UIButton!
    @IBOutlet weak var dc_nine: UIButton!
    @IBOutlet weak var dc_ten: UIButton!
    @IBOutlet weak var horn: UIButton!
    
    let tapRec = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapRec.addTarget(self, action: #selector(ViewController.tappedView(_:)))
        passline.touchesEnded(<#T##touches: Set<UITouch>##Set<UITouch>#>, with: <#T##UIEvent?#>)
  //      passline.addGestureRecognizer(tapRec)
        passline.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedView(_ tapAlert: UIGestureRecognizer) {
        let tapAlert = UIAlertController(title: "Tapped", message: "You just tapped the passline label", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
    
    @IBAction func rolldice () {
        let dice1 = [1,2,3,4,5,6]
        let dice2 = [1,2,3,4,5,6]
        
        if passLineBet || dontPassBet {
            func rollDice() -> (die1: Int, die2: Int) {
            
            func randomIndexForArrayCount(_ count: Int) -> Int {
                return Int(arc4random_uniform(UInt32(count)))
            }
            
            let randomDice1Index = randomIndexForArrayCount(dice1.count)
            let randomDice2Index = randomIndexForArrayCount(dice2.count)
            d1 = String(dice1[randomDice1Index])
            d2 = String(dice2[randomDice2Index])
            
            return (dice1[randomDice1Index], dice2[randomDice2Index])
            }

            let roll = rollDice()
        
            switch roll {
                case (1,1),
                     (1,2),
                     (2,1),
                     (6,6):
                    msg1 = "Crap Dice!"
                case (1,3),
                     (3,1):
                    msg1 = "Four!"
                case (2,2):
                    msg1 = "Little Joe!"
                case (2,3),
                     (3,2),
                     (1,4),
                     (4,1):
                    msg1 = "Fever Five!"
                case (2,4),
                     (4,2),
                     (1,5),
                     (5,1):
                    msg1 = "Six the easy way!"
                case (3,3):
                    msg1 = "Hard Six!"
                case (1,6),
                     (6,1),
                     (3,4),
                     (4,3),
                     (2,5),
                     (5,2):
                    msg1 = "Seven out! Line away!" + "\n Last come get some!"
                    passLineBet = false
                case (2,6),
                     (6,2),
                     (3,5),
                     (5,3):
                    msg1 = "Eight, easy eight!"
                case (4,4):
                    msg1 = "Hard eight!"
                case (4,5),
                     (5,4),
                     (3,6),
                     (6,3):
                    msg1 = "Nine! Center field nine!"
                case (4,6),
                     (6,4):
                    msg1 = "Ten the big one on the end!"
                case (5,5):
                    msg1 = "Hard ten!"
                case (6,5),
                     (5,6):
                    msg1 = "Yo Eleven!"
                default:
                    break
                }

        showAlert()
            
        } else {
            msg1 = "Invalid Bet"
            _ = UIAlertController(title: msg1,
                message: "You will need to have a Pass Line or "
                        + "\n Don't Pass Line bet"
                        + "\n to start the game!",
                preferredStyle: .alert)
            
        }
    }
    
    @IBAction func showAlert () {
        
        let alert = UIAlertController(title: msg1,
            message: "The dice looked like: \(d1, d2)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func setComeOutRoll () {
        firstRoll = true
    }
    
    @IBAction func passline(_ sender: AnyObject) {
        passLineBet = true
        
    }

    @IBAction func passline1(_ sender: AnyObject) {
        passLineBet = true
        
    }
    
    @IBAction func dontpass(_ sender: AnyObject) {
        dontPassBet = true
        
    }
    @IBAction func aces(_ sender: AnyObject) {
        
    }
    @IBAction func aceduce(_ sender: AnyObject) {
        
    }
    @IBAction func four(_ sender: AnyObject) {
        
    }
    @IBAction func five(_ sender: AnyObject) {
        
    }
    @IBAction func six(_ sender: AnyObject) {
        
    }
    @IBAction func seven(_ sender: AnyObject) {
        
    }
    @IBAction func eight(_ sender: AnyObject) {
        
    }
    @IBAction func nine(_ sender: AnyObject) {
        
    }
    @IBAction func ten(_ sender: AnyObject) {
        
    }
    @IBAction func eleven(_ sender: AnyObject) {
        
    }
    @IBAction func twelve(_ sender: AnyObject) {
        
    }
    @IBAction func field(_ sender: AnyObject) {
        
    }
    @IBAction func hardfour(_ sender: AnyObject) {
        
    }
    @IBAction func hardsix(_ sender: AnyObject) {
        
    }
    @IBAction func hardeight(_ sender: AnyObject) {
        
    }
    @IBAction func hardten(_ sender: AnyObject) {
        
    }
    @IBAction func horn(_ sender: AnyObject) {
        
    }
    @IBAction func anyseven(_ sender: AnyObject) {
        
    }
    @IBAction func andcraps(_ sender: AnyObject) {
        
    }
    @IBAction func big6(_ sender: AnyObject) {
        
    }
    @IBAction func big8(_ sender: AnyObject) {
        
    }
    @IBAction func dc_four(_ sender: AnyObject) {
        
    }
    @IBAction func dc_five(_ sender: AnyObject) {
        
    }
    @IBAction func dc_six(_ sender: AnyObject) {
        
    }
    @IBAction func dc_eight(_ sender: AnyObject) {
        
    }
    @IBAction func dc_tex(_ sender: AnyObject) {
        
    }
    @IBAction func come(_ sender: AnyObject) {
        
    }
    

/*    func tappedField (_ spot: UILabel) {
        let text = spot.text!
        
        switch text {
        case four:
            spot.text?.capitalized
        case five:
            spot.text?.capitalized
        case six:
            spot.text?.capitalized
        case eight:
            spot.text?.capitalized
        case nine:
            spot.text?.capitalized
        case ten:
            spot.text?.capitalized
        case odds:
            spot.text?.capitalized
        case come:
            spot.text?.capitalized
        case dc_four:
            spot.text?.capitalized
        case dc_five:
            spot.text?.capitalized
        case dc_six:
            spot.text?.capitalized
        case dc_eight:
            spot.text?.capitalized
        case dc_ten:
            spot.text?.capitalized
        case field:
            spot.text?.capitalized
        case yo:
            spot.text?.capitalized
        case aces:
            spot.text?.capitalized
        case aceDuce:
            spot.text?.capitalized
        case bsix:
            spot.text?.capitalized
        case beight:
            spot.text?.capitalized
        case boxCars:
            spot.text?.capitalized
        case passline!:
            spot.text?.capitalized
        case dontpass:
            spot.text?.capitalized
        case dontCome:
            spot.text?.capitalized
        case anySeven:
            spot.text?.capitalized
        case anyCraps:
            spot.text?.capitalized
        default:
            break
            
        }
    }
*/
    
}

