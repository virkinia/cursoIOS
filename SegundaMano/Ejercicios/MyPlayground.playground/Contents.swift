import UIKit
import Foundation



//////////////Ejercicios//////////////

// Crear un array que el primer valor sea "uno", el segundo "dos" y así hasta donde se quiera...


var arrayNumeros : [String] = ["uno", "dos", "tres"]


// Hacer una función donde le paso un número y devuelve el valor de número en texto

func toStringNumero(_ numero: Int) -> String {
    if numero <= arrayNumeros.count {
    return arrayNumeros[numero-1]
    }
    else {
        return "a tanto no llego"
    }
}

func toStringNumero2(_ numero: Int) -> String {

    if (0...arrayNumeros.count) ~= numero {
        return arrayNumeros[numero-1]
    }  else {
        return "a tanto no llego"
    }


}

print(toStringNumero(2))

print(toStringNumero(5))

// Ejemplo: toText(number: Int) si paso toText(2) debe devolver "dos"

// Si el número no está en el rango de valores permitidos, devolver "a tanto no llego"

var diccionario: [String: Int] = ["uno":1, "dos": 2, "tres": 3, "cuatro": 4, "cinco": 5]

func toNumber(_ numero: String) -> Any {
    return diccionario[numero] ?? "a tanto no llego"
}


toNumber("uno");
toNumber("dos")

toNumber("veintidos")



/////// OPCIONALES /////////

func subString(_ cadena: String) -> Bool {
    return cadena.starts(with:"http") || cadena.hasPrefix("https")
}

subString("https://developer.apple.com/documentation/swift/string/1541044-init")
subString("http://developer.apple.com/documentation/swift/string/1541044-init")
subString("developer.apple.com/documentation/swift/string/1541044-init")


func farenheit(_ grados: Double) -> Double {
    return grados * 9 / 5 + 32
}

farenheit(30)


func toNumber(_ data: String) -> Int? {
    let a: Int? = Int(data);
    return a
}

toNumber("sa")

let numero1 = Double("3")
let numero2 = Double("2.9")

type(of: numero1)

func addOptionals(numero1: Double?, numero2: Double?) -> Double? {
    guard let var1 = numero1, let var2 = numero2 else {
        return nil
    }

    return var1 + var2
}



addOptionals(numero1: numero1, numero2: numero2)

func toNumber(data: String) -> Double? {

    return Double(data)
}

if let fecha = toNumber(data: "22"){
    if  let temperatura = toNumber(data: "18.9") {
         print ("Hoy es día \(fecha) y hace una temperatura de \(temperatura)")
    }
}


func toNumberDos(data: String?) -> Double? {

    if let var1 = data {
        return Double(var1);
    }else {
        return nil;
    }
}

    if  let fecha = toNumberDos(data: "21"),
        let temperatura = toNumberDos(data: "21"),
        temperatura > 20,
        Int(fecha)%2 == 0 {
        print ("Hoy es día \(fecha) y hace una temperatura de \(temperatura)")
    }



///////// ARRAYS ////////

// Creación

var primos = ["1", "3", "5"]
let primosMix: [Any] = [1, "3", 4]
let primosVacio: [String] = []
let primosVacio_ = [String]()

// Añadir elementos
primos = primos + ["7"]

primos.append("9")

primos.remove(at:0)

print (primos)

for numero in primos.reversed() {
    print(numero)
}

for (pos, numeroPrimo) in primos.enumerated() {
    print("Índice: \(pos)")
    print("primo\(numeroPrimo)")
}

var numeros: [Int] = [];


for i in 1...5 {
    numeros.append(i)
}




let data = "                        [{\"_id\":\"5cae00b606509e050a3f7525\",\"maker\":\"\",\"price\":2000,\"platter\":\"\",\"model\":\"\",\"year\":\"1000LLL\"},{\"_id\":\"5cae05bd06509e050a3f7526\",\"platter\":\"\",\"maker\":\"\",\"year\":\"1000LLL\",\"model\":\"\",\"price\":2000}]".data(using: .utf8)!

print(data)
struct Form: Codable {
    let id: String
    let maker: String?
    let model: String?
    let platter: String?
    let year: String?
    let price: Double?

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case maker = "maker"
        case model = "model"
        case platter = "platter"
        case year = "year"
        case price = "price"

    }
}

do {
    let f = try JSONDecoder().decode([Form].self, from: data)
    print(f)
   // print(f[0])
} catch {
    print(error)
}








