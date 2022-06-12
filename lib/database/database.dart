//Imports that are necessary to the code generator of floor
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:meb_application/database/typeConverters/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'package:meb_application/database/daos/todrinkDao.dart';
import 'package:meb_application/database/entities/todrink.dart';
import 'package:meb_application/database/daos/towalkDao.dart';
import 'package:meb_application/database/entities/towalk.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Meal.
//We also added a TypeConverter to manage the DateTime of a Meal entry, since DateTimes are not natively
//supported by Floor.
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Drink, Walk])
abstract class ApPlantDatabase extends FloorDatabase {
  //Add all the daos as getters here
  DrinkDao get drinkDao;
  WalkDao get walkDao;
}//AppDatabase