
# Snapshot sizing

## Video sizing
The class `SnapshotSizer` handles 4K, 2K, 1080p, etc. 

### How SnapshotSizer is used
cvc:renderKeyframe is using it when it instantiates a new `MovieRenderer:withScene:atSize...`


## Ratio selector
This is for when you need a Dribbble shot, App Store screenshots

* Functionality lives in `CanvasViewController`
* The method called when changing the aspect drop down is `aspectChanged:`

### cvc:aspectChanged
There is an `AspectRatioStore`. It only stores aspects, and not exact pixel dimensions. 
`aspectChanged` first sets the default to whatever was picked. It's an AspectRatio object. 
Then asks to update the aspect ratio from defaults with `updateAspectFromDefaults`

### `updateAspectFromDefaults`
Simply sets the layout constraint of the scene's view to match that aspect

## Discussion
The non-hard pixel dimensions are there to let the user pick a resolution for their video outputs, and not be constrained by a hardcoded pixel number. However, hard pixel values are necessary when uploading to the appstore. 

So one way around this could be to say, ok, if we're doing a snapshot, and the user has selected one of the appstore presets, then we'll simply use a `pixelSize : CGSize` on the `AspectRatio` class instead. The user has already indicated intent by picking the AppStore preset, and the output is bigger, not smaller, than a regular 4K snapshot.


## Life of a snapshot
User clicks the button, which fires `shutterPressed`. This action can also come from cmd-c. 

The function then calls `makeSnapshot` with the size of `.tiny` to make a thumbnail. When that's done, it makes a snapshot of the size `.uhd` (enum of string "4K"). It then tells the `Exporter` that it's a still, where it is on disk, and sets the image. If the action came from cmd-c it also places the image on the pasteboard. 

