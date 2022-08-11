//
//  HomeView.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var presentSheet: Bool = false

    var body: some View {
        ZStack {
            ProgressView("Loading...")
            GeometryReader { geo in
                VStack {
                    if !viewModel.imageUrl.isEmpty {
                        WebUI(urlString: viewModel.imageUrl)
                            .onTapGesture {
                                presentSheet = true
                            }
                            .padding(.top)
                            .frame(height: geo.size.height * 0.7)
                    }
                    Divider()
                    Text(viewModel.title)
                        .padding(.top)
                }
            }
        }
        .sheet(isPresented: $presentSheet) {
            Text(viewModel.alternateMessage)
                .padding([.leading, .trailing], 12)
                .onTapGesture {
                    presentSheet = false
                }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
#endif
