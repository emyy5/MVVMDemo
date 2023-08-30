//
//  ViewController.swift
//  MvvM
//
//  Created by Eman Khaled on 30/08/2023.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel!
    @IBOutlet weak var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //V-> VM
        viewModel = ViewModel()
        viewModel.getItems()
        viewModel.bindResultToVC = {()in
   
            DispatchQueue.main.async {
                self.mylabel.text = self.viewModel.VMResult[0].title
        }
      
    }
//    func renderView(){
//
//        }
        
    }


}


