//
//  SettingViewController.swift
//  Instagram
//
//  Created by vishalthakur on 27/01/22.
//

import UIKit

struct SettingsModelCell {
    let title: String
    let handler: (() -> Void)
}
///view controller to show settings
class SettingViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       return tableView
    }()
    
    private var data = [[SettingsModelCell]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func  configureData(){
        let section = [
            SettingsModelCell(title: "Log Out"){[weak self] in
                self?.didTapLogout()
            }
        ]
        data.append(section)
    }

    private func didTapLogout(){
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            DispatchQueue.main.async {
                AuthManager.shared.logOutUser(completion: {loggedOut in
                    if loggedOut{
                        //logged out sucessfully
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: false){
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    }
                    else{
                        //error
                        fatalError("Could not logout user")
                    }
                })
            }
            
        }))
        
        //Handling ipad crashes
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
    present(actionSheet,animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Assign frames
        tableView.frame = view.bounds
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Handle selection
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}
