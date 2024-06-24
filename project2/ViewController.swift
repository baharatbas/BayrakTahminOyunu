//
//  ViewController.swift
//  project2
//
//  Created by Bahar Atbaş on 7.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var label: UILabel!
    
    // tüm ülkeleri tutacak bir dizi oluşturulacak ve skor dğerini tutacak bir değişken tanımlama
    
    var countries = [String]()
    var score = 0
    // doğru cevabı tutan bayrağın sayısını gösterecek bu değişkeninde 0,1 ve 2 aralığında bir değer sayıları olması lazım ki kazanan bayrağın sayısını görelim.
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //oluşturduğumuz ülke dizesine yeni elemanlar ekliyoruz.
        countries += ["france" , "estonia" , "germany" , "ireland" , "ireland" , "italy" , "monaco" , "nigeria" , "poland" , "russia" , "spain" , "spain" , "uk" , "us"]
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        
        Button1.layer.backgroundColor = UIColor.lightGray.cgColor
        Button2.layer.backgroundColor = UIColor.lightGray.cgColor
        Button3.layer.backgroundColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    func askQuestion(action : UIAlertAction! = nil){
        // dizileri karıştırmak için kullanılan bir methodtur shuffle()
        countries.shuffle() // bu methodddan sonra her countries[0]' da farklı bayrak gelir.
        //0,1 ve 2 aralığında bir değer sayıları olması lazım ki kazanan bayrağın sayısını görelim.
        correctAnswer = Int.random(in: 0...2)
        
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        label.text = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer{
            title = "Doğru"
            score += 1
        }else{
            title = "Yanlış"
            score -= 1
        }
        //yeni puanlarının ne olduğunu söyleyen bir mesaj gösterin.alert oluşturmaa
        let alert = UIAlertController(title: title , message: "Skorun \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Devam", style: .default , handler: askQuestion))
        present(alert, animated: true)
    }
    
 
}


//Birisi yanlış bayrağı seçtiğinde, uyarı mesajınızda ona hatasını söyleyin; "Yanlış!" gibi bir şey. Bu Fransa'nın bayrağı,” örneğin.

