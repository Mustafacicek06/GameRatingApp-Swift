

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // general foundation working
        // tabbar controller holding navigation controller, holding view controller
        
        let homeNC = createNavigationController(title: "Home", viewContoller: HomeVC(), tabbarItem: .bookmarks, tag: 0)
        
        let favoriteNC = createNavigationController(title: "Favorite Games", viewContoller: FavoriteListVC(), tabbarItem: .favorites, tag: 1)
   
        
        let tabBar = createTabBar(viewControllers: [homeNC , favoriteNC])
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    func createNavigationController(title: String, viewContoller: UIViewController, tabbarItem: UITabBarItem.SystemItem, tag: Int) -> UINavigationController {
        
        let viewController = viewContoller
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: tabbarItem, tag: tag)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createTabBar(viewControllers: [UIViewController]) -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().backgroundColor = .systemGray
        UITabBar.appearance().unselectedItemTintColor = .white
        tabBar.viewControllers = viewControllers
        return tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

