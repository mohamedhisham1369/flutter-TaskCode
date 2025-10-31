
class Trip {
  final String id;
  final String status;
  final String title;
  final TripDates dates;
  final List<Participant> participants;
  final int unfinishedTasks;
  final String coverImage;

  Trip({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] as String,
      status: json['status'] as String,
      title: json['title'] as String,
      dates: TripDates.fromJson(json['dates']),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e))
          .toList(),
      unfinishedTasks: json['unfinished_tasks'] as int,
      coverImage: json['cover_image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'title': title,
        'dates': dates.toJson(),
        'participants': participants.map((e) => e.toJson()).toList(),
        'unfinished_tasks': unfinishedTasks,
        'cover_image': coverImage,
      };
}

class TripDates {
  final String start;
  final String end;

  TripDates({
    required this.start,
    required this.end,
  });

  factory TripDates.fromJson(Map<String, dynamic> json) => TripDates(
        start: json['start'] as String,
        end: json['end'] as String,
      );

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
      };
}

class Participant {
  final String name;
  final String avatarUrl;

  Participant({
    required this.name,
    required this.avatarUrl,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        name: json['name'] as String,
        avatarUrl: json['avatar_url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatar_url': avatarUrl,
      };
}
