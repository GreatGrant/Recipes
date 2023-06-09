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
  int _sliderval = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
                widget.recipe.label,
              style: const TextStyle(fontSize: 18)
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index){
                  final ingredient = widget.recipe.ingredients[index];
                  // TODO: Add ingredient.quantity
                  return Text(
                      '${ingredient.quantity * _sliderval} ${ingredient.measure} ${ingredient.name}'
                          );
                  }
              ),
            ),
            Slider(
              min: 1,
                max: 10,
                divisions: 9,
                label: '${_sliderval * widget.recipe.servings} servings',
                value: _sliderval.toDouble(),
                onChanged: (newValue){
                setState(() {
                  _sliderval = newValue.round();
                });
            },
            activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}