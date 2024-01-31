import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:velbis_labact2/models/product.dart';
import 'package:velbis_labact2/providers/productprovider.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen({super.key, this.index});

  final int? index;

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();
  List<Product> cartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context, listen: false);
    if (widget.index != null) {
      var product = provider.item(widget.index!);
      codeController.text = product.code;
      nameController.text = product.nameDesc;
      priceController.text = product.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            TextField(
              controller: codeController,
              readOnly: widget.index != null,
              decoration: InputDecoration(
                label: Text('Code'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name/Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(8),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(8),
            ElevatedButton(
              onPressed: () {
                var product = Product(
                  code: codeController.text,
                  nameDesc: nameController.text,
                  price: double.parse(priceController.text),
                );
                if (widget.index == null) {
                  provider.add(product);
                } else {
                  provider.edit(product, widget.index!);
                }
                Navigator.of(context).pop();
              },
              child: Text(widget.index == null ? 'ADD' : 'EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
