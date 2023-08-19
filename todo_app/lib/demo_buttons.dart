import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget{

  const DemoButtons({super.key});
  @override
  State<DemoButtons> createState() {
    return _DemoButtonState();
  }
}

var isUnderstood = false;

class _DemoButtonState extends State<DemoButtons>{
  @override
  Widget build(BuildContext context) {
    print('DemoButtons is Built');
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Every flutter developer should have a basic understanding of Flutter Internals!',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Do you understand how Flutter Updates UI?'),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    isUnderstood = true;
                  });
                }, child: const Text('Yes')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    isUnderstood = false;
                  });
                }, child: const Text('No'))
              ],
            ),
            const SizedBox(height: 10,),

             if(isUnderstood) const  Text('Awesome!')
          ],
        );
  }
}