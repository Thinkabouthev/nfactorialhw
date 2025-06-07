import UIKit

class InfoBoxView: UIView {
    
    init(icon: String, title: String, value: String) {
        super.init(frame: .zero)
        setup(icon: icon, title: title, value: value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(icon: String, title: String, value: String) {
        let imageView = UIImageView(image: UIImage(systemName: icon))
        imageView.tintColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        valueLabel.textColor = .darkGray
        
        let textStack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        textStack.axis = .vertical
        textStack.spacing = 2
        
        let hStack = UIStackView(arrangedSubviews: [imageView, textStack])
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.alignment = .center
        
        addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.cornerRadius = 10
    }
}
