import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/drawing_bloc/drawing_cubit.dart';
import 'package:hatching/core/logger/logger.dart';
import 'package:hatching/presentation/analytics_screen/quick_analytics_screen.dart';

import 'deawing_canvas.dart';
import 'drawing_buttons_row.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  final bloc = DrawingCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: WillPopScope(
        onWillPop: () async =>
            bloc.state is DrawingEnded || bloc.state is DrawingCanceled,
        child: BlocListener<DrawingCubit, DrawingState>(
          listener: _blocListener,
          child: SafeArea(
              child: Stack(
            children: [
              Container(color: Colors.white, child: const DrawingCanvas()),
              _buildBottomButtons()
            ],
          )),
        ),
      ),
    );
  }

  Align _buildBottomButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child:
            BlocBuilder<DrawingCubit, DrawingState>(builder: (context, state) {
          return DrawingButtonsRow(
            canExit: state is DrawingEnded,
            onConfirm: () =>
                BlocProvider.of<DrawingCubit>(context).confirmTest(),
            onCancel: () => BlocProvider.of<DrawingCubit>(context).cancelTest(),
            onRestart: () =>
                BlocProvider.of<DrawingCubit>(context).restartTest(),
          );
        }),
      ),
    );
  }

  void _blocListener(context, DrawingState state) {
    if (state is DrawingFailure) {
      Logger.m(state.reason);
    } else if (state is DrawingConfirmed) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        builder: (context) => QuickAnalyticsDecorator(
          child: QuickAnalyticsWidget(
            analytics: state.item,
          ),
        ),
      );
    } else if (state is DrawingCanceled) {
      Navigator.maybePop(context);
    }
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
