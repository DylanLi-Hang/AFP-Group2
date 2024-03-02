import SwiftUI

// Enum to represent the type of each item in the stack
enum ViewType {
    case header, content, footer
}

// Model representing each item, including a unique identifier and a type
struct StackItem: Identifiable, Hashable {
    let id = UUID()
    let type: ViewType
    let content: String // Simple content representation
}

struct ComplexScrollView: View {
    // Array of items to display in the stack
    var items: [StackItem] = [
        .init(type: .header, content: "Header 1"),
        .init(type: .content, content: "Content 1"),
        .init(type: .footer, content: "Footer 1"),
        .init(type: .header, content: "Header 2"),
        .init(type: .content, content: "Content 2"),
        .init(type: .footer, content: "Footer 2")
        // Add more items as needed
    ]
    
    // Binding to control the scrolled position
    @State private var scrolledID: UUID?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items) { item in
                    switch item.type {
                    case .header:
                        HeaderView(content: item.content)
                    case .content:
                        TheContentView(content: item.content)
                    case .footer:
                        FooterView(content: item.content)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrolledID) // Use the scrollPosition modifier
        .onChange(of: scrolledID) { oldValue, newValue in
            print(newValue ?? "")
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("To Header") {
                    if let headerID = items.first(where: { $0.type == .header })?.id {
                        scrolledID = headerID
                    }
                }
                
                Button("To Content") {
                    if let contentID = items.first(where: { $0.type == .content })?.id {
                        scrolledID = contentID
                    }
                }
                
                Button("To Footer") {
                    if let footerID = items.first(where: { $0.type == .footer })?.id {
                        scrolledID = footerID
                    }
                }
            }
        }
    }
}

// Simple view for headers
struct HeaderView: View {
    let content: String
    var body: some View {
        Text(content)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
    }
}

// Simple view for content sections
struct TheContentView: View {
    let content: String
    var body: some View {
        Text(content)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
    }
}

// Simple view for footers
struct FooterView: View {
    let content: String
    var body: some View {
        Text(content)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundColor(.white)
    }
}

// Preview for SwiftUI Canvas
struct ComplexScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ComplexScrollView()
    }
}


#Preview {
    ComplexScrollView()
}
