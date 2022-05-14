//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by vishalthakur on 14/05/22.
//

import UIKit


protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField value: EditProfileFormModel)
}
class FormTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    
    public weak var delegate : FormTableViewCellDelegate?
    
    private var model : EditProfileFormModel?
    private let formLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .label
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: EditProfileFormModel){
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Assign frames
        formLabel.frame = CGRect(x: 5, y: 0, width: contentView.width/3, height: contentView.height)
        field.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width - formLabel.width-10, height: contentView.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        model?.value = textField.text
        guard let model = model else {
            return true
        }

        delegate?.formTableViewCell(self, didUpdateField: model)
        return true
    }
}
