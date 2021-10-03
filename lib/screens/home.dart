import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    Object? homeValue = ModalRoute.of(context)!.settings.arguments;
    print(homeValue);
    Map homeValuee = homeValue as Map;
    return Scaffold( body:SafeArea(
      child: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              showSearch(context: context, delegate: SearchBar());
            },
            child: Text('Open Search'),
          ),
        ),
      ),
    ),);
  }

  @override
  void initState() {
    super.initState();


  }
}


class SearchBar extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){

      }, icon:Icon(Icons.search))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       color: Colors.red,
       borderRadius: BorderRadius.circular(10),
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Text(query);
  }

}
