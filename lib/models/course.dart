class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .80,
    name: "Bài 1",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .60,
    name: "Bài 2",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .10,
    name: "Bài 3",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .0,
    name: "Bài 4",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .0,
    name: "Bài 5",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "Gv. Trần Thị T",
    completedPercentage: .0,
    name: "Bài 6",
    thumbnail: "assets/icons/node.png",
  ),
];
