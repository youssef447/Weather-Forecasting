import 'package:flutter/material.dart';

class Grids extends StatelessWidget {
  final IconData icon;
  final String title;
 final String value;
 const Grids(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color:  Color.fromARGB(255, 92, 70, 168),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 14, 2, 37),
              offset: Offset(0, 3),
              //spreadRadius: 6,
              blurRadius: 2)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Icon(Icons.cloud_outlined),
          Icon(
            icon,
            color: Colors.grey[400],
          ),

          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color.fromARGB(255, 232, 212, 212),
                fontFamily: 'Tara',
                fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color.fromARGB(255, 232, 212, 212),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
