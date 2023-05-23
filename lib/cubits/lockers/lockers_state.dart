part of 'lockers_cubit.dart';

class Locker {
  int? id;
  String? code;
  String? title;
  bool? isLock;

  Locker({this.id, this.code, this.title, this.isLock});

  Locker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    isLock = json['is_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['title'] = this.title;
    data['is_lock'] = this.isLock;
    return data;
  }
}

class Lockers {
  int? id;
  String? code;
  String? title;
  bool? isLock;

  Lockers({this.id, this.code, this.title, this.isLock});

  Lockers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    isLock = json['is_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['title'] = this.title;
    data['is_lock'] = this.isLock;
    return data;
  }
}

class LockersState {
  List<Locker> lockers;
  bool isLoaded;

  LockersState({
    required this.lockers,
    required this.isLoaded,
  });

  LockersState copyWith({List<Locker>? lockers, bool? isLoaded}) {
    return LockersState(
      lockers: lockers ?? this.lockers,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
