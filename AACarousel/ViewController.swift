//
//  ViewController.swift
//  AACarousel
//
//  Created by Alan on 2017/6/11.
//  Copyright © 2017年 Alan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AACarouselDelegate {
    
    @IBOutlet weak var carouselView: AACarousel!
    
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let pathArray = [
            "https://placeimg.com/600/240/any?rnd=1",
            "https://placeimg.com/600/240/any?rnd=2",
            "https://placeimg.com/600/240/any?rnd=3",
            "https://placeimg.com/600/240/any?rnd=4",
            "https://placeimg.com/600/240/any?rnd=5"
        ]
        
        title = "Samples"
        
        titleArray = ["picture 1","picture 2","picture 3","picture 4","picture 5"]
        carouselView.delegate = self
        carouselView.setCarouselData(paths: pathArray,  describedTitle: titleArray, isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        //optional method
        carouselView.setCarouselOpaque(layer: true, describedTitle: false, pageIndicator: true)
        carouselView.setCarouselLayout(displayStyle: 2, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: .clear)
        carouselView.setImageViewCornerRadius(radius: 10)
        carouselView.setImageViewContentMode(contentMode: .scaleAspectFill)
        carouselView.setShowShadown(true)
        
        // remove comments when need test shadow
        //carouselView.backgroundColor = UIColor(red:0.34, green:0.68, blue:0.89, alpha:1.0)
        //view.backgroundColor = UIColor(red:0.34, green:0.68, blue:0.89, alpha:1.0)
    }
    
    //require method
    func downloadImages(_ url: String, _ index:Int) {
        
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            self.carouselView.images[index] = downloadImage!
        })
        
    }
    
    //optional method (interaction for touch image)
    func didSelectCarouselView(_ view:AACarousel ,_ index:Int) {
        
        let alert = UIAlertView.init(title:"Alert" , message: titleArray[index], delegate: self, cancelButtonTitle: "OK")
        alert.show()
        
        //startAutoScroll()
        //stopAutoScroll()
    }
    
    //optional method (show first image faster during downloading of all images)
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
        
    }
    
    func startAutoScroll() {
       //optional method
       carouselView.startScrollImageView()
        
    }
    
    func stopAutoScroll() {
        //optional method
        carouselView.stopScrollImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

