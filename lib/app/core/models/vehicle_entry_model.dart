class VehicleEntryModel{
  final int slotId;
  final DateTime? start;
  final DateTime? end;
  final int? id;

  VehicleEntryModel(
    {
      required this.slotId, 
      this.start,
      this.end, 
      this.id
    }
  );

  factory VehicleEntryModel.fromJson(Map<String, dynamic> json){
    return VehicleEntryModel(
      slotId: json['slotId'], 
      start: json['start'] != null ? DateTime.fromMillisecondsSinceEpoch(json['start']) : null,
      end: json['end'] != null ? DateTime.fromMillisecondsSinceEpoch(json['end']) : null,
      id: json['id']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'slotId': slotId, 
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'id': id
    };
  }

  Map<String, dynamic> toJsonActive({bool returnStart = true}){
    return {
      'slotId': slotId, 
      'start': returnStart? start?.millisecondsSinceEpoch : null,
    };
  }
}