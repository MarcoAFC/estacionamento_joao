class VehicleEntryModel{
  final int slotId;
  final DateTime start;
  final DateTime? end;
  final int? id;

  VehicleEntryModel(
    {
      required this.slotId, 
      required this.start,
      this.end, 
      this.id
    }
  );

  factory VehicleEntryModel.fromJson(Map<String, dynamic> json){
    return VehicleEntryModel(
      slotId: json['slotId'], 
      start: DateTime.fromMillisecondsSinceEpoch(json['start']),
      end: DateTime.fromMillisecondsSinceEpoch(json['end']),
      id: json['id']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'slotId': slotId, 
      'start': start.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'id': id
    };
  }
}