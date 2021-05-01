import 'dart:io';
import 'package:intl/intl.dart';
import 'package:mealsapp/models/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealsapp/widgets/custom_textfield_container.dart';
import 'package:provider/provider.dart';

class SetupUserProfile extends StatefulWidget {
  static const routeName = '/setup-profile';

  @override
  _SetupUserProfileState createState() => _SetupUserProfileState();
}

class _SetupUserProfileState extends State<SetupUserProfile> {
  final firestoreInstance = FirebaseFirestore.instance;
  File _image;
  DateTime selectedDate = DateTime.now();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final tnumber = TextEditingController();
  final dob = TextEditingController();
  final ccode = TextEditingController();

  void _saveUserInfoToHive(Box<UserInfoModel> _userInfobox) {
    final UserInfoModel userInfoModel = UserInfoModel(
      fname: fname.text,
      lname: lname.text,
      photoUrl: _image.path,
      tnumber: tnumber.text,
      ccode: ccode.text,
      dob: selectedDate,
    );
    print('Saving User Info ${userInfoModel.fname}');
    _userInfobox.add(userInfoModel);
  }

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    tnumber.dispose();
    dob.dispose();
    ccode.dispose();
    super.dispose();
  }

  //Select image from camera
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  //Select image from gallery
  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _selectDate(context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.dark(
              primary: Colors.grey[800],
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
              secondary: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text(
                      'Photo Library',
                      style: TextStyle(
                          fontFamily: 'RaleWay',
                          color: Theme.of(context).focusColor),
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text(
                    'Camera',
                    style: TextStyle(
                        fontFamily: 'RaleWay',
                        color: Theme.of(context).focusColor),
                  ),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Box<UserInfoModel> _userInfoBox =
        Provider.of<Box<UserInfoModel>>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set up your account',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).hintColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context).focusColor,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //First Name
                CustomTextFieldContainer(
                  title: 'First Name',
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: fname,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).focusColor,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), //margin
                //Last Name
                CustomTextFieldContainer(
                  title: 'Last Name',
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: lname,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).focusColor,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), //margin
                //Telephone Number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Telephone Number',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).hintColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: tnumber,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).focusColor),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: CountryCodePicker(
                                //flutter package on pub.dev
                                onChanged: (country) {
                                  ccode.text = country.code;
                                },
                                initialSelection: 'GH',
                                favorite: ['+233', 'GH'],
                                showCountryOnly: true,
                                showOnlyCountryWhenClosed: false,
                                showFlag: true,
                                flagWidth: 25,
                                alignLeft: false,
                                dialogSize: Size(500, 400),
                                boxDecoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context).primaryColor,
                                ),
                                showDropDownButton: true,
                                closeIcon: Icon(
                                  Icons.close,
                                  color: Theme.of(context).focusColor,
                                ),
                                dialogTextStyle: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Theme.of(context).focusColor),
                                dialogBackgroundColor:
                                    Theme.of(context).focusColor,
                                hideSearch: true,
                                textStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    color: Theme.of(context).focusColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10), //margin
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'D.O.B',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  child: Text(
                                    'Select Date',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).focusColor,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 20,
                                        bottom: 20,
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).hintColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          //alert users to fill every field
                          _saveUserInfoToHive(_userInfoBox);
                          firestoreInstance.collection("users").add({
                            "fname": fname.text,
                            "lname": lname.text,
                            "dob": selectedDate,
                            "telephone": {
                              "ccode": ccode.text,
                              "tnumber": tnumber.text
                            }
                          }).then((value) {
                            print(value.id);
                          });
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 20,
                              bottom: 20,
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
