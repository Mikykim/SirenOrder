// Custom Corners of the the Item

import SwiftUI

struct CustomCorner: Shape  {
    var corners: UIRectCorner
    var radius : CGFloat
    //This function has to invoke the corner functionality of the Item 
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect : rect, byRoundingCorners: [.bottomLeft, .bottomRight,],  cornerRadii:  CGSize(width: 35, height: 35))
        return Path (path.cgPath)
    }
}

