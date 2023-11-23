//
//  SliceView.swift
//  AFP_Group2
//
//  Created by Jamie Chao on 21/11/2023.
//

import SwiftUI

import Lottie

struct SliceView: View {
    var body: some View {
        LottieView(name: "slice", loopMode: .loop)
            .frame(width: 400, height: 400, alignment: .center)
    }
}

struct SliceView_Previews: PreviewProvider {
    static var previews: some View {
        SliceView()
    }
}
