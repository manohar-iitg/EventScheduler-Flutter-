import 'package:event_2/event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _listev = [];
  final List<String> _listdt = [];
  final List<String> _listtm = [];
  final List<String> _listhd = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text(
            "EVENT SCHEDULER",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        //backgroundColor: Colors.lightBlueAccent[500],
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: _listev.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: ListTile(
                      title: Text(
                        _listev[index],
                        style: const TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      subtitle: Text(
                        '${_listdt[index]} @ ${_listtm[index]}\n${_listhd[index]}',
                        style: const TextStyle(color: Colors.black54, fontSize: 17),
                      ),
                      isThreeLine: true,
                      leading: const Icon(
                        Icons.calendar_month_rounded,
                        size: 45,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _listev.removeAt(index);
                            _listtm.removeAt(index);
                            _listdt.removeAt(index);
                            _listhd.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              List<String> _list2 = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Events()));
              setState(() {
                String ev = _list2[3];
                String dt = _list2[0];
                String mt = _list2[1];
                String yr = _list2[2];
                String hr = _list2[4];
                String min = _list2[5];
                _listev.add(ev);
                _listdt.add('$dt-$mt-$yr');
                _listtm.add('$hr:$min');
                _listhd.add(_list2[6]);
              });
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.blueAccent,
          );
        }),
      ),
    );
  }
}
