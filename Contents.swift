//: Playground - noun: a place where people can play

import UIKit
import GameKit

//give the card struct a property "Color" which will hold the color values associated with the card
struct Card {
    var color: String
    var roll: Int = 0
    
    init(color: String){
        self.color = color
        
        if color == "BLUE" {
            roll = Int(arc4random_uniform(2) + 1)
        }
        if color == "RED" {
            roll = Int(arc4random_uniform(2) + 3)
        }
        if color == "GREEN" {
            roll = Int(arc4random_uniform(3) + 4)
        }
    }
    
    
    func rollCards() -> String {
        let randomRoll = Int(arc4random_uniform(6) + 1)
        if randomRoll == 1 || randomRoll == 2 {
            print("Card color is blue and random Number -> \(randomRoll)")
            return "BLUE"
        }
        if randomRoll == 3 || randomRoll == 4 {
            print("Card color is red and random Number -> \(randomRoll)")
            return "RED"
        }
        if randomRoll == 4 || randomRoll == 5 || randomRoll == 6 {
            print("Card color is green and random Number -> \(randomRoll)")
            return "GREEN"
        }
        return "No color selected my dear"
    }
}

class Deck {
    var cards: [Card]
    
//    create a initializer otherwise the app would crash
    init() {
        self.cards = []
        
        for _ in 0...10 {
            let cardRed = Card(color: "RED")
            cards.append(cardRed)
            
            let cardGreen = Card(color: "GREEN")
            cards.append(cardGreen)
            
            let cardBlue = Card(color: "BLUE")
            cards.append(cardBlue)
        }
    }
//        remove the last card from the stack
        func deal() -> Card {
            let card = cards.removeLast()
            return card
        }
        
//        if there are no cards left return false
        func isEmpty() -> Bool {
            return cards.isEmpty
        }
        
//        reshuffle the deck card's
        func shuffle() {
            let unshuffledArray = cards
            let shuffledCards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: unshuffledArray)
            print("Those are the shuffled Cards -> \(shuffledCards)")
        }
}

class Player {
    let name: String
    var hand: [Card] = []
    
    init(name: String ) {
        self.name = name
    }
    
    func draw(deck: Deck) -> Card {
        self.hand.append(deck.deal())
        return self.hand[hand.count - 1]

    }
    
    func rollDice() -> Int {
        let randomNumber = Int(arc4random_uniform(6) + 1)
        return randomNumber
    }
    
    func matchingCards(color: String, roll: Int) -> Int {
        var count = 0
        for card in hand {
            if card.color == color && card.roll == roll {
                count += 1
            }
        }
        return count
    }
}

var player = Player(name: "Isabell")
var deck = Deck()
print (deck.cards)
deck.shuffle()
print(deck.cards)
//print(shuffledCards)
















