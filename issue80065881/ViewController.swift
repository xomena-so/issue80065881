//
//  ViewController.swift
//  issue80065881
//
//  Created by Google Training 2 on 29/05/2018.
//  Copyright © 2018 Google Trainining. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        //let encPoly = "lysmE_}zy[E??SIaJAiBBMDUGGgAkAc@n@s@s@"
        //let poly = GMSPolyline.init(path: GMSPath.init(fromEncodedPath: encPoly))
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: -33.85, longitude: 151.20))
        path.add(CLLocationCoordinate2D(latitude: -33.70, longitude: 151.40))
        path.add(CLLocationCoordinate2D(latitude: -33.73, longitude: 151.41))
        let poly = GMSPolyline(path: path)
        poly.map = mapView
        
        let p = poly.path!
        let b = GMSCoordinateBounds(path: p)
        let update = GMSCameraUpdate.fit(b, withPadding: CGFloat.init())
        
        mapView.moveCamera(update)
    }

}

