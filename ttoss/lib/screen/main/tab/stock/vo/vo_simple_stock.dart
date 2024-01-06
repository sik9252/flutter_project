class SimpleStock {
  final String stockName;

  SimpleStock(this.stockName);

  // json object를 통해 Json 객체를 새로 생성하는 것이기 때문에 factory가 필요
  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json["name"]);
  }

  @override
  String toString() {
    return stockName;
  }
}