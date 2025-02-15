class BirthdayEntity {
  int id;
  DateTime createdTime;
  int type;
  String nickname;
  String mark;
  DateTime birthday;

  BirthdayEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.nickname,
    required this.mark,
    required this.birthday,
  });

  factory BirthdayEntity.fromJson(Map<String, dynamic> json) {
    return BirthdayEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      nickname: json['nickname'],
      mark: json['mark'],
      birthday: DateTime.parse(json['birthday']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'nickname': nickname,
      'mark': mark,
      'birthday': birthday.toIso8601String(),
    };
  }

  bool get isOut {
    return DateTime.now().isAfter(birthday);
  }

  int get birthdayAfter {
    return birthday.difference(DateTime.now()).inDays;
  }
}