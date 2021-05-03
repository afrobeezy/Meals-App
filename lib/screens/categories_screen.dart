import 'package:flutter/material.dart';
import 'package:mealsapp/helpers/meals_today.dart';
import 'package:mealsapp/widgets/custom_circular_progress_indicator.dart';
import 'package:mealsapp/widgets/today_meals_item.dart';
import 'package:mealsapp/models/user_info_model.dart';
import 'package:hive/hive.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool _loading;
  var mealList;

  void getTodayMeals() async {
    MealsToday mealsToday = MealsToday();
    await mealsToday.getMealsToday();
    mealList = mealsToday.mealsToday;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getTodayMeals();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget get menuButton {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 3, width: 24, color: Theme.of(context).hoverColor),
          SizedBox(height: 3),
          Container(height: 3, width: 12, color: Theme.of(context).hoverColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Box<UserInfoModel> _userBox =
        Provider.of<Box<UserInfoModel>>(context);
    final UserInfoModel _userInfoModel = _userBox.values.first;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: menuButton,
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
        ),
        centerTitle: false,
        // actions: [
        //   Padding(
        //     padding:
        //         const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         image: DecorationImage(
        //           image: AssetImage(_userInfoModel.photoUrl),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       height: 40,
        //       width: 50,
        //     ),
        //   )
        // ],
        title: Text(
          '',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: new IconThemeData(color: Colors.red),
        elevation: 0.0,
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SafeArea(
        child: _loading
            ? Center(child: CustomCircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: RichText(
                              text: TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).hoverColor),
                                children: [
                                  TextSpan(
                                    text: _userInfoModel.fname,
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).hoverColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Text(
                              'What would you like to cook today ?',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).hoverColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Text(
                              'Today\'s recipe',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).hoverColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 230,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          padding: const EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 3 / 2.2,
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: mealList != null ? mealList.length : 0,
                          itemBuilder: (context, index) {
                            return TodayMealsItem(
                              imageUrl: mealList[index].imageUrl ?? "",
                              title: mealList[index].title ?? "",
                              complexity: mealList[index].complexity ?? "",
                              step1: mealList[index].step1 ?? "",
                              step2: mealList[index].step2 ?? "",
                              step3: mealList[index].step3 ?? "",
                              step4: mealList[index].step4 ?? "",
                              step5: mealList[index].step5 ?? "",
                              item1: mealList[index].item1 ?? "",
                              item2: mealList[index].item2 ?? "",
                              item3: mealList[index].item3 ?? "",
                              item4: mealList[index].item4 ?? "",
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).hoverColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 935,
                        child: ListView(
                          padding: const EdgeInsets.all(20),
                          physics: NeverScrollableScrollPhysics(),
                          children: DUMMY_CATEGORIES
                              .map(
                                (catData) => CategoryItem(
                                  catData.id,
                                  catData.title,
                                  catData.color,
                                  catData.imageURL,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(16.0),
      //     ),
      //   ),
      //   splashColor: Colors.transparent,
      //   hoverColor: Colors.transparent,
      //   elevation: 0,
      //   child: Icon(FlutterIcons.sliders_fea),
      //   backgroundColor: Theme.of(context).focusColor,
      //   onPressed: () {},
      // ),
    );
  }
}
