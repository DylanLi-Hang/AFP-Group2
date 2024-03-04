//
//  VideoSwipingViewTest.swift
//  AFP_Group2
//
//  Created by Dylan on 2/3/2024.
//

import SwiftUI
import AVKit
import SwiftData

struct IdentifiableView: Identifiable {
    let id: Int
    let view: AnyView

    init(id: Int, view: AnyView) {
        self.id = id
        self.view = view
    }
}


struct SwipingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isLinkActive = false
    @State private var scrollID: IdentifiableView.ID?
    @State private var isPlaying = false
    
    var misconception: MisconceptionModel
    private var views: [IdentifiableView] = []

    init(misconception: MisconceptionModel) {
        self.misconception = misconception
        setupNavigationBarAppearance()
        views.append(IdentifiableView(id: 1, view: AnyView(quoteView)))
        views.append(IdentifiableView(id: 2, view: AnyView(videoView)))
        views.append(IdentifiableView(id: 3, view: AnyView(jarView)))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            contentStack
        }
        .scrollPosition(id: $scrollID)
        .onChange(of: scrollID) { oldValue, newValue in
            print(newValue ?? "")
            if (newValue == 2) {
                isPlaying = true
            } else {
                isPlaying = false
            }
        }
        .scrollTargetBehavior(.paging)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: misconceptionsLink)
        .ignoresSafeArea()
    }

    private var contentStack: some View {
        LazyVStack(spacing: 0) {
            ForEach(views) { identifiableView in
                identifiableView.view
            }
        }
        .scrollTargetLayout()
    }


    private var quoteView: some View {
        ZStack {
            semiTransparentRectangle
            QuoteViewScroll(misconception: misconception)
        }
    }

    private var videoView: some View {
        ZStack {
            semiTransparentRectangle
            VideoView(misconception: misconception, isPlaying: $isPlaying)
        }
    }

    private var jarView: some View {
        ZStack {
            semiTransparentRectangle.background(.yellowish)
            JarView()
        }
    }

    private var semiTransparentRectangle: some View {
        Rectangle()
            .fill(Color.clear.opacity(0.6))
            .containerRelativeFrame([.horizontal, .vertical])
    }

    private var backButton: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width: 11.0, height: 18.0)
                .foregroundColor(.white)
        }
    }

    private var misconceptionsLink: some View {
        NavigationLink(destination: ContentView(), isActive: $isLinkActive) {
            Text(misconception.misconception)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 200)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.trailing)
                .onTapGesture { isLinkActive = true}
        }
    }

    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = false
    }
}


#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext

    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
        context.insert(model)
        try! context.save()

        return SwipingView(misconception: misconceptions[1])
            .modelContainer(container)
}

