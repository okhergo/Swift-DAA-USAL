//
//  ContentView.swift
//  ConversorMoneda
//
//  Created by alumno on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MonedaViewModel.shared
    
    var body: some View {
        VStack(){
            Image(systemName: "arrow.up.right.and.arrow.down.left.rectangle.fill")
                .imageScale(.large).padding()
            Text("Conversor de Moneda").font(.title)
            Form (){
                Section(header: Text("CANTIDAD A CONVERTIR")){
                    PickerFrom()
                }
                Section(header: Text("CANTIDAD CONVERTIDA")){
                    PickerTo()
                }
            }
            Text(viewModel.resultado2)
                .font(.title3)
                .foregroundStyle(.gray)
            Text(viewModel.resultado3)
                .font(.largeTitle)
            Spacer(minLength: 40)
            Button("Convertir"){
                viewModel.fetchRate()
            }
            .buttonStyle(.bordered)
            .tint(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
