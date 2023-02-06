import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String groceryString = prefs.getString(key) ?? '';
    final List<Grocery> grocery = Grocery.decode(groceryString);
    return grocery;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedGrocery = Grocery.encode(value);
    await prefs.setString(key, encodedGrocery);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
