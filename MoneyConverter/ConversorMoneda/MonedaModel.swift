//
//  MonedaModel.swift
//  ConversorMoneda
//
//  Created by alumno on 20/10/23.
//

import Foundation

struct MonedaModel: Codable {
    let id: String
    let description: String
    let cantidad: Double
    let cantidadConvertida: Double
    
    init(id:String = UUID().uuidString, description: String, cantidad: Double, cantidadConvertida: Double){
        self.id = id
        self.description = description
        self.cantidad = cantidad
        self.cantidadConvertida = cantidadConvertida
    }
}
