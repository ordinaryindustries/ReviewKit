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
The default behavior is to display the star rating as well as the rating score. To disable the score you can pass `showScore: false` to the `ShapeProgressView`.
```
ShapeProgressView(value: $value, showScore: false)
```
