import 'package:flutter/material.dart';
import 'package:parus_flutter/EventModel.dart';
import 'package:parus_flutter/Database.dart';
import 'dart:math' as math;
import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';

/// This is the main application widget.
class EventsListPage extends StatelessWidget {
  const EventsListPage({Key key}) : super(key: key);
  static const String _title = 'Журнал событий';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(pageTitle: _title, body: ListEventsWidget());
  }
}

/// This is the stateless widget that the main application instantiates.
class ListEventsWidget extends StatelessWidget {
  ListEventsWidget({Key key}) : super(key: key);
  bool sort;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const <DataColumn>[
      DataColumn(
        label: Text(
          '№',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Статус',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Дата изменения',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Описание',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    ], rows: const <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Новый')),
          DataCell(Text('10.10.2020')),
          DataCell(Text('Описание события')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('2')),
          DataCell(Text('Ответ предоставлен')),
          DataCell(Text('11.10.2020')),
          DataCell(Text('Описание события №2')),
        ],
      ),
    ]);
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Event>>(
          future: DBProvider.db.getAllEvents(),
          builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Event item = snapshot.data[index];
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //Event rnd = testEvents[math.Random().nextInt(testEvents.length)];
          //await DBProvider.db.newEvent(rnd);
          //setState(() {});
        },
      ),
    );
  }
}
*/

/*
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
*/
