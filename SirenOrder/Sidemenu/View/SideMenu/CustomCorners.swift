import SwiftUI

struct CustomCorners: Shape  {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:  CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
    var corners: UIRectCorner
    var radius : CGFloat
    
}
