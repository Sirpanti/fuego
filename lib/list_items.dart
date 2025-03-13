void main() {
  List<String> shoppingList = ['Plantains', 'Strawberries', 'Mangos'];

  print('Shopping List: $shoppingList');

  shoppingList.add('Grapes');
  print('Adding Grapes: $shoppingList');

  shoppingList.addAll(['Milk', 'Bread']);
  print('Adding Milk and Bread: $shoppingList');

  shoppingList.remove('Strawberries');
  print('Removing Strawberries: $shoppingList');

  shoppingList.removeAt(2);
  print('Removing item at 2: $shoppingList');

  shoppingList.removeLast();
  print('Removing last item: $shoppingList');

  String item = 'Milk';
  if (shoppingList.contains(item)) {
    print('$item is in the shopping list');
  } else {
    print('$item is not in the shopping list');
  }
}
