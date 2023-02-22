//
//  BlurView.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/1/23.
//

import SwiftUI

struct BlurView: NSViewRepresentable{
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
}
