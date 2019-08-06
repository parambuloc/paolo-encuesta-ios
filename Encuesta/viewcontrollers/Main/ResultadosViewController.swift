//
//  ResultadosViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/1/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit
import CoreData

var resultados = ResultadosViewController()

class ResultadosViewController: BaseViewController {
    
    @IBOutlet weak var cvResultados: UIView!
    @IBOutlet weak var cvLoguearse: UIView!
    
    public var countCategories: Int = 0
    
    var datos:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultados = self
    }

    override func viewWillAppear(_ animated: Bool) {
        if UserSQLUseCase().existSession() {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-power_settings_new-24px")
            self.cvLoguearse != nil ? self.cvLoguearse?.isHidden = true : nil
            self.cvResultados != nil ? self.cvResultados?.isHidden = false : nil
        }else {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-input-24px")
            self.cvLoguearse != nil ? self.cvLoguearse?.isHidden = false : nil
            self.cvResultados != nil ? self.cvResultados?.isHidden = true : nil
        }
    }
    
    func hideCvLoguearse(){
        cvLoguearse.isHidden = true
        cvResultados.isHidden = false
    }
    
    func hideCvResultados(){
        cvLoguearse.isHidden = false
        cvResultados.isHidden = true
    }
    
}
