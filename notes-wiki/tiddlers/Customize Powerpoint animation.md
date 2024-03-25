## Info
* [MsoAnimEffect enumeration (PowerPoint) - Microsoft Learn](https://learn.microsoft.com/en-us/office/vba/api/PowerPoint.msoanimeffect)
* [MsoAnimateByLevel enumeration (PowerPoint) - Microsoft Learn](https://learn.microsoft.com/en-us/office/vba/api/powerpoint.msoanimatebylevel)
* https://learn.microsoft.com/en-us/office/vba/api/powerpoint.shapes.addshape

## Sample
```vb
Sub Bounce()
    Dim slide As slide
    Dim shape As shape
    Dim effect As effect

    Set Selection = ActiveWindow.Selection
    Set shape = ActiveWindow.Selection.ShapeRange(1)
    Set slide = shape.Parent
    Set effect = slide.TimeLine.MainSequence.AddEffect(shape:=shape, _
                    effectId:=msoAnimEffectBounce, _
                    Level:=msoAnimateLevelNone, _
                    trigger:=msoAnimTriggerAfterPrevious)
    effect.Timing.Duration = 5
End Sub
```

## Possibly useful Sites

* http://www.pptalchemy.co.uk/ 