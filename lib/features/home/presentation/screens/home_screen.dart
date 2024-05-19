import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/constants/color_constants.dart';
import 'package:flutter_clean_architecture/core/constants/size_constants.dart';
import 'package:flutter_clean_architecture/core/constants/string_constants.dart';
import 'package:flutter_clean_architecture/shared/widgets/shared_sizedbox.dart';
import '../../../../core/constants/style_constants.dart';
import '../../../../core/routes/route_names.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeCubit>(context);
    homeBloc.getHomeData();
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: ((context, state) {
          if (state is HomeLoaded) {
            return SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        state.homeData.title,
                        style: StyleConstants.ktsTitle,
                      ),
                      Text(
                        state.homeData.message,
                        style: StyleConstants.ktsSubTitleStyle,
                      ),
                      SharedSizedBox.height16,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.dashboard);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ColorConst.kcWhite,
                          backgroundColor: ColorConst.kcPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(SizeConstants.kdNumber16),
                          ),
                        ),
                        child: const Text(
                          StringConstants.ksChat,
                        ),
                      ),
                    ]),
              ),
            );
          } else if (state is HomeError) {
            return const Text('Error loading user data');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
