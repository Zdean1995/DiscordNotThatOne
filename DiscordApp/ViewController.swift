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
    var isCard = false
    var size = CGSize()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        size = CGSize(width: scrolllViewa.frame.width, height: (scrolllViewa.frame.width*1.4))
        if UserDefaults.standard.string(forKey: "pool") == nil
        {
            UserDefaults.standard.set(PoolType.commander.rawValue, forKey: "pool")
        }
    }
    
    @IBAction func clearCards(_ sender: Any) {
        for view in oldCardViews{
            oldCards.removeArrangedSubview(view)
        }
        oldCardViews.removeAll()
        cards.removeAll()
        cardImg.image = UIImage(named: "question_mark")
    }
    
    @IBAction func discardCard(_ sender: Any) {
        cardImg.image = UIImage(named: "question_mark")
        isCard = false
    }
    
    @IBAction func getRando(_ sender: Any) {
        if newCardGotten {
            Task {
                do{
                    newCardGotten = false
                    if !cards.isEmpty && isCard {
                        let imgUrl = URL(string: (cards.last?.image_uris?["normal"]! ?? cards.last?.card_faces!.first!.image_uris["normal"])!)
                        
                        let (data, _) = try await URLSession.shared.data(from: imgUrl!)
                        
                        let oldCardImg = UIImage(data: data)
                        
                        let newCardImg = oldCardImg?.imageWith(newSize: size)
                        
                        let oldCard = UIImageView(image: newCardImg!)
                        oldCardViews.append(oldCard)
                        
                        for view in oldCardViews{
                            oldCards.removeArrangedSubview(view)
                        }
                        
                        for i in (1...oldCardViews.count).reversed() {
                            oldCards.addArrangedSubview(oldCardViews[i-1])
                        }
                        
                    }
                    let card = try await
                    ScryfallApiHelper.fetchRandomCard()
                    
                    let imgUrl = URL(string: (card.image_uris?["normal"]! ?? card.card_faces!.first!.image_uris["normal"])!)
                    
                    let (data, _) = try await URLSession.shared.data(from: imgUrl!)
                    
                    cardImg.image = UIImage(data: data)
                    cards.append(card)
                    newCardGotten = true
                    isCard = true
                } catch {
                    preconditionFailure("Error: program failed with error \(error)")
                }
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
