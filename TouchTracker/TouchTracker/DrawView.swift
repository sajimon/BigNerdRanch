//
//  DrawView.swift
//  TouchTracker
//
//  Created by Marcin Sporysz on 12/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()
    var selectedLineIndex: Int?
    
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let doubleTapRec = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTap))
        doubleTapRec.numberOfTapsRequired = 2
        doubleTapRec.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRec)
        
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(DrawView.tap))
        tapRec.delaysTouchesBegan = true
        tapRec.requireGestureRecognizerToFail(doubleTapRec)
        addGestureRecognizer(tapRec)
        
    }
    
    //MARK: - Drawing methods
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.Round
        
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        finishedLineColor.setStroke()
        
        for line in finishedLines {
            strokeLine(line)
        }
        
        currentLineColor.setStroke()
        for (_,line) in currentLines {
            strokeLine(line)
        }
        
        if let index = selectedLineIndex {
            UIColor.greenColor().setStroke()
            let selectedLine = finishedLines[index]
            strokeLine(selectedLine)
        }
    }
    
    //MARK: - Touch related methods
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(__FUNCTION__)

        
        for touch in touches {
            let location = touch.locationInView(self)
            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
            print(__FUNCTION__)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.locationInView(self)
                
                finishedLines.append(line)
                currentLines.removeValueForKey(key)
            }
            
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(__FUNCTION__)
        
        for touch in touches {
            let location = touch.locationInView(self)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = location
        }

        setNeedsDisplay()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print(__FUNCTION__)
        
        currentLines.removeAll()
        
        setNeedsDisplay()
    }
    
    //MARK: - Gesture recognizer methods
    func doubleTap(gr: UIGestureRecognizer) {
        print("Recognized double tap...")
        
        selectedLineIndex = nil
        
        currentLines.removeAll(keepCapacity: false)
        finishedLines.removeAll(keepCapacity: false)
        setNeedsDisplay()
    }
    
    func tap(gr: UIGestureRecognizer) {
        print("Recognized single tap...")
        
        let point = gr.locationInView(self)
        selectedLineIndex = indexOfLineAtPoint(point)
        
        setNeedsDisplay()
    }
    
    //MARK: - Other
    func indexOfLineAtPoint(point: CGPoint) -> Int? {
        for (index, line) in finishedLines.enumerate() {
            let begin = line.begin
            let end = line.end
            
            for t in CGFloat(0).stride(to: 1.0, by: 0.05) {
                let x = begin.x + ((end.x - begin.x) * t)
                let y = begin.y + ((end.y - begin.y) * t)
                
                if hypot(x - point.x, y - point.y) < 20.0 {
                    return index
                }
            }
        }
        
        return nil
    }
    
}
