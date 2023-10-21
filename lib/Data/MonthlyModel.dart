import 'dart:convert';

MonthlyAdjusted monthlyAdjustedFromMap(String str) => MonthlyAdjusted.fromMap(json.decode(str));

String monthlyAdjustedToMap(MonthlyAdjusted data) => json.encode(data.toMap());

class MonthlyAdjusted {
  MetaData metaData;
  Map<String, MonthlyAdjustedTimeSery> monthlyAdjustedTimeSeries;

  MonthlyAdjusted({
    required this.metaData,
    required this.monthlyAdjustedTimeSeries,
  });

  factory MonthlyAdjusted.fromMap(Map<String, dynamic> json) => MonthlyAdjusted(
    metaData: MetaData.fromMap(json["Meta Data"]),
    monthlyAdjustedTimeSeries: Map.from(json["Monthly Adjusted Time Series"]).map((k, v) => MapEntry<String, MonthlyAdjustedTimeSery>(k, MonthlyAdjustedTimeSery.fromMap(v))),
  );

  Map<String, dynamic> toMap() => {
    "Meta Data": metaData.toMap(),
    "Monthly Adjusted Time Series": Map.from(monthlyAdjustedTimeSeries).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
  };
}

class MetaData {
  String the1Information;
  String the2Symbol;
  DateTime the3LastRefreshed;
  String the4TimeZone;

  MetaData({
    required this.the1Information,
    required this.the2Symbol,
    required this.the3LastRefreshed,
    required this.the4TimeZone,
  });

  factory MetaData.fromMap(Map<String, dynamic> json) => MetaData(
    the1Information: json["1. Information"],
    the2Symbol: json["2. Symbol"],
    the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
    the4TimeZone: json["4. Time Zone"],
  );

  Map<String, dynamic> toMap() => {
    "1. Information": the1Information,
    "2. Symbol": the2Symbol,
    "3. Last Refreshed": "${the3LastRefreshed.year.toString().padLeft(4, '0')}-${the3LastRefreshed.month.toString().padLeft(2, '0')}-${the3LastRefreshed.day.toString().padLeft(2, '0')}",
    "4. Time Zone": the4TimeZone,
  };
}

class MonthlyAdjustedTimeSery {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5AdjustedClose;
  String the6Volume;
  String the7DividendAmount;

  MonthlyAdjustedTimeSery({
    required this.the1Open,
    required this.the2High,
    required this.the3Low,
    required this.the4Close,
    required this.the5AdjustedClose,
    required this.the6Volume,
    required this.the7DividendAmount,
  });

  factory MonthlyAdjustedTimeSery.fromMap(Map<String, dynamic> json) => MonthlyAdjustedTimeSery(
    the1Open: json["1. open"],
    the2High: json["2. high"],
    the3Low: json["3. low"],
    the4Close: json["4. close"],
    the5AdjustedClose: json["5. adjusted close"],
    the6Volume: json["6. volume"],
    the7DividendAmount: json["7. dividend amount"],
  );

  Map<String, dynamic> toMap() => {
    "1. open": the1Open,
    "2. high": the2High,
    "3. low": the3Low,
    "4. close": the4Close,
    "5. adjusted close": the5AdjustedClose,
    "6. volume": the6Volume,
    "7. dividend amount": the7DividendAmount,
  };
}
