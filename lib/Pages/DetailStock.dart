import 'package:flutter/material.dart';
import 'package:stock_app/Pages/HttpPage.dart';
class DetailStock extends StatefulWidget {
  DetailStock(this.sym,{super.key});
  String? sym;

  @override
  State<DetailStock> createState() => _DetailStockState();
}

class _DetailStockState extends State<DetailStock> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
