![ReviewKitIcon](https://github.com/ordinaryindustries/ReviewKit/assets/132616209/418606fc-c7e7-4e8b-ab1c-a1f11a6327e3)
# ReviewKit

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
