import SwiftUI

struct ContentView: View {
    let rows = Array(repeating: GridItem(.adaptive(minimum: 25)), count: 12)
    let lastVisibleDate = Date().advanced(by: TimeInterval(-60 * 60 * 24 * 84))
    @State var iconOrText = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.secondary.opacity(0.2))
                    HStack {
                        Label(
                            title: { Text(Date().formatted(date: .long, time: .omitted)) },
                            icon: { Image(systemName: "calendar") }
                        )
                        .foregroundStyle(Color.accentColor)
                        Spacer()
                    }
                    .padding(.leading)
                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Label(
                        title: { Text("About") },
                        icon: { Image(systemName: "person") }
                    )
                })
                .buttonStyle(.borderedProminent)
                .labelStyle(.iconOnly)
                Button(action: {
                    iconOrText.toggle()
                }, label: {
                    Label(
                        title: { Text("Settings") },
                        icon: { Image(systemName: "gear") }
                    )
                })
                .buttonStyle(.borderedProminent)
                .labelStyle(.iconOnly)
            }
            .frame(height: 30)
            .font(.headline.monospaced())
            LazyVGrid(columns: rows, alignment: .center) {
                ForEach(0..<84, id: \.self) { i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.secondary.opacity(0.2))
                        Text(lastVisibleDate.advanced(by: TimeInterval((i + 1) * 60 * 60 * 24)).formatted(date: .numeric, time: .omitted))
                            .font(.caption2)
                    }
                }
            }
            .padding(.vertical)
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 30)
                        .foregroundStyle(LinearGradient(colors: [.secondary.opacity(0.2), .blue], startPoint: .leading, endPoint: .trailing))
                    HStack {
                        Text("Inactive")
                        Spacer()
                        Text("Active")
                    }
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                }
                Button(action: {
                    
                }, label: {
                    Label(
                        title: { Text("Add Activity") },
                        icon: { Image(systemName: "plus") }
                    )
                })
                .buttonStyle(.borderedProminent)
            }
            .font(.headline.monospaced())
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray.opacity(0.1))
        }
        .frame(width: 625)
    }
}
