//
//  DataTableViewCell.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/5/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    
    @IBOutlet weak var covData: UICollectionView!
    
    var categoria:HeaderModel? = nil{
        willSet{
            covData.dataSource = self
            covData.delegate = self
            covData.register(UINib(nibName: "UsersCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UsersCategoryCollectionViewCell")
            covData.reloadData()
        }
    }
    
}

extension DataTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (categoria?.lista_encuesta.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCategoryCollectionViewCell", for: indexPath) as! UsersCategoryCollectionViewCell
        let encuesta = categoria?.lista_encuesta[indexPath.row]
        
        celda.layer.borderWidth = 1
        celda.layer.borderColor = UIColor.black.cgColor
        
        celda.lblDate.text = encuesta?.fecha_nacimiento
        celda.lblName.text = "\(encuesta!.nombre) \(encuesta!.apellido)"
        celda.lblEmail.text = encuesta?.correo
        celda.lblDni.text = "DNI: \(encuesta!.dni)"
        celda.lblWhy.text = encuesta?.porque
        
        return celda
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 250, height: 120)
    
        }
}
