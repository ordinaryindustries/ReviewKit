# ![ReviewKitIconThumbnail](https://github.com/ordinaryindustries/ReviewKit/assets/132616209/c67cae54-9885-4440-b092-c0957b8b90f0)
ReviewKit

Twitter [@OrdinaryInds](https://www.twitter.com/ordinaryinds)

## Usage
Add a ShapeProgressView in your view code and pass in your app's ID. The view will automatically fetch your app's rating when the view appears.
```
var body: some View {
    VStack {
        ShapeProgressView(appId: "12345678")
    }
}
```
The default behavior is to display the rating as a number, the rating as a set of stars, and a text line with the count of total reviews the rating is based on. When initalizing `ShapeProgressView` you can modify this behavior by setting the optional property `layout`. Options are `.full`, `.score`, and `.graphical`.
```
ShapeProgressView(layout: .full)
```

.full

<img width="512" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/87556a52-474c-45d4-9ff5-921225d853b4">

.score

<img width="512" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/1f763ba2-8c25-481e-853d-145b7d288fab">

.graphical

<img width="511" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/61c5cf05-2d5f-4a99-9261-558074a42829">

### Showing/Hiding the text view
You can choose to hide the rating count text by passing an optional property.
```
ShapeProgressView(appId: "12345678", showReviewCount: false)
```

### Changing colors
You can pass a `Color` to the `color` property to modify the tint used for the stars. This is only visible in the `.graphical` and `.full` layout modes. 
```
ShapeProgressView(appId: "12345678", color: Color.green)
```

If you have any questions reach out on Twitter [@OrdinaryInds](https://www.twitter.com/ordinaryinds)
