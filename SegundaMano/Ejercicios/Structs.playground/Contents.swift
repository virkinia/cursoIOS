import UIKit

/* Conjuntos */

let amigosMovil: Set<String> = ["Jose", "David", "Ana", "Paulo"]
let amigosInternet: Set<String> = ["Jose", "David", "Ana", "Laura"]


amigosMovil.isEmpty
amigosMovil.count

amigosMovil.intersection(amigosInternet)
amigosMovil.isDisjoint(with: amigosInternet)

amigosMovil.union(amigosInternet)


/* Estructuras */


struct Punto {
    var x = 0.0 {
        willSet(nuevoPuntoX) {
            print("Voy a cambiar x a \(nuevoPuntoX)")

            /*Aquí pondríamos los triggers*/
        }

        didSet {
            print("He terminado de cambiar x de \(oldValue) a \(x)")
        }
    }
    var y = 0.0


}





struct Linea {
    var inicio: Punto
    var fin: Punto

    var description: String  {
        return "Voy de \(inicio.x), \(inicio.y) a \(fin.x), \(fin.y). Mi centro es \(centro.x), \(centro.y)"
    }

    var centro: Punto {
        return Punto(x:(fin.x-inicio.x)  * 0.5, y: (fin.y - inicio.y) * 0.5 )
    }
}

let p1 = Punto(x:3,y:4)

let p2 = Punto(x:6,y:8)

let l1 = Linea (inicio: p1, fin: p2)

print(l1.description)


struct PuntoDos: Comparable, CustomStringConvertible {







    /*
     Hay que indicar de manera explícita con "mutating" cuando queremos modificar
     las propiedades de PuntoDos.
     - Las estructuras están pensadas para no ser modificadas una vez creadas.
     - Cuando se modifican crean un nuevo objeto,
     por eso hay que indicar explícitamente que lo vamos a cambiar.
     - A diferencia de las Clases no tiene destructor.

     La manera correcta sería:
     - Definir como constantes los atributos
     - Usar una funcion que devuelve un nuevo objeto con los atributos modificados

     Ejemplo mutating:
     var x, y: Double

     mutating func move(dispX: Double, dispY: Double) {
     x += dispX
     y += dispY
     }

     mutating func move(dispX: Double, dispY: Double) {
     self = PuntoDos(x: x + dispX, y: y + dispY)
     }
     */

    
    let x, y: Double // Definimos como constante nuestras variables

    func moving (dispX: Double, dispY: Double) -> PuntoDos {
        return PuntoDos(x: x + dispX, y: y + dispY)
    }

    func equalsTo(_ point: PuntoDos) -> Bool {
        return self.x == point.x && self.y == point.y
    }

    static func == (lhs: PuntoDos, rhs: Punto) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    // Se aconseja utilizar un operador personalizados
    // para no confundirlo usar +++ en vez +
    static func + (lhs: PuntoDos, rhs: PuntoDos) -> PuntoDos {
        return PuntoDos(x: lhs.x + rhs.x ,y: lhs.y + rhs.y)
    }

     static func suma (_ lhs: PuntoDos, _ rhs: PuntoDos) -> PuntoDos {
        return PuntoDos(x: lhs.x + rhs.x ,y: lhs.y + rhs.y)
    }

    //Comparable desde el origen

    static func < (lhs: PuntoDos, rhs: PuntoDos) -> Bool {
        let disLhs = sqrt(pow((lhs.x), 2) + pow(lhs.y, 2));
        let disRhs = sqrt(pow((rhs.x), 2) + pow(rhs.y, 2));
        return disLhs < disRhs
    }

    var description: String {
        return "(\(x), \(y))"
    }
}



let p2_1 = PuntoDos (x: 10.0, y: 20.0)
let p2_2 = PuntoDos (x: 10.0, y: 30.0)
let p2_3 = PuntoDos (x: 40.0, y: 40.0)
let p2_4 = PuntoDos (x: 0.0, y: 1.0)

let arrayPuntosDos = [p2_1,p2_2,p2_3,p2_4 ]
print (arrayPuntosDos.sorted())


print("¿Son iguales? \(p2_1.equalsTo(p2_2))" )
print (p2_2 + p2_1)
print (PuntoDos.suma(p2_1, p2_2))


func swapValues (val1: inout Int, val2: inout Int) {
    let temp = val2
    val2 = val1
    val1 = temp
}

var a = 1
var b = 5
swapValues(val1: &a, val2: &b)

print("Valor de a: \(a), valor de b: \(b)")

