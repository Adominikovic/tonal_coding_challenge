import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/metrics_cubit.dart';
import 'package:tonal_mobile_coding_challenge/presentation/constants/styles.dart';

// Our Metrics Widget is a simple widget that displays metrics data based on the
// the current state of our Metrics Cubit. It is very portable since all of our
// state management is handled externally by our Metrics Cubit.
class MetricsWidget extends StatefulWidget {
  @override
  _MetricsWidgetState createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {
  @override
  Widget build(BuildContext context) {
    // We use a stack to draw our circular display widget with the top layer being
    // our metrics data followed by our svg graph and finally our circular container.
    return Stack(
      alignment: Alignment.center,
      children: [
        // We use the provided styles.dart file to style our containers and text widgets.
        Container(
          width: bubbleDiameter.toDouble(),
          height: bubbleDiameter.toDouble(),
          decoration: bubbleBoxDecoration,
        ),
        Container(
          width: bubbleDiameter.toDouble(),
          height: bubbleDiameter.toDouble(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: SvgPicture.asset(
              'assets/images/graph.svg',
              // Since no color specification for the SVG graph was provided I used the
              // greenAccent preset since it matches the design image fairly closely
              color: Colors.greenAccent,
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          child: Center(
            // BlocBuilder allows us to dynamically rebuild our Metrics
            // widget whenever our Metrics Cubit state changes.
            child: BlocBuilder<MetricsCubit, MetricsState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Text(
                      state.label,
                      style: labelTextStyle,
                    ),
                    Text(
                      state.weight.toString(),
                      style: weightTextStyle,
                    ),
                    Text(
                      BlocProvider.of<MetricsCubit>(context).getUnitString(),
                      style: unitTextStyle,
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
