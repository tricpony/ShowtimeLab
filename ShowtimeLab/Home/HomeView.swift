//
//  HomeView.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            ProgressView("Loading...")
            VStack {
                if !viewModel.imageUrl.isEmpty {
                    WebUI(urlString: viewModel.imageUrl)
                        .padding(.top)
                }
                Text(viewModel.title)
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
