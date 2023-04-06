import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
}
class WelcomeViewController: UIViewController {
    let weatherLabel = UILabel()
    let dateLabel = UILabel()
    lazy var button = UIButton(type: .system)
    lazy var stack = UIStackView(arrangedSubviews: [weatherLabel, dateLabel, button])
    var presenter: WelcomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoaded()
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        weatherLabel.text = "Погода"
        weatherLabel.textAlignment = .center
        dateLabel.text = "Today"
        dateLabel.textAlignment = .center
        button.setTitle("Show", for: .normal)
        button.addTarget(self, action: #selector(showImage), for: .primaryActionTriggered)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stack.frame = view.bounds
    }
    
    @objc func showImage() {
        presenter?.didTapImageButton()
    }
}

extension WelcomeViewController: WelcomeViewProtocol {
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.dateLabel.text = date
        }
    }
    
    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather
        }
    }
    
    
}
