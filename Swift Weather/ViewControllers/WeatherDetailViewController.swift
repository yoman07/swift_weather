import UIKit
import CoreLocation
import Alamofire

final class WeatherDetailViewController: UIViewController {

    var coordinate: CLLocationCoordinate2D?
    var apiService: ApiServiceProtocol?
    
    override func viewDidLoad() {
        guard let coordinate = coordinate else {
           return
        }
    
        apiService?.performWeather(lat: coordinate.latitude, long:coordinate.longitude) { result in
            
        }

    }
    
    @IBAction func close(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
