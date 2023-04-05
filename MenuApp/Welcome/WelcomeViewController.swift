import UIKit

protocol WelcomeViewProtocol: AnyObject {
    
}
class WelcomeViewController: UIViewController {
    var presenter: WelcomeViewProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension WelcomeViewController: WelcomeViewProtocol {
    
}
