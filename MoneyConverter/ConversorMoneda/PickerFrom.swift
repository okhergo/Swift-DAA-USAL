//
//  PickerPersonalizado.swift
//  ConversorMoneda
//
//  Created by Óscar Khergo on 27/10/23.
//

import Foundation
import SwiftUI

struct PickerFrom: View {
    @ObservedObject var viewModel = MonedaViewModel.shared
    
    var body: some View {
        GeometryReader { geo in
            HStack (alignment: .center){
                Picker("", selection: $viewModel.tipoOriginal){
                    ForEach(viewModel.tipos, id:\.self){ tipo in
                        Text(tipo)
                    }
                }.pickerStyle(MenuPickerStyle()).frame(width: geo.size.width * 0.25)
                Divider()
                TextField("Introduce la cantidad", text: $viewModel.cantidad)
                    .keyboardType(.decimalPad)
                    .padding()
            }.frame(height: geo.size.height)
        }
    }
}
