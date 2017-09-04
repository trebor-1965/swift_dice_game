//
//  ViewController.swift
//  myCraps
//
//  Created by Robert N. Brown III on 1/10/16.
//  Copyright © 2016 Robert N. Brown III. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var v_d1: String = ""
    var v_d2: String = ""
    var v_msg: String = ""
    var v_msg1: String = ""
    var v_comeOutRoll: Int = 0
    var v_firstRoll: Bool = true
    var v_passLineBet: Bool = false
    var v_dontPassBet: Bool = false
    var v_point: Int = 0
    var v_fieldBet: Bool = false
    var v_comeBet: Bool = false
    var v_bigsix: Bool = false
    var v_bigeight: Bool = false
    var v_odds: Bool = false
    var v_odds1: Bool = false
    var v_dontCome: Bool = false
    var v_four: Bool = false
    var v_five: Bool = false
    var v_six: Bool = false
    var v_seven: Bool = false
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
    var v_twelve: Bool = false
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
    @IBOutlet weak var quit: UIButton!
    
    
    let tapRec = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapRec.addTarget(self, action: #selector(ViewController.tappedView(_:)))
//        passline.isTouchInside(<#T##touches: Set<UITouch>##Set<UITouch>#>, with: <#T##UIEvent?#>)
  //      passline.addGestureRecognizer(tapRec)
    //    passline.isUserInteractionEnabled = true
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
        
        if v_passLineBet || v_dontPassBet {
            func rollDice() -> (die1: Int, die2: Int) {
            
            func randomIndexForArrayCount(_ count: Int) -> Int {
                return Int(arc4random_uniform(UInt32(count)))
            }
            
            let randomDice1Index = randomIndexForArrayCount(dice1.count)
            let randomDice2Index = randomIndexForArrayCount(dice2.count)
            v_d1 = String(dice1[randomDice1Index])
            v_d2 = String(dice2[randomDice2Index])
            
            return (dice1[randomDice1Index], dice2[randomDice2Index])
            }

            let roll = rollDice()
        
            switch roll {
                case (1,1),
                     (1,2),
                     (2,1),
                     (6,6):
                    v_msg1 = "Crap Dice!"
                case (1,3),
                     (3,1):
                    v_msg1 = "Four!"
                case (2,2):
                    v_msg1 = "Little Joe!"
                case (2,3),
                     (3,2),
                     (1,4),
                     (4,1):
                    v_msg1 = "Fever Five!"
                case (2,4),
                     (4,2),
                     (1,5),
                     (5,1):
                    v_msg1 = "Six the easy way!"
                case (3,3):
                    v_msg1 = "Hard Six!"
                case (1,6),
                     (6,1),
                     (3,4),
                     (4,3),
                     (2,5),
                     (5,2):
                    v_msg1 = "Seven out! Line away!" + "\n Last come get some!"
                    v_passLineBet = false
                case (2,6),
                     (6,2),
                     (3,5),
                     (5,3):
                    v_msg1 = "Eight, easy eight!"
                case (4,4):
                    v_msg1 = "Hard eight!"
                case (4,5),
                     (5,4),
                     (3,6),
                     (6,3):
                    v_msg1 = "Nine! Center field nine!"
                case (4,6),
                     (6,4):
                    v_msg1 = "Ten the big one on the end!"
                case (5,5):
                    v_msg1 = "Hard ten!"
                case (6,5),
                     (5,6):
                    v_msg1 = "Yo Eleven!"
                default:
                    break
                }

        showAlert()
            
        } else {
            v_msg1 = "Invalid Bet"
            _ = UIAlertController(title: v_msg1,
                message: "You will need to have a Pass Line or "
                        + "\n Don't Pass Line bet"
                        + "\n to start the game!",
                preferredStyle: .alert)
            
        }
    }
    
    @IBAction func showAlert () {
        
        let alert = UIAlertController(title: v_msg1,
            message: "The dice looked like: \(v_d1, v_d2)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func setComeOutRoll () {
        v_firstRoll = true
    }
    
    @IBAction func passline(_ sender: AnyObject) {
        v_passLineBet = true
        print("Pass line bet")
    }

    @IBAction func passline1(_ sender: AnyObject) {
        v_passLineBet = true
        print ("Passline bet")
        
    }
    
    @IBAction func quit(_ sender: AnyObject) {
        print("Good bye")
        return
    }
    
    @IBAction func dontpass(_ sender: AnyObject) {
        if (v_dontPassBet) {
            print ("Don't pass")
            v_dontPassBet = false
        }
        else {
            v_dontPassBet = true
            print ("Not Don't pass")
        }
        
    }
    @IBAction func aces(_ sender: AnyObject) {
        if (v_aces) {
            v_aces = false
            print("Aces off")
        }
        else {
            print("Aces bet")
            v_aces = true
        }
        
    }
    @IBAction func aceduce(_ sender: AnyObject) {
        if (v_aceDuce) {
            v_aceDuce = false
            print("Aces duce")
        }
        else {
            v_aceDuce = true
            print("Aces duce")
        }
        
    }
    
    @IBAction func four(_ sender: AnyObject) {
        if (v_four) {
            print("Four not Bet")
            v_four = false
        } else {
            print("Four bet")
            v_four = true
        }
    }
    
    @IBAction func five(_ sender: AnyObject) {
        if (v_five) {
            print("Five not bet")
            v_five = false
        } else {
            v_five = true
            print("Five Bet")
            
        }
        
    }
        
    @IBAction func six(_ sender: AnyObject) {
        if (v_six) {
            print ("Six not bet")
            v_six = false
        } else {
            print("Six bet")
            v_six = true
        }
        
    }
    
    @IBAction func seven(_ sender: AnyObject) {
        if (v_seven) {
            print("seven not bet")
            v_seven = false
            v_anySeven = false
        } else {
            print("seven bet")
            v_seven = true
            v_anySeven = true
        }
        
    }
 
    @IBAction func eight(_ sender: AnyObject) {
        if (v_eight){
            print("Eight not bet")
        } else {
            print("Eight bet")
            v_eight = true
        }
        
    }
 
    @IBAction func nine(_ sender: AnyObject) {
        if (v_nine) {
            print("Nine not bat")
            v_nine = false
        } else {
            print("Nine bet")
            v_nine = true
        }
        
    }

    @IBAction func ten(_ sender: AnyObject) {
        if (v_ten) {
            print("Ten not bet")
            v_ten = false
        } else {
            print("Ten bet")
            v_ten = true
        }
        
    }

    @IBAction func eleven(_ sender: AnyObject) {
        if (v_eleven) {
            print("Eleven not bet")
            v_eleven = false
        } else {
            print("Eleven Bet")
            v_eleven = true
        }
        
    }
    @IBAction func twelve(_ sender: AnyObject) {
        if (v_twelve) {
            print("Twelce not bet")
            v_twelve = false
        } else {
            print("Twelve bet")
            v_twelve = true
        }
        
    }
    @IBAction func field(_ sender: AnyObject) {
        if (v_fieldBet) {
            print("Field not bet")
            v_fieldBet = false
        } else {
            print("Field bet")
            v_fieldBet = true
        }
    }
    @IBAction func hardfour(_ sender: AnyObject) {
        if (v_hardFour) {
            print("Hard four not bet")
            v_hardFour = false
        } else {
            print("Hard four bet")
            v_hardFour = true
        }
    }

    @IBAction func hardsix(_ sender: AnyObject) {
        if (v_hardSix) {
            print("Hard six not bet")
            v_hardSix = false
        } else {
            print("Hard six bet")
            v_hardSix = true
        }
    }
    
    @IBAction func hardeight(_ sender: AnyObject) {
        if (v_hardEight) {
            print("Hard eight not bet")
            v_hardEight = false
        } else {
            print("Hard eight bet")
            v_hardEight = true
        }
    }
    
    @IBAction func hardten(_ sender: AnyObject) {
        if (v_hardTen) {
            print("hard ten not bet")
            v_hardTen = false
        } else {
            print("Hard ten bet")
            v_hardTen = true
        }
    }
    
    @IBAction func horn(_ sender: AnyObject) {
        if (v_horn) {
            print("Horn not bet")
            v_horn = false
        } else {
            print("Horn bet")
            v_horn = true
        }
    }
    @IBAction func anyseven(_ sender: AnyObject) {
        if (v_anySeven) {
            print("any seven not bet")
            v_anySeven = false
        } else{
            print("any seven bet")
            v_anySeven = true
        }
    }
    @IBAction func anycraps(_ sender: AnyObject) {
        if (v_anyCraps) {
            print("any craps not ber")
            v_anyCraps = false
        } else {
            print("any craps bet")
            v_anyCraps = true
        }
    }
    @IBAction func big6(_ sender: AnyObject) {
        if (v_bigsix) {
            print("Big 6 not bet")
            v_bigsix = false
        } else {
            print("Big 6 bet")
            v_bigsix = true
        }
    }
    
    @IBAction func big8(_ sender: AnyObject) {
        if (v_bigeight) {
            print("Big 8 not bet")
            v_bigeight = false
        } else {
            print("Big 8 bet")
            v_bigeight = true
        }
    }
    
    @IBAction func dc_four(_ sender: AnyObject) {
        if (v_dc_Four) {
            print("Don't come 4 not bet")
            v_dc_Four = false
        } else {
            print("Dont come 4 bet")
            v_dc_Four = true
        }
    }
    
    @IBAction func dc_five(_ sender: AnyObject) {
        if(v_dc_Five) {
            print("Don't come five not bet")
            v_dc_Five = false
        } else {
            print("Dont come five bet")
            v_dc_Five = true
        }
    }

    @IBAction func dc_six(_ sender: AnyObject) {
        if(v_dc_six) {
            print("Don't come six not bet")
            v_dc_six = false
        } else {
            print("Don't coms six bet")
            v_dc_six = true
        }
        
    }
    @IBAction func dc_eight(_ sender: AnyObject) {
        if(v_dc_Eight) {
            print("Don't come eight not bet")
            v_dc_Eight = false
        } else {
            print("Don't come eight bet")
            v_dc_Eight = true
        }
    }
    
    @IBAction func dc_nine(_ sender: AnyObject) {
        if(v_dc_Nine) {
            print("Don't come nine not bet")
            v_dc_Nine = false
        } else {
            print("Don't come nine bet")
            v_dc_Nine = true
        }
    }
    @IBAction func dc_tex(_ sender: AnyObject) {
        if(v_dc_Ten) {
            print("Don't come ten not bet")
            v_dc_Ten = false
        } else {
            print("Don't come ten bet")
            v_dc_Ten = true
        }
        
    }
    @IBAction func come(_ sender: AnyObject) {
        if(v_comeBet) {
            print("No come bet")
            v_comeBet = false
        } else {
            print("Come bet")
            v_comeBet = true
        }
        
    }
    @IBAction func odds(_ sender: AnyObject) {
        if(v_odds) {
            print("Odds not bet")
            v_odds = false
        } else {
            print("Odds bet")
            v_odds = true
        }
        
    }
    @IBAction func dontcome(_ sender: AnyObject) {
        if(v_dontCome) {
            print("Don't come not bed")
            v_dontCome = false
        } else {
            print("Don't come action")
            v_dontCome = true
        }
        
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

