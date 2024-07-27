//
//  HomeViewController.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Public properties -
    
    @IBOutlet weak var stationTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var opt1: UIButton!
    @IBOutlet weak var opt2: UIButton!
    @IBOutlet weak var opt3: UIButton!
    
    private let picker = UIDatePicker()

    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        [opt1, opt2, opt3].forEach {
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.cornerRadius = 12
        }
        opt1Tap()
        
        stationTextField.delegate = self
        timeTextField.delegate = self
        
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        let filler = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTap))
        toolbar.setItems([filler, doneButton], animated: false)
        
        timeTextField.inputView = picker
        timeTextField.inputAccessoryView = toolbar
    }

    @objc func doneTap() {
        timeTextField.text = picker.date.description
        timeTextField.resignFirstResponder()
    }
    
    @IBAction func opt1Tap() {
        opt1.layer.borderWidth = 2
        
        [opt2, opt3].forEach {
            $0?.layer.borderWidth = 0
        }
    }
    
    @IBAction func opt2Tap() {
        opt2.layer.borderWidth = 2
        
        [opt3, opt1].forEach {
            $0?.layer.borderWidth = 0
        }
    }
    
    @IBAction func opt3Tap() {
        opt3.layer.borderWidth = 2
        
        [opt1, opt2].forEach {
            $0?.layer.borderWidth = 0
        }
    }
    
    @IBAction func recommendationButtonTap() {
        
        let chosen = [opt1, opt2, opt3].first(where: { $0?.layer.borderWidth == 2 }) ?? opt1
        guard let choice = chosen else { return }
        
        let sale = switch choice {
        case opt1:
            "Bakso"
        case opt2:
            "Burger"
        case opt3:
            "Ayam"
        default:
            "Bakso"
        }
        
        
        presenter.recommend(
            sale: sale,
            location: stationTextField.text!,
            time: timeTextField.text!
        )
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}
