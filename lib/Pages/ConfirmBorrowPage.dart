import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techtrack/Pages/ItemPage.dart';

class ConfirmBorrowPage extends StatefulWidget {
  final String serial_id;
  final String model_no;
  final String status;
  final String brand;
  final String category;
  final String price;
  final String image;
  const ConfirmBorrowPage(
      {super.key,
      required this.serial_id,
      required this.model_no,
      required this.status,
      required this.brand,
      required this.category,
      required this.price,
      required this.image});

  @override
  State<ConfirmBorrowPage> createState() => _ConfirmBorrowPageState();
}

class _ConfirmBorrowPageState extends State<ConfirmBorrowPage> {
  final idNumberController = TextEditingController();

  final nameController = TextEditingController();

  final departmentController = TextEditingController();

  final typeController = TextEditingController();

  final categoryController = TextEditingController();

  final modelNoController = TextEditingController();

  final serialIdController = TextEditingController();

  final statusController = TextEditingController();

  final brandController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    brandController.text = widget.brand;
    statusController.text = widget.status;
    modelNoController.text = widget.model_no;
    serialIdController.text = widget.serial_id;
    categoryController.text = widget.category;
    imageController.text = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Confirm Borrow',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: idNumberController,
                decoration: const InputDecoration(labelText: 'ID Number'),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: departmentController,
                decoration: const InputDecoration(labelText: 'Department'),
              ),
              TextFormField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: modelNoController,
                decoration: const InputDecoration(labelText: 'Model No'),
              ),
              TextFormField(
                controller: serialIdController,
                decoration: const InputDecoration(labelText: 'Serial Id'),
              ),
              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              TextFormField(
                controller: statusController,
                decoration: const InputDecoration(labelText: 'Status'),
              ),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(labelText: 'Product Image'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 10),
        child: ElevatedButton(
          onPressed: () async {
            CollectionReference collRef =
                FirebaseFirestore.instance.collection('ConfirmedBorrow');
            await collRef.add({
              'id_number': idNumberController.text,
              'name': nameController.text,
              'department': departmentController.text,
              'type': typeController.text,
              'category': categoryController.text,
              'model_no': modelNoController.text,
              'serial_id': serialIdController.text,
              'brand': brandController.text,
              'status': statusController.text,
              'image_url': imageController.text
            });
            // Clear text fields after submitting
            idNumberController.clear();
            nameController.clear();
            departmentController.clear();
            typeController.clear();
            categoryController.clear();
            modelNoController.clear();
            serialIdController.clear();
            brandController.clear();
            statusController.clear();
            imageController.clear();

            // Show a snackbar to indicate that the issue has been raised
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.amber,
                content: Text('Confirmed Borrow'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ItemsPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the background color to blue
          ),
          child: const Text(
            'Confirm Borrow',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
