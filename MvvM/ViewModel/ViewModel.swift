//
//  ViewModel.swift
//  MvvM
//
//  Created by Eman Khaled on 30/08/2023.
//

class ViewModel{
    var bindResultToVC : (()->()) = {}
    //el var dah lma ye7sal feh change 3ayez agee fe el didset anafez 7aga mo3yana
    //dah var 3mltloh observer el observer bta3oh 7ay3mel action mo3yan enoh y3mel binding
    
    var VMResult : [Item]!{
        didSet{
            bindResultToVC() // cal closure
            
        }
    }
    
    func getItems(){
        //VM-> M
        NetworkService.fetchResult{res in
            // en el model M yeb3at el func l VM
            guard let result = res else {return}
            self.VMResult = result.items
            
        }
    }
    
}
