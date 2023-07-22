//
//  ViewController.swift
//  Homework_Bulls_Eye
//
//  Created by Dmitriy Mkrtumyan on 11.07.23.
//

import UIKit

final class ViewController: UIViewController {

    private var score: Int = 0 {
        didSet {
            scoreLbl.text = "\(score)"
        }
    }
    let initialPoint: Int = 24
    
    // MARK: - Labels
    private var topTextLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Put the Bull's eye as you can close to:  "
        lbl.textColor = .black
        return lbl
    }()
    
    private var pointLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "24"
        lbl.textColor = .yellow
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    private var scoreLbl = UILabel()
    
    // MARK: - Slider
    private var slider: UISlider = {
        let newSlider = UISlider()
        newSlider.maximumValue = 100
        newSlider.value = 50
        return newSlider
    }()
    
    // MARK: - StackViews
    private var mainTxtStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private var sliderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Buttons
    private var hitMeBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitle("Hit Me", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private var startOverBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitle("Start Over", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()

    // MARK: - Methods
    private func setupStackView() {
        self.view.addSubview(mainTxtStackView)
        mainTxtStackView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width - 200, height: 50)
        mainTxtStackView.translatesAutoresizingMaskIntoConstraints = false
        mainTxtStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainTxtStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        mainTxtStackView.addArrangedSubview(topTextLbl)
        mainTxtStackView.addArrangedSubview(pointLbl)
    }
    
    private func setupSliderStackView() {
        self.view.addSubview(sliderStackView)

        let minPointLbl = UILabel()
        let maxPointLbl = UILabel()
        
        minPointLbl.text = "1 "
        maxPointLbl.text = " 100"
        minPointLbl.textColor = .white
        maxPointLbl.textColor = .white
        minPointLbl.font = .systemFont(ofSize: 20, weight: .bold)
        maxPointLbl.font = .systemFont(ofSize: 20, weight: .bold)
        
        sliderStackView.addArrangedSubview(minPointLbl)

        sliderStackView.addArrangedSubview(slider)
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 200).isActive = true
        sliderStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sliderStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sliderStackView.topAnchor.constraint(equalTo: self.mainTxtStackView.topAnchor, constant: 50).isActive = true
        
        sliderStackView.addArrangedSubview(maxPointLbl)
    }
    
    private func setupHitMeBtn() {
        self.view.addSubview(hitMeBtn)
        hitMeBtn.translatesAutoresizingMaskIntoConstraints = false
        hitMeBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        hitMeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        hitMeBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        hitMeBtn.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 50).isActive = true
        viewDidLayoutSubviews()
        hitMeBtn.layer.cornerRadius = 8.0
        hitMeBtn.layer.shadowColor = UIColor(cgColor: CGColor(gray: 1, alpha: 1)).cgColor
        hitMeBtn.layer.shadowRadius = 10
        hitMeBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewDidLayoutSubviews()
        
    }
    
    private func setupFooterStackView() {
        let scoreTitleLbl = UILabel()

        self.view.addSubview(footerStackView)
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        footerStackView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        footerStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        footerStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        footerStackView.topAnchor.constraint(equalTo: self.hitMeBtn.bottomAnchor, constant: 50).isActive = true
        
        footerStackView.addArrangedSubview(startOverBtn)
        startOverBtn.translatesAutoresizingMaskIntoConstraints = false
        startOverBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        startOverBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        startOverBtn.leftAnchor.constraint(equalTo: footerStackView.leftAnchor, constant: 0).isActive = true
        viewDidLayoutSubviews()
        startOverBtn.layer.cornerRadius = 8.0
        startOverBtn.layer.shadowColor = UIColor(cgColor: CGColor(gray: 1, alpha: 1)).cgColor
        startOverBtn.layer.shadowRadius = 10
        startOverBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewDidLayoutSubviews()
        
        footerStackView.addArrangedSubview(scoreTitleLbl)
        scoreTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        scoreTitleLbl.text = "Score:"
        scoreTitleLbl.textColor = .white
        scoreTitleLbl.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreTitleLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        scoreTitleLbl.leftAnchor.constraint(equalTo: startOverBtn.rightAnchor, constant: 50).isActive = true
        
        footerStackView.addArrangedSubview(scoreLbl)
        scoreLbl.translatesAutoresizingMaskIntoConstraints = false
        scoreLbl.text = "\(score)"
        scoreLbl.textColor = .yellow
        scoreLbl.widthAnchor.constraint(equalToConstant: 30).isActive = true
        scoreLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        scoreLbl.leftAnchor.constraint(equalTo: scoreTitleLbl.rightAnchor, constant: 0).isActive = true
    }
    
    private func hitMeButtonActionSetup() {
        hitMeBtn.addTarget(self, action: #selector(hitMeBtnTapped(sender:)), for: .touchUpInside)
    }
    
    private func startOverActionSetup() {
        startOverBtn.addTarget(self, action: #selector(startOverBtnTapped(sender:)), for: .touchUpInside)
    }
    
    // MARK: OBJC methods
    @objc
    private func hitMeBtnTapped(sender: UIButton) {
        checkDifference()
    }
 
    func checkDifference() {
        var answer = Answer.excellent
        let sliderCurrentPoint = Int(slider.value)
        let difference = abs(Int32(initialPoint - sliderCurrentPoint))

        if initialPoint > sliderCurrentPoint {
            if difference <= 1 {
                answer = .excellent
                score = 10
                self.alert(title: "You won!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            } else if difference <= 5 {
                answer = .notBad
                score = 5
                self.alert(title: "You won!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            } else {
                answer = .veryBad
                score = 0
                self.alert(title: "You lose!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            }
        } else {
            if difference <= 1 {
                answer = .excellent
                score = 10
                self.alert(title: "You won!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            } else if difference <= 5 && difference > 1 {
                answer = .notBad
                score = 5
                self.alert(title: "You won!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            } else {
                answer = .veryBad
                score = 0
                self.alert(title: "You lose!", message: "\(answer.rawValue) The point of Slider is: \(sliderCurrentPoint)")
            }
        }
        
    }
    
    @objc
    private func startOverBtnTapped(sender: UIButton) {
        slider.value = 50
        self.alert(title: "Get ready", message: "New game is started!")
    }
        
    
    // MARK: - Overrided methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupStackView()
        setupSliderStackView()
        setupHitMeBtn()
        setupFooterStackView()
        hitMeButtonActionSetup()
        startOverActionSetup()
    }
}

