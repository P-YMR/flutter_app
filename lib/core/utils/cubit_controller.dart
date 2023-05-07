import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class CubitController<T extends CubitState> extends Cubit<T> {
  CubitController() : super(CubitState() as T);

  Future<void> fetchStudents() async {
    final list = ["STUDENT-1", "STUDENT-2", "STUDENT-3"];
    emit(state.setData("students", list) as T);
  }

  Future<void> fetchTeachers() async {
    final list = ["TEACHER-1", "TEACHER-2", "TEACHER-3"];
    emit(state.setData("teachers", list) as T);
  }

  Future<void> clearUsers() async {
    state.status(CubitStatus.loading);
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      state.clearData("users");
      emit(state.clearData("users") as T);
    });
  }

  void dispose() => state.clear();
}
