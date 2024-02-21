import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../core/defaultFormField.dart';
import '../view-model/Cubits/WeatherCubit.dart';
import '../view-model/Cubits/WeatherStates.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: ((context, state) {
       // var cubit = WeatherCubit.get(context);
//        cubit.getCurrentWeatherData();
        return Scaffold(
          //drawer: ,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff131730),
                    Color(0xff3b296b),
                    Color(0xff3b296b),
                    Color(0xff131730),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: state is GetDataLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.arrow_back_ios),
                                ),
                                Text(
                                  'Weather',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: DefaultFormField(
                              context: context,
                              controller: controller,
                              filled: true,
                              radius: 25,
                              hintText: "search",
                              prefixWidget: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          //lenght==0?
                     /*      Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LottieBuilder.asset(
                                    'assets/anims/world-map.json',frameRate: FrameRate.max,),
                                Text(
                                  'check weather around the world',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Tara'),
                                ),
                              ],
                            ),
                          ), */
                           Expanded(
                             child: SelectState(
                                         // style: TextStyle(color: Colors.red),
                                         onCountryChanged: (value) {
                                         setState(() {
                                         //  countryValue = value;
                                                     print(value);
                           
                                         });
                                       },
                                       onStateChanged:(value) {
                                         setState(() {
                                          // stateValue = value;
                             print(value);
                           
                                         });
                                       },
                                        onCityChanged:(value) {
                                         setState(() {
                                       //  ظظ  cityValue = value;
                                       print(value);
                                         });
                                       },
                                                     // :
                           
                                                     /*  Expanded(
                                                   child: ListView.separated(
                                  //shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return WeatherCard(
                                        module: cubit.weatherModule!);
                                  },
                                ),
                                                 ),  */
                                                 ),
                           ),],
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }
}
