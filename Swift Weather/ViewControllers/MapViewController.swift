import UIKit
import MapKit

final class MapViewController: UIViewController {
    private static let showWeatherSegue = "showWeather"
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        mapView.showsUserLocation = true
        locationManager.requestWhenInUseAuthorization()
        setupGestureRecognizer()
    }
    
    private func setupGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapOnMap(recognizer:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        tapGestureRecognizer.delegate = self
        mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func doubleTapOnMap(recognizer: UITapGestureRecognizer) {
        let coordinate = mapView.convert(recognizer.location(in: mapView), toCoordinateFrom: mapView)
        print("Double tap on coordinate \(coordinate)")
        performSegue(withIdentifier: MapViewController.showWeatherSegue, sender: coordinate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let coordinate = sender as? CLLocationCoordinate2D,
            let destination = segue.destination as? WeatherDetailViewController {
            destination.coordinate = coordinate
            destination.apiService = ApiService(host: "https://api.openweathermap.org/data/2.5/weather?", apiKey: "05bc8675dc8e62dd5eb84aed83c9b31b") //use dependency injection for that
        }
    }
}

extension MapViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
