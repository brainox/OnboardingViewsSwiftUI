//
//  ImagePickerView.swift
//  StoreFront
//
//  Created by Decagon on 09/10/2021.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: image ?? UIImage(systemName: "photo")!)
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Button("Choose a Picture") {
                    self.showSheet.toggle()
                }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("TAP TO CHOOSE"), buttons: [
                        .default(Text("Choose from Gallery")) {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Take Photo with Camera")) {
                            self.showImagePicker = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ])
                }
            }
            .navigationBarTitle("Camera Demo")
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
