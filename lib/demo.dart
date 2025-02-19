import 'package:flutter/material.dart';
import 'package:flutter_demo/styled_body_text.dart';

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.brown[200],
            padding: const EdgeInsets.all(20),
            child: StyledBodyText(text: 'Welcome to Cafe'),
          ),

          const CoffeePrefs(),

          // Expanded widget fills the remaining space, hence contrains the child
          Expanded(
            child: Image.asset('assets/coffee.jpg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter
            ),
          )
        ],
      ),
    );
  }
}

class CoffeePrefs extends StatefulWidget {
  const CoffeePrefs({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}

class _CoffeePrefsState extends State<CoffeePrefs> {

  int strength = 1;
  int sugars = 1;

  void increaseStrength() {
    setState(() {
      strength = strength < 5 ? strength + 1 : 1;
    });
    debugPrint('inc strength by 1');
  }

  void increaseSugar() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
    debugPrint('inc sugar by 1');
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Text('Strength: '),
              //Text('$strength'),
          
              for (int i=0; i < strength; i ++)
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
          
              Spacer(),
          
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                ),
                onPressed: increaseStrength, 
                child: const Text('+'),
              ),
              // Image.asset('assets/img/coffee_bean.png',
              //   width: 25,
              //   height: 25,
              //   color: Colors.brown[100],
              //   colorBlendMode: BlendMode.multiply,
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              const Text('Sugars: '),
          
              if (sugars == 0)
                const Text('No sugars'),
          
              for (int i=0; i < sugars; i ++)
                Icon(
                  Icons.audiotrack,
                  color: Colors.pink,
                  size: 30.0,
                ),
          
              Spacer(),

              FilledButton(
                onPressed: increaseSugar, 
                child: const Text('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}