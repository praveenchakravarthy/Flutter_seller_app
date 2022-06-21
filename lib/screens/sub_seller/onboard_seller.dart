import 'package:flutter/material.dart';

class OnboardSeller extends StatefulWidget {
  const OnboardSeller({Key? key}) : super(key: key);

  @override
  State<OnboardSeller> createState() => _OnboardSellerState();
}

class _OnboardSellerState extends State<OnboardSeller> {

  String genderType = 'Male';
  String clientType = 'Readyassist';
  String? _selectedState;
  String _selectedDistrict = 'KanyaKumari';
  final fieldTextEditingController = TextEditingController();

  // This list holds all the suggestions
  final List<String> _suggestions = [
    'TamilNadu',
    'Kerala',
    'Karnataka',
    'Maharastra',
    'Delhi',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
        ),
        title: const Text('Onboard Seller'),
      ),
      body: sellerForm(),
    );
  }

  Widget sellerForm(){
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Personal Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.05),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                      Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                      Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 50,
                child: DropdownButtonFormField(
                  value: genderType,
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  elevation: 2,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      genderType = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female', 'Transgender']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter valid Mobile Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Mobile No',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextButton(
                  onPressed: () => Navigator.pop(context, 'Yes'),
                  child: const Text(
                    'Send Otp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'O T P',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextButton(
                  onPressed: () => Navigator.pop(context, 'Yes'),
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter valid Mobile Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Alternative Mobile No',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 50,
                child: DropdownButtonFormField(
                  value: clientType,
                  icon: Visibility(
                    visible: false,
                    child: Icon(Icons.arrow_drop_down_circle_outlined),
                  ),
                  elevation: 2,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      clientType = newValue!;
                    });
                  },
                  items: <String>['Readyassist']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty
                    if (value.text.isEmpty) {
                      return [];
                    }

                    // The logic to find out which ones should appear
                    return _suggestions.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    fieldTextEditingController.text = 'TamilNadu';
                    return TextFormField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        isDense: true,
                      ),
                    );
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedState = value;
                    });
                  },
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 50,
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty
                    if (value.text.isEmpty) {
                      return [];
                    }

                    // The logic to find out which ones should appear
                    return _suggestions.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    fieldTextEditingController.text = _selectedDistrict;
                    return TextFormField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        isDense: true,
                      ),
                    );
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedDistrict = value;
                    });
                  },
                ),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: false,
            keyboardType: TextInputType.text,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Location';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
              isDense: true,
              hintText: 'Location',
              suffixIcon: IconButton(
                icon: Icon(Icons.my_location_outlined),
                color: Colors.blue,
                onPressed: () {
                  // _sendOtp();
                },
              ),
              hintStyle: TextStyle(fontSize: 14),
              counterText: "",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Aadhaar';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Aadhaar',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                  Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                  Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Pan';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Pan',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                  Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
              VerticalDivider(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  color: Colors.blueGrey[200],
                  child:
                  Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Bank Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.05),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter valid Bank Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Bank Name',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter valid Ifsc code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Ifsc Code',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: false,
            keyboardType: TextInputType.text,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Bank A/c number';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
              isDense: true,
              hintText: 'Account Number',
              hintStyle: TextStyle(fontSize: 14),
              counterText: "",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: false,
            keyboardType: TextInputType.text,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Bank A/c number';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
              isDense: true,
              hintText: 'Re-Enter Number',
              hintStyle: TextStyle(fontSize: 14),
              counterText: "",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return 'Please enter Account Holder name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    hintText: 'Account Holder Name',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: "",
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.0), //or 15.0
                  child: Container(
                    height: 40.0,
                    width: 60.0,
                    color: Colors.blueGrey[200],
                    child:
                    Icon(Icons.upload_file, color: Colors.white, size: 30.0),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: ElevatedButton(
                  onPressed: () => {
                  },
                  child:const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[900],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    );
  }

}