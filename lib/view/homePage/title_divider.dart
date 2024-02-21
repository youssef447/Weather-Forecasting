part of 'home_screen.dart';


class TitleDivider  extends StatelessWidget {
  const TitleDivider ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
                                              '5 Days / 3 Hours forecast',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
   
                                        Container(
                                          margin:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 102, 97, 120),
                                                //spreadRadius: 2,
                                                blurRadius: 7,
                                                //
                                              ),
                                            ],
                                          ),
                                          child: const Divider(
                                            thickness: 2,
                                            color: Color(0xffffffff),
                                          ),
                                        ),]);

  }
  
}