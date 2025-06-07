import UIKit

class ContentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    func setupLayout() {
        let titleLabel = UILabel()
        titleLabel.text = "Hello!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "My name is Dariya"
        subtitleLabel.textAlignment = .center
        
        let heartIcon = UIImageView(image: UIImage(systemName: "heart"))
        heartIcon.tintColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0)
        
        let imageView = UIImageView(image: UIImage(named: "myPhoto"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 100
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        let infoStack = UIStackView(arrangedSubviews: [
            InfoBoxView(icon: "globe.asia.australia", title: "Location", value: "Almaty"),
            InfoBoxView(icon: "building.columns", title: "Age", value: "19"),
            InfoBoxView(icon: "heart.text.square", title: "Hobby", value: "Languages")
        ])
        infoStack.axis = .horizontal
        infoStack.spacing = 16
        infoStack.alignment = .center
        infoStack.distribution = .equalSpacing
        infoStack.alignment = .center
        infoStack.distribution = .equalSpacing
        
        
        let detailsButton = UIButton(type: .system)
        detailsButton.setTitle("View details", for: .normal)
        detailsButton.setTitleColor(.white, for: .normal)
        detailsButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        detailsButton.backgroundColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0)
        detailsButton.layer.cornerRadius = 12
        detailsButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        detailsButton.addTarget(self, action: #selector(openDetails), for: .touchUpInside)
        
        let mainStack = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel,
            heartIcon,
            imageView,
            infoStack,
            detailsButton
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.alignment = .center
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc private func openDetails() {
            let vc = DetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
}
