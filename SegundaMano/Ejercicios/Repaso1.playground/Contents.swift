import UIKit

var str = "Hello, playground"


class Figura: CustomStringConvertible, Comparable {



    /* Variables y funciones estáticas que queremos que estén asociadas a nuestra clase
     para llevar la cuenta de figuras creadas por ejemplo

     */

    static var figurasCreadasGlobal = 0

    static func dimeNumeroFigurasCreadas() -> Int {
        return figurasCreadasGlobal
    }

    let lado: Double
    let numeroLados: Int


    init(lado: Double, numeroLados: Int) {
        self.lado = lado
        self.numeroLados = numeroLados
        Figura.figurasCreadasGlobal += 1
    }

    deinit {
        print("Me destruyo \(self)")
        Figura.figurasCreadasGlobal -= 1
    }

    var description: String {
        return "Soy una figura con lado \(lado) y perímetro \(perimetro)"
    }
    var perimetro: Double {
        return lado * Double(numeroLados)
    }

    var area: Double {
        return 0.0
    }

    static func < (lhs: Figura, rhs: Figura) -> Bool {
        return lhs.area < rhs.area
    }

    static func == (lhs: Figura, rhs: Figura) -> Bool {
        return lhs.area == rhs.area
    }

    

}

class Cuadrado: Figura {
     init(lado: Double) {
        super.init(lado: lado, numeroLados: 4)
        }
    override var description: String {
        return "Soy un cuadrado con lado \(self.lado) y perímetro \(self.perimetro)"
    }

    override var area: Double {
        return self.lado * self.lado
    }
}

    class Triangulo: Figura {
        init(lado: Double) {
            super.init(lado: lado, numeroLados: 3)
        }

        override var description: String {
            return "Soy un triángulo con lado \(self.lado) y perímetro \(self.perimetro)"
        }

        override var area: Double {
            return (sqrt(3)/4) * (self.lado * 2)
        }
}

class Circulo: Figura {
    init(radio: Double) {
        super.init(lado:radio, numeroLados: 1)
    }

    override var description: String {
        return "Soy un círculo de rado \(lado) y perímetro \(perimetro)"
    }

    override var perimetro: Double {
        return 2 * Double.pi * lado
    }

    override var area: Double {
        return Double.pi * lado * lado
    }
}

func probar () {



let c1 = Cuadrado(lado: 3.0)
let t1 = Triangulo (lado: 5.0)

let cir1 = Circulo(radio: 15.0)


    let c2 = Cuadrado(lado: 3.0)
    let t2 = Triangulo (lado: 5.0)

    let cir2 = Circulo(radio: 15.0)

let figuras = [c1,t1, cir1, c2,t2, cir2];

figuras.forEach{ (figura) in
    print ("Perímetro \(figura.perimetro)")
    print ("Área \(figura.area)")
}



print ("Se han creado \(Figura.figurasCreadasGlobal) figuras")

print ("Se han creado \(Figura.dimeNumeroFigurasCreadas()) figuras")


    figuras.sorted().forEach{ (figura) in
        //print ("Perímetro \(figura.perimetro)")
        print ("Área \(figura.area)")
    }

}

probar()


