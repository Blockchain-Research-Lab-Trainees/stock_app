import 'dart:convert';

List<Stock> stockFromMap(String str) => List<Stock>.from(json.decode(str).map((x) => Stock.fromMap(x)));

String stockToMap(List<Stock> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Stock {
  String? symbol;
  String? identifier;
  double? open;
  double? dayHigh;
  double? dayLow;
  double? lastPrice;
  double? previousClose;
  double? change;
  double? pChange;
  double? yearHigh;
  double? yearLow;
  int? totalTradedVolume;
  double? totalTradedValue;
  String? lastUpdateTime;
  dynamic perChange365D;
  double? perChange30D;

  Stock({
    this.symbol,
    this.identifier,
    this.open,
    this.dayHigh,
    this.dayLow,
    this.lastPrice,
    this.previousClose,
    this.change,
    this.pChange,
    this.yearHigh,
    this.yearLow,
    this.totalTradedVolume,
    this.totalTradedValue,
    this.lastUpdateTime,
    this.perChange365D,
    this.perChange30D,
  });

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
    symbol: json["symbol"],
    identifier: json["identifier"],
    open: json["open"].toDouble(),
    dayHigh: json["dayHigh"].toDouble(),
    dayLow: json["dayLow"].toDouble(),
    lastPrice: json["lastPrice"].toDouble(),
    previousClose: json["previousClose"].toDouble(),
    change: json["change"].toDouble(),
    pChange: json["pChange"].toDouble(),
    yearHigh: json["yearHigh"].toDouble(),
    yearLow: json["yearLow"].toDouble(),
    totalTradedVolume: json["totalTradedVolume"],
    totalTradedValue: json["totalTradedValue"].toDouble(),
    lastUpdateTime: json["lastUpdateTime"],
    perChange365D: json["perChange365d"],
    perChange30D: json["perChange30d"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "symbol": symbol,
    "identifier": identifier,
    "open": open,
    "dayHigh": dayHigh,
    "dayLow": dayLow,
    "lastPrice": lastPrice,
    "previousClose": previousClose,
    "change": change,
    "pChange": pChange,
    "yearHigh": yearHigh,
    "yearLow": yearLow,
    "totalTradedVolume": totalTradedVolume,
    "totalTradedValue": totalTradedValue,
    "lastUpdateTime": lastUpdateTime,
    "perChange365d": perChange365D,
    "perChange30d": perChange30D,
  };
}
