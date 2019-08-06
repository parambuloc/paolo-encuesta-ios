//
//  RealizarEncuestaViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/1/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit
import DropDown
import CoreData
import SDWebImage

class RealizarEncuestaViewController: BaseViewController {
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtFechaNacimiento: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var btnCategoria: UIButton!
    @IBOutlet weak var txtPorque: UITextField!
    
    @IBOutlet weak var scvRealizarEncuesta: UIScrollView!
    
    public static var gaoCategorias: [Categoria] = []
    fileprivate var gasNombreCategoria: [String] = []
    fileprivate var gasFotoURL: [String] = []
    private var categoriaDropDown: Categoria? = nil
    
    let chooseCategory = DropDown()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserSQLUseCase().existSession() {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-power_settings_new-24px")
        }else {
            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-input-24px")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = scvRealizarEncuesta
        callServiceCategories()
        btnCategoria.layer.borderWidth = 1
        btnCategoria.layer.borderColor = UIColor(named: "borderButtonStyle")?.cgColor
        setupChooseCategoryDropDown()
        UITextField.connectFields(poTextFields: txtNombre, txtApellido, txtFechaNacimiento, txtCorreo, txtDni, txtPorque)
    }
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseCategory,
        ]
    }()
    
    func callServiceCategories(){
        let urlString = "http://dev.linkup.com.pe:8000/categories/"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {

                RealizarEncuestaViewController.gaoCategorias = try JSONDecoder().decode([Categoria].self, from: data)
                
                DispatchQueue.main.async {
                    for category in RealizarEncuestaViewController.gaoCategorias{
                        self.gasNombreCategoria += [category.name ?? ""]
                        self.gasFotoURL += [category.image ?? ""]
                    }
                }
                
                
            } catch let jsonError {
                print(jsonError)
            }

            }.resume()
    }
    
    @IBAction func chooseCategoryDropDown(_ sender: UIButton) {
        chooseCategory.dataSource = gasNombreCategoria
        chooseCategory.show()
    }
    
    @IBAction func registrarEncuesta(_ sender: Any) {
        if txtNombre.text?.trim() != nil && txtNombre.text?.trim() != ""{
            if txtApellido.text?.trim() != nil && txtApellido.text?.trim() != ""{
                if txtFechaNacimiento.text?.trim() != nil && txtFechaNacimiento.text?.trim() != ""{
                    if txtCorreo.text?.trim() != nil && txtCorreo.text?.trim() != ""{
                        if txtDni.text?.trim() != nil && txtDni.text?.trim() != ""{
                            if categoriaDropDown != nil {
                                if txtPorque.text?.trim() != nil && txtPorque.text?.trim() != ""{
                                    do {
                                        let delegado = UIApplication.shared.delegate as! AppDelegate
                                        let contexto = delegado.persistentContainer.viewContext
                                        let entidad = NSEntityDescription.insertNewObject(forEntityName: "Encuesta",into: contexto)
                                        entidad.setValue(txtNombre.text?.trim(),forKey: "nombre")
                                        entidad.setValue(txtApellido.text?.trim(),forKey: "apellido")
                                        entidad.setValue(txtFechaNacimiento.text?.trim(),forKey: "fecha_nacimiento")
                                        entidad.setValue(txtCorreo.text?.trim(),forKey: "correo")
                                        entidad.setValue(txtDni.text?.trim(),forKey: "dni")
                                        entidad.setValue(categoriaDropDown?.id,forKey: "categoria")
                                        entidad.setValue(txtPorque.text?.trim(),forKey: "porque")
                                        try contexto.save()
                                        Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Registro Exitoso!", self)
                                        limpiarTextFields()
                                    } catch {
                                        Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Error al registrar una encuesta", self)
                                    }
                                }else {
                                    Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese una razón o por qué", self)
                                }
                            }else {
                                Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Seleccione una categoría", self)
                            }
                        }else {
                            Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese su dni", self)
                        }
                    }else {
                        Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese un correo", self)
                    }
                }else {
                    Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese su fecha de nacimiento", self)
                }
            }else {
                Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese sus apellidos", self)
            }
        }else {
            Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Ingrese un nombre", self)
        }
        
    }
    
    func customizeDropDown() {
        let appearance = DropDown.appearance()
        
        appearance.cellHeight = 60
        appearance.backgroundColor = UIColor(white: 1, alpha: 1)
        appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
        //        appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
        appearance.cornerRadius = 10
        appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
        appearance.shadowOpacity = 0.9
        appearance.shadowRadius = 25
        appearance.animationduration = 0.25
        appearance.textColor = .darkGray
        //        appearance.textFont = UIFont(name: "Georgia", size: 14)
        
        if #available(iOS 11.0, *) {
            appearance.setupMaskedCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
        
        dropDowns.forEach {
            $0.cellNib = UINib(nibName: "MyCell", bundle: nil)
            $0.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
                guard let cell = cell as? MyCell else { return }
                cell.logoImageView.sd_setImage(with: URL(string: self.gasFotoURL[index]))
            }
        }
    }
    
    func setupChooseCategoryDropDown(){
        customizeDropDown()
        chooseCategory.dismissMode = .onTap
        chooseCategory.anchorView = btnCategoria
        chooseCategory.bottomOffset = CGPoint(x: 0, y: btnCategoria.bounds.height)
        
        // Action triggered on selection
        chooseCategory.selectionAction = { [weak self] (index, item) in
            self?.btnCategoria.setTitleColor(UIColor.black, for: .normal)
            self?.btnCategoria.setTitle(item, for: .normal)
            self?.categoriaDropDown = RealizarEncuestaViewController.gaoCategorias[index]
        }
        
    }
    
    func limpiarTextFields(){
        txtNombre.text = ""
        txtApellido.text = ""
        txtFechaNacimiento.text = ""
        txtCorreo.text = ""
        txtDni.text = ""
        btnCategoria.setTitleColor(UIColor(named: "borderButtonStyle"), for: .normal)
        btnCategoria.setTitle("Seleccione una categoría", for: .normal)
        categoriaDropDown = nil
        txtPorque.text = ""
    }
}


