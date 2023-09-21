import 'package:flutter/material.dart';

class WeightConverter extends StatefulWidget {
  const WeightConverter({super.key});

  @override
  State<WeightConverter> createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  double input = 0.0;
  bool selectedValue = true;
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(
        color: Colors.white38,
      ),
      const Text(
        "Weight Converter",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      const Divider(
        color: Colors.white38,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
              value: true,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                  print(selectedValue);
                });
              }),
          const Text(
            "Gram",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Radio(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
              value: false,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                  print(selectedValue);
                });
              }),
          const Text(
            "Kilogram",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
      Container(
        // decoration: BoxDecoration(
        //   color: Colors.white24,
        //   borderRadius: BorderRadius.circular(20),
        // ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: TextField(
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            label: Text(
              'Enter the value in ${selectedValue == false ? "Kilogram" : "Gram"}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          onChanged: (value) {
            try {
              input = double.parse(value);
            } catch (e) {
              input = 0.0;
            }
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, elevation: 5),
        onPressed: () {
          setState(() {
            selectedValue == false
                ? result = input * 1000
                : result = input / 1000;
          });
        },
        child: const Text(
          "Calculate",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
        padding: const EdgeInsets.all(18),
        child: const Text(
          "The Result is: ",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      selectedValue == false
          ? Text(
              "${result.toStringAsFixed(3)} G",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            )
          : Text("${result.toStringAsFixed(3)} KG",
              style: const TextStyle(fontSize: 24, color: Colors.white)),
    ]);
  }
}
