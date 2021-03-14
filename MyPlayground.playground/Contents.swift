import Foundation

class Weapon {
    var dm: Int
    var qluality: Int
    var name: String
    
    init(name: String, dm: Int, qluality: Int) {
        self.name = name
        self.dm = dm
        self.qluality = qluality
    }
    
    func getLife() -> Bool {
        return self.qluality <= 0
    }
    
    func hitPlis() -> Int {
        qluality = qluality - 1
        return dm
    }
}

class Armor {
    var hp: Int
    var name: String
    
    var getes = true
    
    init(name: String, hp: Int) {
        self.name = name
        self.hp = hp
    }
}

class Person {
    var name: String
    
    var hp: Int
    var dm: Int
    
    var weapon: Weapon?
    var armor: Armor?
    
    init(name: String, hp: Int, dm: Int) {
        self.name = name
        self.dm = dm
        self.hp = hp
    }
    
    func hit(ant: Person)  {
        let l = Int.random(in: 1...10)
        
        let artWeapon = ant.weapon
        let artsArmor = self.armor
        
        if l <= 5 {
            if armor?.getes ?? false {
                armor?.getes = false
                
                self.hp = self.hp * (armor?.hp ?? 0)
            }
            
            self.hp = self.hp - (ant.dm + (artWeapon?.hitPlis() ?? 0))
            
            if artWeapon?.getLife() ?? false {
                ant.weapon = nil
            }
        }
    }
    
    func getLife() -> Bool {
        return self.hp <= 0
    }
    
    func showStatus() {
        print("name: \(name)")
        print("hp: \(hp)")
        print("dm: \(dm)\n")
    }
}

var isGame = true
var ant1 = Person(name: "Hero", hp: 150, dm: 10)
ant1.armor = Armor(name: "Шит", hp: 2)
ant1.weapon = Weapon(name: "Sword", dm: 100, qluality: 20)

var ant2 = Person(name: "Dragon", hp: 1000, dm: 20)

var nameToWin = ""

while isGame {
    ant1.showStatus()
    ant2.showStatus()
    
    sleep(2)

    print("\(ant1.name) hit to \(ant2.name)\n")
    ant2.hit(ant: ant1)
    
    if ant2.getLife() {
        nameToWin = ant1.name
        isGame = false
        break
    }
    
    ant1.showStatus()
    ant2.showStatus()
    
    sleep(2)

    print("\(ant2.name) hit to \(ant1.name)\n")
    ant1.hit(ant: ant2)
    
    if ant1.getLife() {
        nameToWin = ant2.name
        isGame = false
        break
    }
}

print("\n Person TO WIN \(nameToWin)")
