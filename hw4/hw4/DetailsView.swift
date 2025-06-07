import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "About Me!!"
        navigationItem.backButtonTitle = "Back"

        setupLayout()
    }

    private func setupLayout() {
        let imageView = UIImageView(image: UIImage(named: "myPhoto"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 120
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true

        let aboutLabel = UILabel()
        aboutLabel.text = """
        Hi! My name is Dariya. I am 19 y.o. I started coding back in high school, first out of curiosity, and then it became something I truly enjoy. I love reading detective books and emotional fiction, also comics (especially dc!). Music is a big part of my life — my favourite music band is *the Neighbourhood*. My favourite tv-show is *Supernatural* and fav book is "Frankenstein" by Mary Shelley.
        """
        aboutLabel.numberOfLines = 0
        aboutLabel.font = UIFont.systemFont(ofSize: 16)
        aboutLabel.textColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0)

        let textBox = UIView()
        textBox.layer.borderWidth = 1
        textBox.layer.borderColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0).cgColor
        textBox.layer.cornerRadius = 12

        let textStack = UIStackView(arrangedSubviews: [aboutLabel])
        textStack.axis = .vertical
        textStack.spacing = 8
        textBox.addSubview(textStack)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textStack.topAnchor.constraint(equalTo: textBox.topAnchor, constant: 16),
            textStack.bottomAnchor.constraint(equalTo: textBox.bottomAnchor, constant: -16),
            textStack.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 16),
            textStack.trailingAnchor.constraint(equalTo: textBox.trailingAnchor, constant: -16)
        ])

        let backButton = UIButton(type: .system)
        backButton.setTitle("Go Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        backButton.backgroundColor = UIColor(red: 236/255, green: 141/255, blue: 179/255, alpha: 1.0)
        backButton.layer.cornerRadius = 10
        backButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [imageView, textBox, backButton])
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
