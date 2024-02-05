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
<img width="510" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/41bf9069-2b3d-468d-b7fb-bb069371da29">



The default behavior is to display the star rating as well as the rating score. To disable the score you can pass `showScore: false` to the `ShapeProgressView`.
```
ShapeProgressView(value: $value, showScore: false)
```
<img width="513" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/c307577a-36f7-48a3-a84e-0456daf7f44e">
