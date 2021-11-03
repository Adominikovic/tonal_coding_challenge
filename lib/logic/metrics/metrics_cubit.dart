import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/constants/units.dart';

part 'metrics_state.dart';

class MetricsCubit extends Cubit<MetricsState> {
  // We set the initial state of our Cubit's label, weight and unit parameters
  // to 'Muscle Group, 0, and lbs respectively.
  MetricsCubit() : super(MetricsState('Muscle Group', 0, Unit.lbs));

  // Our updateMetrics function is the mechanism by which we update our state
  // based on user form input. Note that per specification our unit is always lbs.
  void updateMetrics(String label, int weight) {
    emit(MetricsState(label, weight, state.unit));
  }

  String getUnitString() {
    if (state.unit == Unit.lbs) {
      return 'lbs';
    } else if (state.unit == Unit.kg) {
      return 'kg';
    } else if (state.unit == Unit.st) {
      return 'st';
    }
    return 'error';
  }
}
