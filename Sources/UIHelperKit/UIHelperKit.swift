
import UIKit

public extension UIView {

  func addShadow(color: UIColor = .black,
                 opacity: Float = 0.5,
                 offset: CGSize = CGSize(width: 0, height: 2),
                 radius: CGFloat = 2,
                 cornerRadius: CGFloat = 5) {
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offset
    layer.shadowRadius = radius
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = false
  }

  func setBackgroundGradient(colors: [UIColor],
                             startPoint: CGPoint,
                             endPoint: CGPoint) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.startPoint = startPoint
    gradientLayer.endPoint = endPoint
    gradientLayer.frame = bounds

    layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
    layer.insertSublayer(gradientLayer, at: 0)
  }
}

public extension UIColor {
  convenience init(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

    var rgb: UInt64 = 0

    Scanner(string: hexSanitized).scanHexInt64(&rgb)

    let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgb & 0x0000FF) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
}


