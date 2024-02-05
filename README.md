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
The default behavior is to display the star rating as well as the rating score. When initalizing `ShapeProgressView` you can set the layout type with an optional property `layout`. Options are `.full`, `.score`, and `.graphical`.
```
ShapeProgressView(value: $value, layout: .full)
```

.full

<img width="512" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/87556a52-474c-45d4-9ff5-921225d853b4">

.score

<img width="512" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/1f763ba2-8c25-481e-853d-145b7d288fab">

.graphical

<img width="511" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/61c5cf05-2d5f-4a99-9261-558074a42829">

