import 'package:flutter/material.dart';

class CustomSearchBar extends SearchDelegate{
  List<String> allData=['Kozhikode','Kannur','Wayanad','Mapalappuram'];
  @override 
  List<Widget>buildActions(BuildContext context){
    return [
      IconButton(onPressed: () {
        query='';
      }, icon: Icon(Icons.clear_rounded))
    ];
    throw UnimplementedError();
  }
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery=[];
    for (var item in allData){
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
      var result=matchQuery[index];
      return ListTile(title: Text(result),);
    });
  }
  @override
  Widget buildResults(BuildContext context){
      List<String> matchQuery=[];
    for (var item in allData){
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
      var result=matchQuery[index];
      return ListTile(title: Text(result),);
    });
  }
  
}