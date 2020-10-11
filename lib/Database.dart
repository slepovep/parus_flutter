import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:parus_flutter/EventModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "EventsDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Event ("
          "id INTEGER PRIMARY KEY,"
          "clnevents_id INTEGER,"
          "event_stat TEXT,"
          "reg_date DateTime,"
          "change_date DateTime,"
          "event_descr TEXT"
          ")");
    });
  }

  newEvent(Event newEvent) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Event");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Event (id,first_name,last_name,blocked)"
        " VALUES (?,?,?,?)",
        [id, newEvent.clnevents_id, newEvent.event_stat, newEvent.reg_date, newEvent.change_date, newEvent.event_descr]);
    return raw;
  }

/*  blockOrUnblock(Event Event) async {
    final db = await database;
    Event blocked = Event(
        id: Event.id,
        firstName: Event.firstName,
        lastName: Event.lastName,
        blocked: !Event.blocked);
    var res = await db.update("Event", blocked.toMap(),
        where: "id = ?", whereArgs: [Event.id]);
    return res;
  }*/

  updateEvent(Event newEvent) async {
    final db = await database;
    var res = await db.update("Event", newEvent.toMap(),
        where: "id = ?", whereArgs: [newEvent.id]);
    return res;
  }

  getEvent(int id) async {
    final db = await database;
    var res = await db.query("Event", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Event.fromMap(res.first) : null;
  }
/*
  Future<List<Event>> getBlockedEvents() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Event WHERE blocked=1");
    var res = await db.query("Event", where: "blocked = ? ", whereArgs: [1]);

    List<Event> list =
        res.isNotEmpty ? res.map((c) => Event.fromMap(c)).toList() : [];
    return list;
  }
*/
  Future<List<Event>> getAllEvents() async {
    final db = await database;
    var res = await db.query("Event");
    List<Event> list =
        res.isNotEmpty ? res.map((c) => Event.fromMap(c)).toList() : [];
    return list;
  }

  deleteEvent(int id) async {
    final db = await database;
    return db.delete("Event", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Event");
  }
}
