import SwiftUI

struct ContentView: View {
    let rows = Array(repeating: GridItem(.adaptive(minimum: 25)), count: 12)
    let lastVisibleDate = Date().advanced(by: TimeInterval(-60 * 60 * 24 * 84))
    @State var addActivity = false
    @State var addHabits = false
    @State var addSettings = false
    @State var addGitHub = false
    var body: some View {
        Grid {
            if addSettings {
                GridRow {
                    if addHabits {
                        VStack {
                            
                        }
                        .padding()
                        .frame(width: 300, height: 200)
                    }
                    VStack {
                        
                    }
                    .padding()
                    .frame(width: 540, height: 200)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                }
            }
            GridRow {
                if addHabits {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.secondary.opacity(0.2))
                            HStack {
                                Label(
                                    title: { Text("Habits") },
                                    icon: { Image(systemName: "checklist") }
                                )
                                .foregroundStyle(Color.accentColor)
                                .padding(.leading)
                                Spacer()
                            }
                        }
                        .font(.headline.monospaced())
                        .frame(height: 30)
                        Spacer()
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 30)
                                    .foregroundStyle(LinearGradient(colors: [.secondary.opacity(0.2), .blue], startPoint: .leading, endPoint: .trailing))
                                HStack {
                                    Text("0")
                                    Spacer()
                                    Text("10")
                                }
                                .padding(.horizontal)
                                .foregroundStyle(.white)
                            }
                            Spacer()
                            Button(action: {
                                addActivity = true
                            }, label: {
                                Label(
                                    title: { Text("Add Habit") },
                                    icon: { Image(systemName: "plus") }
                                )
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        .font(.headline.monospaced())
                    }
                    .padding()
                    .frame(width: 300, height: 450)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Button(action: {
                            addHabits.toggle()
                        }, label: {
                            Label(
                                title: { Text("Habits") },
                                icon: { Image(systemName: "checklist") }
                            )
                        })
                        .buttonStyle(.borderedProminent)
                        .labelStyle(.iconOnly)
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
                            addGitHub.toggle()
                        }, label: {
                            Label(
                                title: { Text("GutHib") },
                                icon: { Image(systemName: "text.and.command.macwindow") }
                            )
                        })
                        .buttonStyle(.borderedProminent)
                        Button(action: {
                            addSettings.toggle()
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
                    Spacer()
                    LazyVGrid(columns: rows, alignment: .center) {
                        ForEach(0..<84, id: \.self) { i in
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.secondary.opacity(0.2))
                                Text(lastVisibleDate.advanced(by: TimeInterval((i + 1) * 60 * 60 * 24)).formatted(date: .numeric, time: .omitted))
                                    .font(.system(size: 5, weight: .light, design: .monospaced))
                            }
                        }
                    }
                    Spacer()
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
                            addActivity.toggle()
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
                .frame(width: 540, height: 450)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.gray.opacity(0.1))
                }
                if addActivity {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.secondary.opacity(0.2))
                            HStack {
                                Label(
                                    title: { Text("Add Activity / Habit") },
                                    icon: { Image(systemName: "plus") }
                                )
                                .foregroundStyle(Color.accentColor)
                                .padding(.leading)
                                Spacer()
                            }
                        }
                        .font(.headline.monospaced())
                        .frame(height: 30)
                        Spacer()
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.secondary.opacity(0.2))
                                    .frame(height: 40)
                                TextField("Activity | Title", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                    .padding()
                            }
                        }
                        .padding(.vertical)
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Label(
                                    title: { Text("Add") },
                                    icon: { Image(systemName: "plus") }
                                )
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        .font(.headline.monospaced())
                    }
                    .padding()
                    .frame(width: 300, height: 450)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                }
            }
            if addGitHub {
                GridRow {
                    if addHabits {
                        VStack {
                            
                        }
                        .padding()
                        .frame(width: 300, height: 200)
                    }
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.secondary.opacity(0.2))
                            HStack {
                                Label(
                                    title: { Text("Add GutHib") },
                                    icon: { Image(systemName: "plus") }
                                )
                                .foregroundStyle(Color.accentColor)
                                .padding(.leading)
                                Spacer()
                            }
                        }
                        .font(.headline.monospaced())
                        .frame(height: 30)
                        Spacer()
                        VStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.secondary.opacity(0.2))
                                    .frame(height: 40)
                                HStack {
                                    Image(systemName: "link")
                                        .font(.headline)
                                        .foregroundStyle(.blue)
                                    TextField("Add your GutHib link", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                }
                                .padding()
                            }
                            HStack {
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundStyle(Color.accentColor)
                                Text("This is not working because i'm lazy. Sorry!")
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }
                        Spacer()
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Label(
                                    title: { Text("Visit Repository") },
                                    icon: { Image(systemName: "folder") }
                                )
                            })
                            .buttonStyle(.borderedProminent)
                            .font(.headline.monospaced())
                            Spacer()
                            .buttonStyle(.borderedProminent)
                            .font(.headline.monospaced())
                            Button(action: {
                                
                            }, label: {
                                Label(
                                    title: { Text("Add GutHib") },
                                    icon: { Image(systemName: "plus") }
                                )
                            })
                            .buttonStyle(.borderedProminent)
                            .font(.headline.monospaced())
                        }
                    }
                    .padding()
                    .frame(width: 540, height: 200)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                }
            }
        }
    }
}