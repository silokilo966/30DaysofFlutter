class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro Max",
        desc: "Apple iphone 12th Gen",
        price: 999,
        color: "#33505a",
        image:
            "https://www.gizmochina.com/wp-content/uploads/2019/09/Apple-iPhone-11-Pro-Max-1.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
