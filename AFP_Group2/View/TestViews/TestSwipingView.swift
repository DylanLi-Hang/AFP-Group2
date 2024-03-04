//
//  TestSwipingView.swift
//  AFP_Group2
//
//  Created by Dylan on 4/3/2024.
//

import SwiftUI

import SwiftUI
import AVKit
import SwiftData

// Define the protocol for content views
protocol ContentViewProtocol2 {
    var id: Int { get }
    func view(isPlaying: Binding<Bool>, misconception: MisconceptionModel) -> AnyView
}

// Implement the protocol for each content type
struct QuoteContent: ContentViewProtocol2 {
    var id: Int
    
    func view(isPlaying: Binding<Bool>, misconception: MisconceptionModel) -> AnyView {
        AnyView(
            ZStack {
                semiTransparentRectangle
                QuoteViewScroll(misconception: misconception)
            }
        )
    }
}

struct VideoContent: ContentViewProtocol2 {
    var id: Int
    
    func view(isPlaying: Binding<Bool>, misconception: MisconceptionModel) -> AnyView {
        AnyView(
            ZStack {
                semiTransparentRectangle
                VideoView(misconception: misconception, isPlaying: isPlaying)
            }
        )
    }
}

struct JarContent: ContentViewProtocol2 {
    var id: Int
    
    func view(isPlaying: Binding<Bool>, misconception: MisconceptionModel) -> AnyView {
        AnyView(
            ZStack {
                semiTransparentRectangle.background(.yellowish)
                JarView()
            }
        )
    }
}

// Update SwipingView to use protocol conforming instances
struct TestSwipingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isLinkActive = false
    @State private var scrollID: Int?
    @State private var isPlaying = false
    
    private let contentViews: [ContentViewProtocol2] = [
        QuoteContent(id: 1),
        VideoContent(id: 2),
        JarContent(id: 3)
    ]
    
    var misconception: MisconceptionModel

    init(misconception: MisconceptionModel) {
        self.misconception = misconception
        setupNavigationBarAppearance()
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(contentViews, id: \.id) { contentView in
                    contentView.view(isPlaying: $isPlaying, misconception: misconception)
                        .id(contentView.id)
                }
            }
            .scrollTargetLayout()
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

// Define the semiTransparentRectangle as a global function or view since it's used in multiple places
private var semiTransparentRectangle: some View {
    Rectangle()
        .fill(Color.clear.opacity(0.6))
        .containerRelativeFrame([.horizontal, .vertical])
}


#Preview {
    let container = try! ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext

    let model = MisconceptionModel(misconception: "", quoteOrFact: "", highlight: "", citation: "", career: "", videoFileName: "", bubbleColor: "", backgroundColor: "", highlightColor: "", backgroundTextColor: "", highlightTextColor: "", videoURL: "", state: true)
        context.insert(model)
        try! context.save()

        return TestSwipingView(misconception: misconceptions[1])
            .modelContainer(container)
}
