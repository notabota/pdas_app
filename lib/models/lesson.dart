class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;
  String fileName;
  String phone;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
    required this.fileName,
    required this.phone
  });
}

List<Lesson> lessonList = [
  Lesson(
      duration: '5 phút',
      isCompleted: true,
      isPlaying: true,
      name: "C /k/",
      fileName: "C.mp3",
      phone: "k"
  ),
  Lesson(
    duration: '5 phút',
    isCompleted: true,
    isPlaying: false,
    name: "A /a/",
    fileName: "A.mp3",
    phone: "a",
  ),
  Lesson(
      duration: '5 phút',
      isCompleted: true,
      isPlaying: false,
      name: "Ca /ka/",
      fileName: "Ca.mp3",
      phone: 'k a'
  ),
  Lesson(
      duration: '5 phút',
      isCompleted: true,
      isPlaying: false,
      name: "Cá",
      fileName: "Cas.mp3",
      phone: ''
  ),
];