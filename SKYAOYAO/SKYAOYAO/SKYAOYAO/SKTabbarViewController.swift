//
//  SKTabbarViewController.swift
//  SKYAOYAO
//
//  Created by XunLi on 2017/6/1.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

import UIKit

class SKTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 添加子控制器
        addChildVC(childVCName: "SKHomeViewController", title: "首页", imgName: "home");
        
        addChildVC(childVCName: "SKCategoryViewController", title: "分类", imgName: "icon-discover");
        
        addChildVC(childVCName: "SKShopCarViewController", title: "购物车", imgName: "home");
        // 添加子控制器
        addChildVC(childVCName: "SKProfileViewController", title: "我的", imgName: "profile");
        

    }

    // MARK1: 添加子控制器 方法抽取
    func addChildVC(childVCName:String,title:String,imgName:String){
        let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类,获取控制器
        // name 其实就是项目的名字,项目的名字不要带有非法符号
        let cls = NSClassFromString(name + "." + childVCName) as! UIViewController.Type;
        // 转化为vcclass
        let vc = cls.init();
        
        vc.tabBarItem.image = UIImage(named: imgName);
        vc.tabBarItem.selectedImage = UIImage(named: imgName+"(1)");
        vc.tabBarItem.title = title;
        vc.navigationItem.title = title;
        
        // 包装导航控制器
        let  nav = UINavigationController();
        nav.addChildViewController(vc);
        addChildViewController(nav);
        
    }
}
