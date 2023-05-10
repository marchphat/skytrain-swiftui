//
//  AnyTransition.swift
//  skytrain
//
//  Created by Nantanat Thongthep on 10/5/2566 BE.
//

import SwiftUI

extension AnyTransition {
    static var slideDown: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
