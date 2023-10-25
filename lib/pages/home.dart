import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newapp/models/category_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static List<CategoryModel> categories = [];

  static void _getCategories(){
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        searchBar(),
        const SizedBox(height: 2,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              child: Text("Foods", style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 3,),
            Container(
              height: 150,
              color: Colors.white.withAlpha(100),
              child: _categoriesSecton(),
            )
          ],
        )
      ],)
    );
  }

  ListView _categoriesSecton() {
    return ListView.separated(
              padding: const EdgeInsets.only(left: 10, right: 10),
              separatorBuilder: (context, index){
                  return const SizedBox(width: 10,);
                },
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (item, index){
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: categories[index].color.withOpacity(.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              categories[index].iconPath,
                            ),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        
                      ],
                    ),
                  );
                },
              );
  }

  Container searchBar() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom:20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 40,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            focusColor: Colors.blue,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.grey[800],
                    thickness: 0.2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset("assets/icons/Filter.svg"),
                  ),
                ],
                ),
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search a book",
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            )
          ),
        ),
      );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Collection Name",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[100],
        ),
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset(
        "assets/icons/Arrow - Left 2.svg",
        height: 20,
        width: 20,
        ),
      ),
      actions: [
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[100],
        ),
        margin: const EdgeInsets.all(10),
        width: 37,
        alignment: Alignment.center,
        child: SvgPicture.asset(
        "assets/icons/dots.svg",
        height: 5,
        width: 5,
        ),
      ),],
    );
  }
}
