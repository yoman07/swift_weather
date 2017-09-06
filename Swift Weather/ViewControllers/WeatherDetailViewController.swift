import UIKit
import CoreLocation
import Alamofire

final class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var coordinate: CLLocationCoordinate2D?
    var apiService: ApiServiceProtocol?
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        displayWeather(for: coordinate)
    }
    
    private func displayWeather(for coordinate:CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        apiService?.performWeather(lat: coordinate.latitude, long:coordinate.longitude) {[weak self] result in
            if case let .success(weather) = result {
                self?.fillData(weather: weather)
            }
            if case let .error(error) = result {
                self?.showError(error: error)
            }
        }
    }
    
    private func fillData(weather: Weather) {
        placeLabel.isHidden = false
        temperatureLabel.isHidden = false
        descriptionLabel.isHidden = false
        indicatorView.isHidden = true
        
        temperatureLabel.text = String(format: "%.0f °C", weather.details.temp - 273.15)
        descriptionLabel.text = weather.weatherDescription.first?.detail ?? ""
        placeLabel.text = weather.name
    }
    
    private func showError(error: Error) {
        indicatorView.isHidden = true
        descriptionLabel.isHidden = false
        descriptionLabel.text = NSLocalizedString("Error while getting weather", comment: "")
        print(error)
    }
    
    @IBAction func close(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
