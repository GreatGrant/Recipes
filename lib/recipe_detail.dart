import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class RecipeDetail extends StatefulWidget{
  final Recipe recipe;

  const RecipeDetail({
  Key? key,
    required this.recipe
  }): super(key: key);

  @override
  State<RecipeDetail>createState() {
    return _RecipeDetailState();
  }

}
class _RecipeDetailState extends State<RecipeDetail>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        // Todo() change container
        child: Container(),
      ),
    );
  }
}