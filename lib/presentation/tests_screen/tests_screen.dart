import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/tests_bloc/tests_bloc.dart';
import 'package:hatching/presentation/drawing_screen/drawing_screen.dart';
import 'package:hatching/presentation/tests_screen/test_list.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:lottie/lottie.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  final TestsBloc bloc = TestsBloc();

  @override
  void initState() {
    bloc.add(TestsLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<TestsBloc, TestsState>(
        buildWhen: (previous, current) {
          if (current is TestsLoaded || current is TestsLoading) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state is TestsLoadedSingle) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DrawingScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TestsLoaded) {
            return TestList(items: state.tests);
          } else if (state is TestsLoading) {
            return Center(
              child: Lottie.asset(
                AppAnimations.loading,
                frameRate: FrameRate(60),
                repeat: true,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
