//
//  ViewController.swift
//  DiscordApp
//
//  Created by Zachary on 2024-03-19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oldCards: UIStackView!
    @IBOutlet weak var scrolllViewa: UIScrollView!
    @IBOutlet weak var cardImg: UIImageView!
    var cards = [Card]()
    var oldCardViews: [UIImageView] = []
    var newCardGotten = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
    }
    
    @IBAction func clearCards(_ sender: Any) {
        for view in oldCardViews{
            oldCards.removeArrangedSubview(view)
        }
        oldCardViews.removeAll()
        cards.removeAll()
        cardImg.image = UIImage(named: "question_mark")
    }
    
    @IBAction func getRando(_ sender: Any) {
        Task {
            do{
                if !cards.isEmpty && newCardGotten {
                    let imgUrl = URL(string: (cards.last!.image_uris["small"])!)
                    
                    let (data, _) = try await URLSession.shared.data(from: imgUrl!)
                    
                    var oldCardImg = UIImage(data: data)
                    var size = CGSize(width: scrolllViewa.frame.width, height: (scrolllViewa.frame.width*1.4))
                    
                    let newCardImg = oldCardImg?.imageWith(newSize: size)
                    
                    let oldCard = UIImageView(image: newCardImg!)
                    
                    oldCards.addArrangedSubview(oldCard)
                    oldCardViews.append(oldCard)
                    newCardGotten = false
                }
                let card = try await
                ScryfallApiHelper.fetchRandomCard()
                
                print(card.name)
                let imgUrl = URL(string: card.image_uris["normal"]!)
                
                let (data, _) = try await URLSession.shared.data(from: imgUrl!)
                
                cardImg.image = UIImage(data: data)
                cards.append(card)
                newCardGotten = true
            } catch {
                preconditionFailure("Error: program failed with error \(error)")
            }
        }
    }
    
    @objc func deleteCard(_ sender: UIImageView) {
        sender.removeFromSuperview()
    }
}

extension UIImage {
    func imageWith(newSize: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return image.withRenderingMode(renderingMode)
    }
}
