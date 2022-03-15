//
//  ContentView.swift
//  Userlist
//
//  Created by Gergo Nagy on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var users = [String]()
    
    var body: some View {
        
        VStack {
            
            VStack{
                
                Text("User List")
                    .font(.system(size: 30))
                    .bold()
                
                VStack {
                    
                    TextField("First Name", text: $firstName )
                        .padding(12)
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("Last Name", text: $lastName )
                        .padding(12)
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .padding()
                
                HStack {
                    
                    Button(action: {
                        self.users.append("\(self.firstName) \(self.lastName)")
                        self.firstName = ""
                        self.lastName = ""
                    }) {
                        Text("Add user")
                    }
                    .disabled((firstName.count + lastName.count > 0) ? false : true)
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background((firstName.count + lastName.count > 0) ? Color.blue : Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                List {
                    
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }.onDelete { (indexSet) in
                        self.users.remove(atOffsets: indexSet)
                    }
                    
                }
                
            }
            .background(Color(.systemMint))
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
