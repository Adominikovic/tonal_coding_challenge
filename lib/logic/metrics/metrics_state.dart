part of 'metrics_cubit.dart';

//Our Metrics Cubit State file correspond to the data we want our metrics widget
// to display.
class MetricsState extends Equatable {
  final String label;
  final int weight;
  final Unit unit;

  MetricsState(this.label, this.weight, this.unit);

  @override
  List<Object> get props => [this.label, this.weight, this.unit];
}
