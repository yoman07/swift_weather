import UIKit
import CoreLocation

final class WeatherDetailViewController: UIViewController {

    var coordinate: CLLocationCoordinate2D?
    
    @IBAction func close(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
