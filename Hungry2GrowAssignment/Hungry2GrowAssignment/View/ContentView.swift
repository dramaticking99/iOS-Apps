//
//  ContentView.swift
//  Hungry2GrowAssignment
//
//  Created by Chetan Sanwariya on 12/04/24.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = PostViewModal()
    @State private var selectedPostId: PostModal.ID?
    
    var body: some View {
        NavigationStack {
            List(selection: $selectedPostId){
                
                Section(header: PostHeaderView(numberOfPosts: viewModel.postArray.count)) {
                    ForEach(viewModel.postArray) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            PostRowView(post: post)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPostData()
        }
    }
        
}


//MARK: - Header View
struct PostHeaderView : View {
    
    @State private var isSearchBarVisible : Bool = false
    @State private var headerBottomPadding : CGFloat = 24
    
    var numberOfPosts : Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Posts")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .font(.system(size: 28))
                    .textCase(.none)
                    .padding(.top,24)
                Text("(\(numberOfPosts))")
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                    .padding(.top,24)
                HStack {
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    isSearchBarVisible.toggle()
                    headerBottomPadding = isSearchBarVisible ? -8 : 24
                } , label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.tint)
                        .font(.system(size: 20))
                        .padding(.top,24)
                })
            }
            .padding(.bottom,headerBottomPadding)
            VStack {
                if isSearchBarVisible {
                    SearchBar(text: .constant(""), headerBottomPadding: $headerBottomPadding)
                        .padding()
                }
            }
        }
    }
}

//MARK: - Search Bar View

struct SearchBar: View {
    @Binding var text: String
    @Binding var headerBottomPadding : CGFloat
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal)
                .frame(height: 40)
            
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(.trailing)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}



//MARK: - Post Row View

struct PostRowView : View {
    
    var post : PostModal
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            
            HStack {
                Image(systemName: "person.circle.fill")
                    .foregroundStyle(.tint.opacity(0.5))
                    .font(.system(size: 20))
                Text("\(post.userId)")
                    .font(.system(size: 14))
            }
            
            Text(post.title)
                .bold()
                .font(.system(size: 18))
            Text(post.body)
                .font(.system(size: 14))
                .lineLimit(2)
                .foregroundStyle(Color(.gray))
        }
        .padding(.vertical, 12)
    }
}

//MARK: - Post Detail View

struct PostDetailView : View {

    @State private var isLiked : Bool = false
    @State var imageName = "heart"
    
    
    var post : PostModal
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30){
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.tint)
                        Text("\(post.userId)")
                            .font(.system(size: 18))
                        HStack {
                        }
                        .frame(maxWidth: .greatestFiniteMagnitude)
                        Text("post_Id: \(post.id)")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                    }
                    Text(post.title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Text(post.body)
                        .font(.system(size: 16))
        
                }
                .padding()
            }
            .toolbar(content: {
                Button(action: {
                    isLiked.toggle()
                    imageName = isLiked ? "heart.fill" : "heart"
                }, label: {
                    Image(systemName:imageName)
                        .foregroundStyle(.red)
                })
            })
            
            .background(Color(white: 0.95))
            .scrollIndicators(.hidden)
            
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    
                    HStack(spacing:1){
                        Text("Add comment...")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.black)
                                .padding(.trailing)
                                .font(.system(size: 50))
                        })
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}

