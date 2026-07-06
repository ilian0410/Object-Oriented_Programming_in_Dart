class Rectangle {
  int width;
  int height;

  Rectangle(this.width, this.height);

  void setSize(int newWidth, int newHeight) {
    width = newWidth;
    height = newHeight;
  }

  int calculateArea() {
    return width * height;
  }

  void printInfo() {
    print('Rectangle: $width x $height');
    print('Area: ${calculateArea()}');
  }
}

void main() {
  var rect = Rectangle(5, 3);
  rect.printInfo();
}
