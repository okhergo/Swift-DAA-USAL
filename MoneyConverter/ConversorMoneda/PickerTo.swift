//
//  PickerPersonalizado.swift
//  ConversorMoneda
//
//  Created by Óscar Khergo on 27/10/23.
//

import Foundation
import SwiftUI

struct PickerTo: View {
    @ObservedObject var viewModel = MonedaViewModel.shared
    
    var body: some View {
        GeometryReader { geo in
            HStack (alignment: .center){
                Picker("", selection: $viewModel.tipoConversion){
                    ForEach(viewModel.tipos, id:\.self){ tipo in
                        Text(tipo)
                    }
                }.pickerStyle(MenuPickerStyle()).frame(width: geo.size.width * 0.25)
                Divider()
                Text(viewModel.resultado).padding()
            }.frame(height: geo.size.height)
        }
    }
}
