//
//  ContentView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    @State var cardViews: [CardView] = {
      var views = [CardView]()
      for index in 0..<2 {
        views.append(CardView(honeymoon: honeymoonData[index]))
      }
      return views
    }()
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .offset(
                            x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                            y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0
                        )
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(
                            Angle(
                                degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0
                            )
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, _) in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                            
                        )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Whishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon !"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
