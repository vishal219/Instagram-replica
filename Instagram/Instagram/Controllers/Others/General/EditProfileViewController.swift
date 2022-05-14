//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit

//MARK: - MODEL
struct EditProfileFormModel {
    let label : String
    let placeholder: String
    var value: String?
}

class EditProfileViewController: UIViewController,UITableViewDataSource {
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return table
    }()
    
    private var model = [[EditProfileFormModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = createHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        configureModel()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
        // Do any additional setup after loading the view.
    }
    
    private func configureModel() {
        //Configure model
        //Name, username , website, bio
        let sectionLabels = ["Name","Username","Website","Bio"]
        var model1 = [EditProfileFormModel]()
        for label in sectionLabels{
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            model1.append(model)
        }
        model.append(model1)
        //email, phone , gender
        let sectionLabels2 = ["Email","Phone","Gender"]
        var model2 = [EditProfileFormModel]()
        for label in sectionLabels2{
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            model2.append(model)
        }
        model.append(model2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Assign frames
        tableView.frame = view.bounds
    }
    //MARK: - Table functions

    private func createHeaderView() -> UIView{
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/3).integral)
        //Add Profile button
        let size = header.height/1.5
        let profilePhoto = UIButton(frame: CGRect(x: (view.width-size)/2, y: (header.height - size)/2, width: size, height: size))
        header.addSubview(profilePhoto)
        profilePhoto.layer.masksToBounds = true
        profilePhoto.layer.cornerRadius = size/2.0
        profilePhoto.tintColor = .label
        profilePhoto.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhoto.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhoto.layer.borderWidth = 1
        profilePhoto.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    @objc func didTapProfilePhotoButton(){
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else{
            return nil
        }
        return "Private Information"
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier,for: indexPath) as! FormTableViewCell
        cell.configure(with: model[indexPath.section][indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    
    @objc private func didTapSave(){
        //Save to database
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapCancel(){
        //Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapChangeProfilePicture(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change Profile Picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {_ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: {_ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            
        }))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}
extension EditProfileViewController: FormTableViewCellDelegate{
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField value: EditProfileFormModel) {
        print("field updated to \(value.value)")
    }
    
    
}
