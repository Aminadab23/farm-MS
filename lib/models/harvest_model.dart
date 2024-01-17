
class HarvestModel {
  final String name;
  final String type;
  final String quantity;
  final String date_to_harvest;
  final String quality;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;
  // final FarmsListData farm;
  final String farm;
  HarvestModel({
    required this.name,
    required this.type,
    required this.quantity,
    required this.date_to_harvest,
    required this.quality,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.farm,
  });
}
