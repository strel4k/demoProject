//
//  ContentView.swift
//  demoproj
//
//  Created by Alexander on 11.08.2023.
//

import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let username: String
    let image: String
}

struct ContentView: View {
    let stories: [Story] = [
        Story(username: "Привилегии «Мой SPAR»", image: ""),
        Story(username: "Мы в соцсетях", image: ""),
        Story(username: "3 рецепта коктейлей", image: ""),
        Story(username: "Дегустации в SPAR", image: ""),
        Story(username: "Новинки недели", image: ""),
    ]
    
    @State private var search = ""
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            TextField("📍Краснодар, Краснодарский край", text: $search)
                                .padding(.horizontal)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding()
                            
                            Button(action: {
                                // Действие при нажатии
                            }) {
                                Image(systemName: "circle.grid.3x3")
                                    .font(.title2)
                                    .foregroundColor(.green)
                            }
                            .padding(.trailing)
                        }
                        //ScrollView сторизов
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(stories) { story in
                                    StoryView(story: story)
                                }
                            }
                            .padding()
                        }
                        
                        // Scroll View с акциями
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...5, id: \.self) { index in
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 340, height: 180)
                                        .cornerRadius(20)
                                    
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        
                        // Бонусная карта
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: .infinity, height: 150)
                            .cornerRadius(20)
                            .padding(.bottom, 10)
                        
                        //Scroll view с быстрым меню
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...5, id: \.self) { index in
                                    Rectangle()
                                        .fill(Color.blue)
                                        .frame(width: 106, height: 140)
                                        .cornerRadius(20)
                                        .shadow(color: .gray, radius: 3)
                                    
                                }
                            }
                        }
                        
                        // Рекомендуемый товар
                        Text("Рекомендуем")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...5, id: \.self) { index in
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(width: 150, height: 170)
                                        .cornerRadius(20)
                                        .shadow(color: .gray, radius: 3)
                                    
                                }
                            }
                        }
                        
                        // Сладкий товар
                        
                        Text("Сладкое настроение")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Товар
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1...5, id: \.self) { index in
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.orange)
                                            .frame(width: 150, height: 170)
                                            .cornerRadius(20)
                                            .shadow(color: .gray, radius: 3)
                                        Text("99 р/шт")
                                            .font(.headline)
                                            .padding(.vertical, 4)
                                        HStack {
                                           Spacer()
                                            Image(systemName: "basket.fill")
                                                .font(.title)
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal, 5) // nav bar
                }
            }
            // Tabbar
            .tabItem {
                Image(systemName: "arrow.up.circle")
                Text("Главная")
            }
            
            Text("Каталог")
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Каталог")
                }
            
            Text("Корзина")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Корзина")
                }
            
            Text("Профиль")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Профиль")
                }
        }
        .accentColor(.green)
    }
}

struct StoryView: View {
    let story: Story
    
    var body: some View {
        VStack {
            Image(story.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.green, lineWidth: 2)
                )
            Text(story.username)
                .font(.caption)
                .lineLimit(2)
                .frame(width: 75)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

