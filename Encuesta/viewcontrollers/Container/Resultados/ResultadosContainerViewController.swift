//
//  ResultadosViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/4/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

class ResultadosContainerViewController: ResultadosViewController,UITableViewDataSource,UITableViewDelegate{

    fileprivate var gaoCategorias = [Categoria]()
    private var gaoHeaderList: [HeaderModel] = []
    
    @IBOutlet weak var tbMain: UITableView!
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            gaoCategorias = RealizarEncuestaViewController.gaoCategorias
            gaoHeaderList = EncuestaSQLUseCase().listarEncuestas()
            tbMain.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbMain.sectionFooterHeight = 0

        tbMain.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
        tbMain.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
        
        self.tbMain.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        self.tbMain.sectionHeaderHeight = UITableView.automaticDimension
        self.tbMain.estimatedSectionHeaderHeight = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if gaoHeaderList[section].estado_botón {
            if gaoHeaderList[section].estado_celda {
                return 1
            }else {
                return 2
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tbMain.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
            cell.showHideDelegate = self
            cell.indice = indexPath
            cell.btnShowAndHide.setTitle(gaoHeaderList[indexPath.section].estado_celda ? "Mostrar detalle" : "Ocultar detalle", for: .normal)
            return cell
        }else {
            let cell = tbMain.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
            cell.categoria = gaoHeaderList[indexPath.section]
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gaoCategorias.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerView = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
    
        let numeroEncuestas = gaoHeaderList[section].lista_encuesta.count
        
        headerView.lblNameCategory.text = gaoCategorias[section].name
        headerView.imgCategory.sd_setImage(with: URL(string: gaoCategorias[section].image ?? ""))
        headerView.lblTotalEncuestas.text = numeroEncuestas != 0 ? numeroEncuestas != 1 ? "\(numeroEncuestas) encuestas asociadas" : "\(numeroEncuestas) encuesta asociada" : "Ninguna encuesta asociada"
        headerView.backgroundColor = UIColor.white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 30
        }else {
            return 150
        }
        
    }
    
    
}

extension ResultadosContainerViewController: showAndHideDelegate {
    func showHide(index: IndexPath) {
        let isExpanded = gaoHeaderList[index.section].estado_celda
        gaoHeaderList[index.section].estado_celda = !isExpanded
        
        if !isExpanded {
            tbMain.deleteRows(at: [index], with: .none)
        } else {
            tbMain.insertRows(at: [index], with: .none)
        }
        
        tbMain.reloadData()
    }
}
