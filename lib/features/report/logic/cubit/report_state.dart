import '../../data/model/report_model.dart';

class ReportsState {
  final List<Report> reports;
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  ReportsState({
    this.reports = const [],
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  ReportsState copyWith({
    List<Report>? reports,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return ReportsState(
      reports: reports ?? this.reports,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
