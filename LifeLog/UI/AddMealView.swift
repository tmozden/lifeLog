//
//  AddMealView.swift
//  LifeLog
//
//  Created by Travis Mozden on 7/6/21.
//

import SwiftUI
import Combine

struct AddMealView: View {
    @StateObject private var mealBuilder = MealBuilder()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            //Top Set
            Group {
                Text("Meal Log")
                    .font(.title2)
                    .bold()
                Picker("origin", selection: $mealBuilder.origin, content: {
                    ForEach(MealOrigin.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Picker("size", selection: $mealBuilder.size, content: {
                    ForEach(MealSize.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Items
            VStack(spacing: .some(3)) {
                Text("Vegetables")
                    .font(.title3)
                Picker("vegetables", selection: $mealBuilder.vegetables, content: {
                    ForEach(VegetableQuality.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(spacing: .some(3)) {
                Text("Fruit")
                    .font(.title3)
                Picker("fruit", selection: $mealBuilder.fruit, content: {
                    ForEach(FruitQuality.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(spacing: .some(3)) {
                Text("Grain")
                    .font(.title3)
                HStack(spacing: .some(4)) {
                Picker("grain", selection: $mealBuilder.grain, content: {
                    ForEach(GrainQuality.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                    Button("↑25%", action: {
                        mealBuilder.tooMuchGrain = mealBuilder.tooMuchGrain ? false : true
                    })
                    .padding(.trailing, .some(4))
                    .foregroundColor(mealBuilder.tooMuchGrain ? .green : .red)
                }
            }
            
            VStack(spacing: .some(3)) {
                Text("Protien")
                    .font(.title3)
                HStack(spacing: .some(4)) {
                Picker("protien", selection: $mealBuilder.protien, content: {
                    ForEach(ProtienQuality.allCases) {
                        Text($0.displayText).tag($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                    Button("↑25%", action: {
                        mealBuilder.tooMuchProtien = mealBuilder.tooMuchProtien ? false : true
                    })
                    .padding(.trailing, .some(4))
                    .foregroundColor(mealBuilder.tooMuchProtien ? .green : .red)
                }
            }
            
            // Yes No's
            HStack {
                Text("Healty Oils?")
                    .padding(.trailing)
                Picker("Healthy Oils", selection: $mealBuilder.healthyOil, content: {
                    Text("No").tag(false)
                    Text("Yes").tag(true)
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width:150)
                Spacer()
            }.padding(.top)
            .padding(.horizontal)
            
            HStack {
                Text("Sugar Item?")
                    .padding(.trailing)
                Picker("sugar item", selection: $mealBuilder.sugarItem, content: {
                    Text("No").tag(false)
                    Text("Yes").tag(true)
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width:150)
                Spacer()
            }.padding(.horizontal)
            
            //Time Picker
            DatePicker(
                "Meal Time",
                selection: $mealBuilder.timestamp,
                displayedComponents: [.date, .hourAndMinute]
            ).padding()
            
            // Save Button
            Button(action: {
                LogManager.shared.save(meal: mealBuilder.build())
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
                    .font(.title3)
                    .bold()
            })
            .padding(.top, .some(50))
            
            
            Spacer()
        }
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
