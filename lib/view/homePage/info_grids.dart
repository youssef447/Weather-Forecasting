part of 'home_screen.dart';

class InfoGrids extends StatelessWidget {
  final WeatherCubit cubit;
  final List<WeatherModule> forecastMod;
  final WeatherModule weatherMod;
  const InfoGrids(
      {super.key,
      required this.cubit,
      required this.weatherMod,
      required this.forecastMod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color:Colors.grey,
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 2.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Grids(
              icon: cubit.gridItem[index].iconData,
              title: cubit.gridItem[index].title,
              value: index == 0
                  ? weatherMod.getSys!.getSunrise!
                  : index == 1
                      ? weatherMod.getSys!.getSunset!
                      : index == 2
                          ? '${forecastMod[cubit.foreCastTapIndex].getWind!.speed!} m/s'
                          : index == 3
                              ? '${forecastMod[cubit.foreCastTapIndex].getMain!.getHumidity!} %'
                              : '${forecastMod[cubit.foreCastTapIndex].getMain!.getFeelsLike!}°c');
        },
        physics:
            //       const BouncingScrollPhysics(),
            const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
