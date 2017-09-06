import Foundation

class Fixture {
    func find(name: String) -> Any {
        
        let bundle: Bundle = Bundle(for: type(of: self))
        
        guard let path =  bundle.path(forResource: name, ofType: "json"),
            let data = try? NSData(contentsOfFile: path, options: .mappedIfSafe),
            let json = try? JSONSerialization.jsonObject(with: data as Data,
                                                         options: JSONSerialization.ReadingOptions.allowFragments) else {
                                                            fatalError("no fixture (\(name))")
        }
        
        return json
    }
}



