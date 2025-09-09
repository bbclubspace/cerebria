import 'dart:ui';

import 'package:bloc/bloc.dart';
import '../../data/services/report_services.dart';
import 'report_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final ReportServices _reportServices;

  ReportsCubit(this._reportServices) : super(ReportsState());

  // ileride veritabanı işlemler eklenecek
  void loadReports() {
    try {
      final reports = _reportServices.getReports();
      emit(state.copyWith(reports: reports, isSuccess: true, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isSuccess: false, error: e.toString()));
    }
  }

  void addReport(String title, DateTime date, List<Color> colors) {
    try {
      _reportServices.addReport(title, date, colors);
      final updatedReports = _reportServices.getReports();
      emit(state.copyWith(reports: updatedReports, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSuccess: false, error: e.toString()));
    }
  }
}
