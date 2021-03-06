//
//  GameEndViewController.swift
//  Quest_game
//
//  Created by Admin on 09.05.2021.
//

import Foundation
import UIKit
class GameEndViewController : UIViewController
{
    
    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    override func viewDidLoad() {
        ResultLabel.text = "Ваш счет: "+String.init(GameManager.currentScore)
        if GameManager.user.score < GameManager.currentScore{
            ResultLabel.text?.append("\n Поздравляем, вам удалось побить свой рекорд!\n Новый рекорд сохранен")
            Client.instance.requestScoreUpdate(score: GameManager.currentScore, id: GameManager.user.id)
        }
        else{
            ResultLabel.text?.append("\n К сожалению, вам не удалось побить свой рекорд :(")
        }
        
        MenuButton.addTarget(self, action: #selector(menu), for: .touchUpInside)
       
    
    }
    
    @objc func menu(){
        print("Menuuuu")
        navigateToMenu()
    }
    
    @IBAction func Menu(_ sender: Any) {
        print("Menuuuu")
        navigateToMenu()
    }
    
    func navigateToMenu() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let questionsChoosingVC = storyBoard.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        self.present(questionsChoosingVC, animated: true, completion: nil)
    }
    func navigateToLogin() {
        let topVC = topMostController()
        let vcToPresent = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        topVC.present(vcToPresent, animated: true, completion: nil)
    }
    
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
}
