//
//  ViewController.swift
//  Control Fun
//
//  Created by Anjali Thapa Magar on 19/09/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numberfield: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var segementedcontrol: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //label will show the value of slider
    @IBAction func onSliderChanged(_ sender: UISlider){
        label.text = "\(lroundf(sender.value))"
    }
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            //"Switches" will be selected
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            button.isHidden = true
        }else {
            //button will be selected
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            button.isHidden = false
        }
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes I'm sure!", style: .destructive, handler: {action in
            let msg = self.namefield.text!.isEmpty ?
            "You can breathe easy, everything went OK." : "You can breathe easy, \(String(describing: self.namefield.text)),"+"everything went OK."
            
            let controller2 = UIAlertController(title: "Something Was Done", message: msg, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
            
            controller2.addAction(cancelAction)
            
            self.present(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        
        present(controller, animated: true, completion: nil)
    }
    
}

