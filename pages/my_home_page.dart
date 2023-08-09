import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.moneyValue});
  int moneyValue;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    // List<int> numbers = List.generate(9, (index) => index++);
    List<String> numbers = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0",
      "00",
      "-1"
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        title: const Text("Add money"),
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(height: size.height*0.1),
            const Text(
              "EGP",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
            Text(
              widget.moneyValue.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            ),
             SizedBox(height: size.height*0.1),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 13,
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color.fromARGB(255, 209, 98, 196),
                fixedSize: const Size(370, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Add EGP ${widget.moneyValue}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                itemCount: numbers.length,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  mainAxisExtent: size.height*0.1,
                  crossAxisCount: 3,
                  // crossAxisSpacing: 12,
                  //  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return numbers[index] == "-1"
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              print(widget.moneyValue);
                              if (widget.moneyValue < 10) {
                                widget.moneyValue = 0;
                                return;
                              }
                              widget.moneyValue = int.parse(widget.moneyValue
                                  .toString()
                                  .substring(0,
                                      widget.moneyValue.toString().length - 1));
                            });
                          },
                          icon: const Icon(
                            Icons.backspace,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              print(widget.moneyValue);
                              widget.moneyValue = int.parse(
                                  "${widget.moneyValue}${numbers[index]}");
                            });
                          },
                          icon: Text(
                            numbers[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
