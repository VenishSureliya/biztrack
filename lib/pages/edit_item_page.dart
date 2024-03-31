import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: EditItemPage(),
    );
  }
}

class EditItemPage extends StatefulWidget {
  const EditItemPage({Key? key}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  String? _selectedCategory; // Default selected category
  List<String> _categories = ['Category 1', 'Category 2', 'Category 3']; // Dropdown items

  String? _selectedUnit ; // Default selected unit
  List<String> _units = ['Unit 1', 'Unit 2', 'Unit 3']; // Dropdown items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Item',
              style: TextStyle(color: Color(0xFF006BE9), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Edit an existing item in your inventory',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _itemNameController,
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  items: _categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Pick Category',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  onChanged: (value) {
                    setState(() {
                      _selectedUnit = value!;
                    });
                  },
                  items: _units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Add Custom Unit',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality to handle edit button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF006BE9)),
                    ),
                    child: Text('Edit Item', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality to handle delete button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text('Delete Item', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Add functionality for home button
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add functionality for search button
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                // Add functionality for add button
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add functionality for notifications button
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Add functionality for profile button
              },
            ),
          ],
        ),
      ),
    );
  }
}
