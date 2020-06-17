//
//  MapViewController.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 02/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON
import Intercom
import GoogleMapsUtils

class MapViewController: UIViewController, GMSMapViewDelegate{
    var heatmapLayer: GMUHeatmapTileLayer!
    var mapView :GMSMapView?
    @IBOutlet weak var lastmodifyView: UIView!
    @IBOutlet weak var lastmodifyLabel: UILabel!
    @IBOutlet weak var resumenCasosButton: UIButton!
    var arrayDataCasos = Array<CasosData>()
    var arrayHeatmapData = Array<HeatmapData>()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lastmodifyView.alpha = 0.8
        ConfigureGoogleMap()
        
        //Set HeatMap options
        heatmapLayer = GMUHeatmapTileLayer()
        heatmapLayer.radius = 50
        heatmapLayer.opacity = 0.9
        
        GetJson()
        GetJsonHeatmap()
        
        //CreateHeatmap()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func ShowResumenCasos(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resumenController = storyBoard.instantiateViewController(withIdentifier: "resumendecasosview") as! ResumenCasosTableViewController
        resumenController.data = arrayDataCasos
        //self.navigationController?.pushViewController(resumenController, animated: true)
        self.tabBarController?.present(resumenController, animated: true, completion: {
            Intercom.setLauncherVisible(false)
        })
        
    }
    
    func ConfigureGoogleMap(){
        // Create a GMSCameraPosition
        let camera = GMSCameraPosition.camera(withLatitude: 25.6915233, longitude: -100.3192888, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView?.delegate = self
        mapView?.setMinZoom(7.0, maxZoom: 12.0)

        self.view.insertSubview(mapView!, at: 0)
    }
    
    func CreateMarkers(municipio :String, location :String, casosConfirmados :Int){
        var loc = location.components(separatedBy: ",")
        var latitude = Double(loc[0])
        var longitude = Double(loc[1])
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        marker.title = municipio
        marker.snippet = "Casos confirmados: \(casosConfirmados)"
        marker.map = mapView
    }
    
    func CreateHeatmap(){
        var list = [GMUWeightedLatLng]()
        for item in arrayHeatmapData {
            let lat = item.latitud
            let lng = item.longitud
            let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: lng!), intensity: 1.0)
            //let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat as! CLLocationDegrees, lng as! CLLocationDegrees), intensity: 1.0)
          list.append(coords)
        }
        
        
        // Add the latlngs to the heatmap layer.
        heatmapLayer.weightedData = list
        //Set heatmap to the mapview
        heatmapLayer.map = self.mapView
    }
    
    func GetJson(){
        AF.request("SERVICE_URL").response { response in
            let json = JSON(response.data)
            
            if(json != nil){
                var x = 0
                for _ in json{
                    //print(json.)
                    if(x == 0){
                        self.lastmodifyLabel.text = json[x]["lastmodify"].stringValue
                        x+=1
                    }else{
                        var casosData = CasosData()
                        var municipio = json[x]["municipio"].stringValue
                        var location = json[x]["latlong"].stringValue
                        var casosConfirmados = json[x]["casosconfirmados"].intValue
                        
                        self.CreateMarkers(municipio: municipio, location: location, casosConfirmados: casosConfirmados)
                        casosData.CasosData(mun: municipio, cas: String(casosConfirmados), loc: location)
                        self.arrayDataCasos.append(casosData)
                        
                        x+=1
                    }
                }
            }else{
                //TODO poner aviso de error
                print("json es nulo")
            }
        }
    }
    
    
    func GetJsonHeatmap(){
        var y = 0
        AF.request("SERVICE_URL").response { response in
            let jsonHM = JSON(response.data)
                        
            if(jsonHM != nil){
                for _ in jsonHM{
                    if(y == 0){
                        y = y + 1
                    }else{
                        var heatmapData = HeatmapData()
                        
                        var latlong = jsonHM[y]["latlong"].stringValue.components(separatedBy: ",")
                        
                        var latitud = Double(latlong[0])
                        var longitud = Double(latlong[1])
                        
                        
                        heatmapData.LocationData(lat: latitud!, longi: longitud!)
                        self.arrayHeatmapData.append(heatmapData)
                        y = y + 1
                    }
                }
                self.CreateHeatmap()
            }else{
                //TODO poner aviso de error
                print("json es nulo")
            }
        }
    }
    
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
    }

}
