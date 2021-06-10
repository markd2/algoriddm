import Foundation


extension String {
    var deletingPathExtension: String {
        let nsstring = self as NSString
        return nsstring.deletingPathExtension
    }

    var pathExtension: String {
        let nsstring = self as NSString
        return nsstring.pathExtension
    }

    func intDig(_ offset: Int) -> String {
        String(self[index(startIndex, offsetBy: offset)])
    }
}

