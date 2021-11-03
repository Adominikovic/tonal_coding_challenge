import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/constants/units.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/metrics_cubit.dart';

// Here is our unit test group that tests the functionality of our MetricsCubit.
void main() {
  group('MetricsCubit', () {
    late MetricsCubit metricsCubit;

    setUp(() {
      metricsCubit = MetricsCubit();
    });

    tearDown(() {
      metricsCubit.close();
    });

    test(
        'The initial state of our metricsCubit is label: Muscle Group, weight: 0 and unit: Unit.lbs.',
        () {
      expect(metricsCubit.state, MetricsState('Muscle Group', 0, Unit.lbs));
    });

    blocTest(
      'The metricsCubit should return MetricsState(label: Core, weight: 50, unit: Unit.lbs) when updateMetrics("core", 50) is called.',
      build: () => metricsCubit,
      act: (cubit) => metricsCubit.updateMetrics('Core', 50),
      expect: () => [MetricsState('Core', 50, Unit.lbs)],
    );

    test(
        'The metricsCubit should return the string "lbs" when the getUnitString function is called.',
        () {
      expect(metricsCubit.getUnitString(), 'lbs');
    });
  });
}
