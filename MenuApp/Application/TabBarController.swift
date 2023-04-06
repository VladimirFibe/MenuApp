import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contacts
    case profile
    case basket
    
    var title: String {
        switch self {
        case .menu: return "Меню"
        case .contacts: return "Контакты"
        case .profile: return "Профиль"
        case .basket: return "Корзина"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .menu: return #imageLiteral(resourceName: "menu")
        case .contacts: return #imageLiteral(resourceName: "contacts")
        case .profile: return #imageLiteral(resourceName: "profile")
        case .basket: return #imageLiteral(resourceName: "basket")
        }
    }
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
        switchTo(.menu)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(_ tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configure() {
        tabBar.tintColor = .menuRedColor
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.separator.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = false
                
        let controllers: [NavBarController] = Tabs.allCases.map {
            let controller = NavBarController(rootViewController: getController(for: $0))
            controller.tabBarItem = UITabBarItem(title: $0.title,
                                                 image: $0.icon,
                                                 tag: $0.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .menu: return MainModuleBuilder.build()
        default: return UIViewController()
        }
    }
}
