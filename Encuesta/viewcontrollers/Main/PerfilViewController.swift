//
//  PerfilViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/1/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit
import CoreData
var perfil = PerfilViewController()

class PerfilViewController: BaseViewController {
    
    @IBOutlet weak var cvLoguearse: UIView!
    @IBOutlet weak var cvLogueado: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserSQLUseCase().existSession() {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-power_settings_new-24px")
            self.navigationController?.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "baseline-power_settings_new-24px")
            self.cvLoguearse != nil ? self.cvLoguearse?.isHidden = true : nil
            self.cvLogueado != nil ? self.cvLogueado?.isHidden = false : nil
        }else {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-input-24px")
            self.navigationController?.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "baseline-input-24px")
            self.cvLoguearse != nil ? self.cvLoguearse?.isHidden = false : nil
            self.cvLogueado != nil ? self.cvLogueado?.isHidden = true : nil
        }
    }
    
    func hideCvLoguearse(){
        cvLoguearse.isHidden = true
        cvLogueado.isHidden = false
    }
    
    func hideCvLogueado(){
        cvLoguearse.isHidden = false
        cvLogueado.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perfil = self
    }
}
