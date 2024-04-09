import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../widgets/appbar.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlControls = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _Isinit = true;

  var _editedProduct =
      Product(id: '', title: '', description: '', price: 0, imageurl: '');

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlControls.dispose();
    super.dispose();
  }

  var initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  @override
  void didChangeDependencies() {
    if (_Isinit) {
      final productID = ModalRoute.of(context)!.settings.arguments as String;
     
      _editedProduct = Provider.of<Products>(context).findbyID(productID);
      
      initValues['title'] = _editedProduct.title;
      initValues['description'] = _editedProduct.description;
      initValues['price'] = _editedProduct.price.toString();
      initValues['title'] = _editedProduct.title;
      _imageUrlControls.text = _editedProduct.imageurl;
    }

    _Isinit = false;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    //= ModalRoute.of(context)!.settings.arguments as String;
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlControls.text.isEmpty) return;

      if (!_imageUrlControls.text.startsWith('http') &&
          !_imageUrlControls.text.startsWith('https')) {
        return;
      }
      if (!_imageUrlControls.text.endsWith('.png') &&
          !_imageUrlControls.text.endsWith('.jpg')) {
        return;
      }

      setState(() {});
    }
  }

  void _saveForm() {
    final lIsValidated = _form.currentState!.validate();
    if (!lIsValidated) {
      return;
    } else {
      if (lIsValidated) _form.currentState!.save();
      if (_editedProduct.id == '') {
        Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } else {
        Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct);
      }

      Navigator.of(context).pop();
    }

    print(_editedProduct.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(clContext: context, clTitle: 'Edit Product', clActions: [
        IconButton(onPressed: _saveForm, icon: Icon(Icons.save))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: initValues['title'],
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please Provide a Value';
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (newValue) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: newValue.toString(),
                        description: _editedProduct.description,
                        price: _editedProduct.price,
                        imageurl: _editedProduct.imageurl);
                  },
                ),
                TextFormField(
                  initialValue: initValues['price'],
                  decoration: const InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a price';
                    if (double.parse(value!) <= 0)
                      return 'Please enter a price';
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (newValue) => _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(newValue!),
                      imageurl: _editedProduct.imageurl),
                ),
                TextFormField(
                  initialValue: initValues['description'],
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a Description';
                  },
                  onSaved: (newValue) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: _editedProduct.title,
                        description: newValue.toString(),
                        price: _editedProduct.price,
                        imageurl: _editedProduct.imageurl);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 8, left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: _imageUrlControls.text.isEmpty
                            ? Text('Enter Url')
                            : Image.network(_imageUrlControls.text,
                                fit: BoxFit.cover)),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Image url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlControls,
                        focusNode: _imageUrlFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please';
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter a valid URL..';
                          }
                          if (!value.endsWith('.png') &&
                              !value.endsWith('.jpg')) {
                            return 'Please enter a valid URL..';
                          }
                        },
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                        onSaved: (newValue) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              price: _editedProduct.price,
                              imageurl: newValue.toString());
                        },
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
