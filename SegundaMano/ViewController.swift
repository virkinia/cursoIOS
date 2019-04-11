//
//  ViewController.swift
//  SegundaMano
//
//  Created by Dev2 on 08/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    
    @IBOutlet weak var makerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataFromServer: [Car] = []


    @IBOutlet weak var maker: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var platter: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var price: UITextField!


    // Labels de la tabla



    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTabla()
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataFromServer.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myCell")
         //cell.textLabel?.text  = self.dataFromServer[indexPath.row].model
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! HeadlineTableViewCell



        cell.modelLabel.text = self.dataFromServer[indexPath.row].model
        cell.makerLabel.text = self.dataFromServer[indexPath.row].maker
        cell.priceLabel.text = String (self.dataFromServer[indexPath.row].price)


        return cell
    }

    @IBOutlet weak var tableView: UITableView!

    



    @IBAction func btnSave(_ sender: Any) {

        guard let model = model.text,
              let year = year.text,
              let maker = maker.text,
              !year.isEmpty,
              !model.isEmpty
              else {
                let alert = UIAlertController(title: "Formulario Incompleto", message: "Debe rellanar los campos obligatorios", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
             return
        }

        let datosFormulario: Coche = Coche(5, maker, model, year, 30)


            hacerPost(car: datosFormulario)



    }

    func hacerPost (car: Coche) {
        

        // create post request
        let url = URL(string: "http://localhost:3000/vehiculos")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")

        // insert json data to the request
        request.httpBody = car.toJson()

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }

        task.resume()

    

    }

    @IBAction func reloadAction(_ sender: Any) {
        reloadTabla()
    }

    func reloadTabla() {


        let url = URL(string: "http://localhost:3000/vehiculos")!
        var requestGet = URLRequest(url: url)
        requestGet.httpMethod = "GET"


        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            //var arrayCoches: [Coche] = []


            do {
                self.dataFromServer  = try JSONDecoder().decode([Car].self, from: data)

                print(self.dataFromServer)


                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }

            } catch {
                print(error)
            }
        }

        task.resume()




    }



}

