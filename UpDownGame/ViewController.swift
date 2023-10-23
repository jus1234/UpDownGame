//
//  ViewController.swift
//  UpDownGame
//
//  Created by 장우석 on 10/18/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터 숫자
    var comNumber = 0
    // 유저 숫자
    var myNumber = 0
    
    // 앱의 화면에 드어오면 가장 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitData()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자 가져오기
        // 2) 숫자레이블이 변하도록 하기
        // 3) 선택한 숫자를 변수에 저장(선택)
        myNumber = Int(sender.currentTitle!)!
        numberLabel.text = String(myNumber)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        mainLabel.text = myNumber > 0 ? matchNumbers(myNumber, comNumber) : "아직 선택하지 않았습니다"
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setInitData()
    }
    
    /**
     초기 값 세팅(각 레이블, 컴퓨터/유저 숫자)
     */
    func setInitData() {
        comNumber = Int.random(in: 1...10)
        myNumber = 0
        
        numberLabel.text = ""
        mainLabel.text = "선택하세요"
    }
    
    /**
    컴퓨터와 유저의 숫자 일치 여부 판단
     */
    func matchNumbers(_ myNum: Int, _ comNum: Int) -> String {
        return myNum == comNum ? "Bingo😎" : getUpDown(myNum, comNum)
    }
    
    /**
     컴퓨터와 유저의 숫자 대소 비교
     */
    func getUpDown(_ myNum: Int, _ comNum: Int) -> String {
        return myNum > comNum ? "Down" : "Up"
    }
    
}

