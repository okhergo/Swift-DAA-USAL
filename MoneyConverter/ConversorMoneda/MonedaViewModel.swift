//
//  MonedaViewModel.swift
//  ConversorMoneda
//
//  Created by alumno on 20/10/23.
//

import Foundation
import SwiftUI

struct ExchangeRate: Codable{
    let conversion_rates: [String:Double]
    let base_code: String
    let time_last_update_utc: String
}

class MonedaViewModel: ObservableObject {
    @Published var cantidad: String = ""
    @Published var tipoOriginal: String = "EUR"
    @Published var tipoConversion: String = "USD"
    @Published var rate: Double = 0.9
    @Published var resultado: String = ""
    @Published var resultado2: String = ""
    @Published var resultado3: String = ""
    
    @Published var tipos = ["USD", "EUR", "JPY", "GBP"]
    
    static let shared = MonedaViewModel()
    
    let apiKey = "b939a10a0c80bf20db950ee5"
    
    func fetchRate(){
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/\(tipoOriginal)") else {return}
        
        URLSession.shared.dataTask(with: url){ data,response, error in
            if let data = data{
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(ExchangeRate.self, from:data)
                    DispatchQueue.main.async{
                        self.rate = response.conversion_rates[self.tipoConversion] ?? 0.0
                        self.convert()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    func convert(){
        guard let cantidad = Double(cantidad) else {
            resultado = "Cantidad inválida"
            resultado2 = ""
            resultado3 = ""
            return
        }
        
        let cantidadConvertida = String(format: "%.2f", cantidad * rate)
        let formattedCantidad = String(format: "%.2f", cantidad)
        
        resultado = "\(cantidadConvertida)"
        resultado2 = "\(tipoOriginal) \(formattedCantidad) son"
        resultado3 = "\(tipoConversion) \(cantidadConvertida)"
    }
}
