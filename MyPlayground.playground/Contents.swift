import UIKit

class VirtualVendingMachine {
    enum DrinkType {
        case coffee
        case water
        case monster
    }

    var inputedYen: Int = 0

    var coffeePrice: Int = 120
    var waterPrice: Int = 100
    var monsterPrice: Int = 210

    var coffeeStock: Int = 10
    var waterStock: Int = 15
    var monsterStock: Int = 5
    
    var changeAmount: Int = 0

    func buyDrink(type: DrinkType, inputedYen: Int){
        self.inputedYen = inputedYen
        var isBuyable = false
        
        switch type {
        case .coffee:
            isBuyable = coffeePrice <= inputedYen && 0 < coffeeStock
            changeAmount = inputedYen - coffeePrice
        case .water:
            isBuyable = waterPrice <= inputedYen && 0 < waterStock
            changeAmount = inputedYen - waterPrice
        case .monster:
            isBuyable = monsterPrice <= inputedYen && 0 < monsterStock
            changeAmount = inputedYen - monsterPrice
        }
        
        var stock: Int = reduceStock(type: type)
        
        if isBuyable {
            printResult(type: type, stock: stock)
        }
    }

    func reduceStock(type: DrinkType) -> Int {
        switch type {
        case .coffee:
            coffeeStock -= 1
            return coffeeStock
        case .water:
            waterStock -= 1
            return waterStock
        case .monster:
            monsterStock -= 1
            return monsterStock
        }
    }
    
    func printResult(type: DrinkType, stock: Int){
        print("\(type)を購入できました。")
        print("\(type)はあと\(stock)本です。")
        print("お釣り：\(changeAmount)円")
    }
}

let virtualVendingMachine = VirtualVendingMachine()
virtualVendingMachine.buyDrink(type: .coffee, inputedYen: 150)
