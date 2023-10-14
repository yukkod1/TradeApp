//
//  TradeViewController.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 27/07/2023.
//

import UIKit
import SnapKit
import JMMaskTextField_Swift

class TradeViewController: UIViewController, PairDidChoose {
    
    func pairDidChoose(pair: String) {
        gpdButton.setTitle(pair, for: .normal)
    }

    private var timerValue = 0
    private var investValue = 0
    let progress = Progress(totalUnitCount: 10)
    var keyboardHeight: CGFloat = 0
    private var balanceValue = 10000
    var bottomViewConstraint: Constraint?
    
    
        
        
    lazy private var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.tintColor = .lightGreen
        return view
    }()
    
    lazy private var progressLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-SemiBold", size: 16)
        return view
    }()
    
    lazy private var webImage: UIWebView = {
       let view = UIWebView()
        view.isHidden = true
        return view
        
    }()
    
    lazy private var bd: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "BD")
        return view
    }()
    
    lazy private var balanceView: UIView =  {
       let view = UIView()
        view.isHidden = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightGray2
        view.isHidden = true
        
        return view

    }()
    
    lazy private var gpdButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(choosePairOpenVc), for: .touchUpInside)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightGray2
        view.setTitle("GPB/USD", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold
        )
        
       // view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return view
    }()
    
    lazy private var timerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightGray2
        
        return view
    }()
    
    lazy private var investmentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightGray2
        
        return view
    }()
    
    lazy private var sellButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightRed
        view.setTitle("Sell", for: .normal)
        view.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 24)
        return view
        
    }()
    
    lazy private var buyButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .lightGreen
        view.setTitle("Buy", for: .normal)
        view.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 24)
        return view
    }()
    
    lazy private var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = .normalGray
        view.isHidden = true
        return view
    }()
    
    lazy private var timerTextField: JMMaskTextField = {
        let view = JMMaskTextField()
        view.delegate = self
        view.maskString = "00:00"
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .white
        
        return view
    }()
    
    lazy private var plusTimerButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(timerPlus), for: .touchUpInside)
        view.setImage(UIImage(named: "add-circle"), for: .normal)
        return view
    }()
    
    lazy private var minusTimerButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(timerMinus), for: .touchUpInside)
        view.setImage(UIImage(named: "minus-cirlce"), for: .normal)
        return view
    }()
    
    lazy private var investmentTextField: JMMaskTextField = {
        let view = JMMaskTextField()
        view.delegate = self
        
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .white
        return view
    }()
    
    lazy private var minusInvestmentButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(investMinus), for: .touchUpInside)
        view.setImage(UIImage(named: "minus-cirlce"), for: .normal)
        return view
    }()
    
    lazy private var plusInvestmentButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(investPlus), for: .touchUpInside)
        view.setImage(UIImage(named: "add-circle"), for: .normal)
        return view
    }()
    
    
    lazy private var balanceNumberLabel: UILabel = {
        let view = UILabel()
        view.text = String(balanceValue)
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    
    lazy private var balanceLabel: UILabel = {
        let view = UILabel()
        view.text = "Balance"
        view.textColor = .lightGray
        view.font = UIFont(name: "Inter-Medium", size: 12)
        
        return view
    }()
    
    lazy private var timerNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Timer"
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        return view
    }()
    
    lazy private var timerCountLabel: UILabel = {
        let view = UILabel()
        view.text = timeStringFor(seconds: timerValue)
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    lazy private var investmentNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Investment"
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        return view
        
    }()
    
    lazy private var investmentCountLabel: UILabel = {
        let view = UILabel()
        view.text = String(investValue.formatted())
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return view
        
    }()
    

    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray2
        
        title = "Trade"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Inter-SemiBold", size: 22)!
        ]
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        setupBD()
        setupProgressBar()
        setupProgressLabel()
        setupBalanceView()
        balanceSubviews()
        setupWebImage()
        setupButtonView()
        setupGpdButton()
        setupTimerView()
        setupTimerComponents()
        setupInvestmentView()
        setupInvestmentComponents()
        setupSellButotn()
        setupBuyButton()
        addNotificationsToTextFields()
    
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                self.view.addGestureRecognizer(tapRec)

        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                
                self.navigationController?.navigationBar.isHidden = false
                self.progressBar.isHidden = true
                self.progressLabel.isHidden = true
                self.balanceView.isHidden = false
                self.webImage.isHidden = false
                self.bd.isHidden = true
                self.buttonView.isHidden = false
                self.tabBarController?.tabBar.isHidden = false
                
                return
            }
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressBar.progress = progressFloat
            self.progressLabel.text = "\(Int(self.progressBar.progress * 100))" + "%"
            
        })
        
        
    }
    
    private func setupProgressLabel() {
        self.view.addSubview(progressLabel)
        progressLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    private func setupProgressBar() {
        self.view.addSubview(progressBar)
        progressBar.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300).offset(UIScreen.main.resolveConstant(small: 270, medium: 300, big: 350))
            $0.height.equalTo(24).offset(UIScreen.main.resolveConstant(small: 24, medium: 24, big: 28))
        }
    }
    
    private func setupBalanceView() {
        self.view.addSubview(balanceView)
        balanceView.snp.makeConstraints {
            
            $0.top.equalToSuperview().offset(UIScreen.main.resolveConstant(small: 60, medium: 105, big: 105))
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.height.equalTo(54)
        }
    }
    
    private func balanceSubviews() {
        self.balanceView.addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.centerX.equalToSuperview()
        }
        
        self.balanceView.addSubview(balanceNumberLabel)
        balanceNumberLabel.snp.makeConstraints {
            $0.top.equalTo(self.balanceLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setupWebImage() {
        self.view.addSubview(webImage)
        
        
        webImage.snp.makeConstraints {
            $0.top.equalTo(self.balanceView.snp.bottom).offset(UIScreen.main.resolveConstant(small: 15, medium: 25, big: 30))
            $0.height.equalTo(350)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
    
    private func setupBD() {
        self.view.addSubview(bd)
        bd.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupButtonView() {
        self.view.addSubview(buttonView)
        buttonView.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.left.equalToSuperview()
            $0.top.equalTo(self.webImage.snp.bottom).offset(0)
            self.bottomViewConstraint = $0.bottom.equalToSuperview().constraint
        }
        
    }
    
    private func setupGpdButton() {
        self.buttonView.addSubview(gpdButton)
        gpdButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.resolveConstant(small: 12, medium: 16, big: 20))
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.height.equalTo(54)
        }
    }
    
    private func setupTimerView() {
        self.buttonView.addSubview(timerView)
        timerView.snp.makeConstraints {
            $0.top.equalTo(self.gpdButton.snp.bottom).offset(UIScreen.main.resolveConstant(small: 8, medium: 10, big: 15))
            $0.left.equalTo(self.buttonView.snp.left).offset(30)
            $0.height.equalTo(54)
            $0.width.equalTo(152).offset(UIScreen.main.resolveConstant(small: 152, medium: 152, big: 175))
            
        }
    }
    
    private func setupTimerComponents() {
        self.timerView.addSubview(timerNameLabel)
        timerNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.centerX.equalToSuperview()
        }
        
        self.timerView.addSubview(timerCountLabel)
        timerCountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        self.timerView.addSubview(timerTextField)
        timerTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        self.timerView.addSubview(plusTimerButton)
        plusTimerButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-9)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
        
        self.timerView.addSubview(minusTimerButton)
        minusTimerButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-9)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
    }
    
    private func setupInvestmentView() {
        self.buttonView.addSubview(investmentView)
        investmentView.snp.makeConstraints {
            $0.top.equalTo(self.gpdButton.snp.bottom).offset(UIScreen.main.resolveConstant(small: 8, medium: 10, big: 15))
            $0.right.equalTo(self.buttonView.snp.right).offset(-30)
            $0.height.equalTo(54)
            $0.width.equalTo(152).offset(UIScreen.main.resolveConstant(small: 152, medium: 152, big: 175))
            
        }
    }
    
    private func setupInvestmentComponents() {
        self.investmentView.addSubview(investmentNameLabel)
        investmentNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.centerX.equalToSuperview()
        }
        
        self.investmentView.addSubview(investmentCountLabel)
        investmentCountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        self.investmentView.addSubview(investmentTextField)
        investmentTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        self.investmentView.addSubview(plusInvestmentButton)
        plusInvestmentButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-9)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
        
        self.investmentView.addSubview(minusInvestmentButton)
        minusInvestmentButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-9)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
    }
    private func setupSellButotn() {
        self.buttonView.addSubview(sellButton)
        sellButton.snp.makeConstraints {
            $0.top.equalTo(self.timerView.snp.bottom).offset(UIScreen.main.resolveConstant(small: 8, medium: 10, big: 15))
            $0.left.equalTo(self.buttonView.snp.left).offset(30)
            $0.height.equalTo(54)
            $0.width.equalTo(152).offset(UIScreen.main.resolveConstant(small: 152, medium: 152, big: 175))
            
        }
    }
    
    private func setupBuyButton() {
        self.buttonView.addSubview(buyButton)
        buyButton.snp.makeConstraints {
            $0.top.equalTo(self.investmentView.snp.bottom).offset(UIScreen.main.resolveConstant(small: 8, medium: 10, big: 15))
            $0.right.equalTo(self.buttonView.snp.right).offset(-30)
            
            $0.height.equalTo(54)
            $0.width.equalTo(152).offset(UIScreen.main.resolveConstant(small: 152, medium: 152, big: 175))
            
        }
    }
    
    func addNotificationsToTextFields() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func choosePairOpenVc() {
        let vc = ChoosePairViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func investMinus() {
        
        if investValue <= 100 {
            return
        }
        investValue -= 100
        self.investmentCountLabel.text = String(investValue.formatted())
    }
    
    @objc func investPlus() {
        
        investValue += 100
        if investValue >= balanceValue {
            self.investValue = self.balanceValue 
        }
        self.investmentCountLabel.text = String(investValue.formatted())
    }
    
    @objc func timerMinus() {
        if timerValue > 0 {
            timerValue -= 10
            self.timerCountLabel.text = timeStringFor(seconds: timerValue)
        }
        
    }
    
    @objc func timerPlus() {
        timerValue += 10
        self.timerCountLabel.text = timeStringFor(seconds: timerValue)
        
    }
    
    @objc func hideKeyboard() {
            timerTextField.resignFirstResponder()
            investmentTextField.resignFirstResponder()
            self.tabBarController?.tabBar.isHidden = false
        }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            self.keyboardHeight = keyboardRectangle.height
            
            bottomViewConstraint?.update(offset: -550)
            
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.investmentCountLabel.text = String(investValue)
                self.investmentTextField.text = ""
                self.investmentCountLabel.isHidden = false
    }
    
    //UIFont.systemFont(weight: , size: )

    func timeStringFor(seconds : Int) -> String { //ВАЖНО! На объяснение
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour]
        formatter.zeroFormattingBehavior = .pad
        let output = formatter.string(from: TimeInterval(seconds))!
        return seconds < 3600 ? output.substring(from:output.range(of:":")!.upperBound) : output
    }

}

extension TradeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == timerTextField, let text = timerTextField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if !updatedText.isEmpty == true {
                self.timerCountLabel.isHidden = true
                
            } else {
                self.timerCountLabel.isHidden = false
            }
   
        } else if textField == investmentTextField, let text = investmentTextField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if !updatedText.isEmpty {
                self.investmentCountLabel.isHidden = true
                
                self.investValue = Int(updatedText) ?? 0
                
                
                if self.investValue > self.balanceValue {
                    self.investValue = self.balanceValue
                    self.investmentTextField.text = String(self.balanceValue)
                    return false
                }
                
            } else {
                self.investmentCountLabel.isHidden = false
               // self.investValue += Int(updatedText) ?? 0
                
            }
            
        }
        
        
        return true
    }
}
