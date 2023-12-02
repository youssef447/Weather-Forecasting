/* import 'package:flutter/material.dart';
import 'package:weatherapp/controller/Cubits/WeatherCubit.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BottomAppBarTabItem({required int index, required IconData icon}) {
    var cubit = WeatherCubit.get(context);

    return InkWell(
      //to remove onTab Grey Color
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        cubit.changeNavIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
                data: IconThemeData(
                    color: index == cubit.currentNavIndex
                        ? defaultColor
                        : Colors.grey),
                child: Icon(icon)),
            Text(
              cubit.titles[index],
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
    return const Placeholder();
  }
} */