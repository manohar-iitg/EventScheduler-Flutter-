import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  DateTime _dateTime = DateTime.now();
  void _datepick() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  TimeOfDay _time = TimeOfDay.now();
  void _timePick() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _time = value!;
      });
    });
  }

  List<String> state = ['Work', 'Personal'];
  String dropdownValue = 'Work';
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Event"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 5, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.lightBlue),
                  )),
              controller: _textEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton(
              onPressed: _datepick,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent),
              child: const Text(
                "Choose Date",
                style: TextStyle(color: Colors.white),
              ),
              //color: Colors.lightBlueAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton(
              onPressed: _timePick,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent),
              child: const Text(
                "Choose Time",
                style: TextStyle(color: Colors.white),
              ),
              //color: Colors.lightBlueAccent,
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 50),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.lightBlueAccent,
                ),
                //color: Colors.lightBlueAccent,

                child: DropdownButton<String>(
                    dropdownColor: Colors.lightBlueAccent,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    value: dropdownValue,
                    items: state.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    }),
              )),
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                String date = _dateTime.day.toString();
                String month = _dateTime.month.toString();
                String year = _dateTime.year.toString();
                String hr = _time.hour.toString();
                String min = _time.minute.toString();
                String newtext = _textEditingController.text;
                List<String> _list2 = [
                  date,
                  month,
                  year,
                  newtext,
                  hr,
                  min,
                  dropdownValue
                ];
                Navigator.of(context).pop(_list2);
              },
              child: const Text(
                "ADD",
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            );
          }),
        ],
      ),
    );
  }
}
