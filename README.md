# ReviewKit
![GitHub Social Image](https://github.com/user-attachments/assets/124d6d31-006e-4231-83eb-70335cd5d4a6)


Twitter [@OrdinaryInds](https://www.twitter.com/ordinaryinds)
[Discord](https://discord.com/invite/rVvg4HgfxU)

## Contributing
If you're interested in contributing to ReviewKit head over to CONTRIBUTING.md and get started.

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

<img width="481" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/caa9f88b-4f44-4a7a-9be4-4df523c2be66">


.score

<img width="509" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/96f0e5c3-b521-46e7-a9af-136b14314aad">


.graphical

<img width="506" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/21bc470c-bd1f-4c60-9b5f-9e0170e6f90e">


### Showing/Hiding the text view
You can choose to hide the rating count text by passing an optional property.
```
ShapeProgressView(appId: "12345678", showReviewCount: false)
```
<img width="494" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/5ce7c11e-f104-4dae-bcc2-311c2253fd39">


### Changing colors
You can pass a `Color` to the `color` property to modify the tint used for the stars. This is only visible in the `.graphical` and `.full` layout modes. 
```
ShapeProgressView(appId: "12345678", color: Color.green)
```
<img width="507" alt="image" src="https://github.com/ordinaryindustries/ReviewKit/assets/132616209/bf82ac32-1f8a-4b94-b3c7-96fbb53005d9">


If you have any questions reach out on Twitter [@OrdinaryInds](https://www.twitter.com/ordinaryinds)
