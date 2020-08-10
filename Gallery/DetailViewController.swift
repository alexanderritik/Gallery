//
//  DetailViewController.swift
//  Gallery
//
//  Created by Ritik Srivastava on 09/08/20.
//  Copyright © 2020 Ritik Srivastava. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title=selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
//        first parameter is sytemicon
//        action which method is to called
//        target self means present in same
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageName = selectedImage {
            imageView.image=UIImage(named: imageName)
                    }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap=true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap=false;
    }
    
    @objc func shareTapped()  {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("Image not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }


}
