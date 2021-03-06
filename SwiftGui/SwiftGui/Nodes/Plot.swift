//
//  Plot.swift
//  SwiftGui
//
//  Created by Erick Jung on 25/10/2019.
//  Copyright © 2019 Erick Jung. All rights reserved.
//

import Foundation
import SwiftGUI_Core

public enum PlotNodeType
{
    case line
    case histogram
}

public func Plot(_ title: String,
                 type: PlotNodeType,
                 values: [Float],
                 valuesOffset: Int = 0,
                 overlayText: String = "",
                 minScale: Float = Float.greatestFiniteMagnitude,
                 maxScale: Float = Float.greatestFiniteMagnitude,
                 size: SGSize = .zero,
                 stride: Int = MemoryLayout<Float>.size) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        switch type {
            
        case .line:
            
            igPlotLines(title,
                        values.map({ return $0 }),
                        Int32(values.count),
                        Int32(valuesOffset),
                        overlayText,
                        minScale,
                        maxScale,
                        size.convertToVec2(),
                        Int32(stride))
        case .histogram:
            
            igPlotHistogramFloatPtr(title,
                                    values.map({ return $0 }),
                                    Int32(values.count),
                                    Int32(valuesOffset),
                                    overlayText,
                                    minScale,
                                    maxScale,
                                    size.convertToVec2(),
                                    Int32(stride))
        }
    }
}


public func ProgressBar(_ fraction: Float,
                        size: SGSize = SGSize(width: -1, height: 0),
                        overlay: String? = nil) -> GuiNode {
    
    GuiNode(tag: #function).onRender { _ in
        
        igProgressBar(fraction, size.convertToVec2(), overlay)
    }
}
