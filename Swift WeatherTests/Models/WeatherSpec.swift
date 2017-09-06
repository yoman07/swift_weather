import Foundation
import Quick
import Nimble
import Marshal

@testable import Swift_Weather

final class WeatherSpec: QuickSpec {
    
    override func spec() {
        describe("Weather") {
            
            var subject: Weather!
            
            beforeEach {
                let fixture = Fixture().find(name: "weather") as? [String: Any]
                subject = try! fixture?.value(for: "")
            }
            
            describe("parsing") {
                
                context("valid") {
                    
                    it("parses weather name correctly") {
                        expect(subject.name) == "Branszczyk"
                    }
                    
                    it("parses coord correctly") {
                        expect(subject.coord) == WeatherCoord(lon: 21.64, lat: 52.65)
                    }
                    
                    it("parses details correctly") {
                        expect(subject.details) == WeatherDetails(
                            temp: 286.336, pressure: 1008.09,
                            humidity: 90, tempMin: 286.336,
                            tempMax: 286.336,
                            seaLevel: 1021.82,
                            groundLevel: 1008.09)
                    }
                    
                    it("parses wind correctly") {
                        expect(subject.wind) == Wind(speed: 1.52, deg: 177.501)
                    }
                    
                    it("parses wind correctly") {
                        expect(subject.wind) == Wind(speed: 1.52, deg: 177.501)
                    }
                    
                    it("parses place correctly") {
                        expect(subject.place) == Place(country: "PL", sunrise: 1504670028, sunset: 1504717685)
                    }
                }
            }
        }
    }
}

