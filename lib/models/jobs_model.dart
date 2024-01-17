class JobsModel {
  final String title;
  final String status;
  final String progress_percent;
  final List<String> workers;
  final String imageUrl;
  final String date;
  final String farm;
  JobsModel({
    required this.title,
    required this.status,
    required this.progress_percent,
    required this.workers,
    required this.imageUrl,
    required this.date,
    required this.farm,
  });
}
