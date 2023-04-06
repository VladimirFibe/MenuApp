import UIKit

protocol ImageViewerViewProtocol: AnyObject {
    func showImage(image: UIImage?)
}

class ImageViewerViewController: UIViewController {
    // MARK: - Public
    let imageView = UIImageView()
    var presenter: ImageViewerPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        presenter?.viewDidLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
}

// MARK: - Private functions
private extension ImageViewerViewController {
    func initialize() {
    }
}

// MARK: - ImageViewerViewProtocol
extension ImageViewerViewController: ImageViewerViewProtocol {
    func showImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
}
