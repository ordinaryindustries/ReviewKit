# ![ReviewKitIconThumbnail](https://github.com/ordinaryindustries/ReviewKit/assets/132616209/c67cae54-9885-4440-b092-c0957b8b90f0)
ReviewKit

## Usage
Add a ShapeProgressView and pass it a rating value.
```
@State private var value:Double = 3.3

var body: some View {
    VStack {
        ShapeProgressView(value: $value)
    }
}
```
The default behavior is to display the star rating as well as the rating score. When initalizing `ShapeProgressView` you can set the layout type with an optional property `layout`. Options are .automatic, .score, and .graphical.
```
ShapeProgressView(value: $value, layout: .score)
```

.automatic

.score

.graphical
