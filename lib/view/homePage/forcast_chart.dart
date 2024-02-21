part of 'home_screen.dart';

class ForecastChart extends StatelessWidget {
  final List<WeatherModule> forecastMod;
  final WeatherCubit cubit;

  const ForecastChart({
    super.key,
    required this.forecastMod,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.separated(
          //  padding: const EdgeInsets.symmetric(
          //    vertical: 10, horizontal: 15),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.selectForeCast(index);
                    },
                    child: ForcastContainer(
                      color: cubit.foreCastTapIndex == index
                          ? const Color(0xff48319d)
                          : const Color(0xff3c2e73),
                      module: forecastMod[index],
                    ),
                  ),
                ),
                Text(
                  forecastMod[index].weekDay,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, fontFamily: 'Tara'),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: forecastMod.length),
    );
  }
}
