class VehicleEntryModel{
  final int slotId;
  DateTime? start;
  DateTime? end;
  int? id;
  bool active;
  bool beingHandled;

  VehicleEntryModel(
    {
      required this.slotId, 
      this.start,
      this.end, 
      this.id,
      this.active = false,
      this.beingHandled = false
    }
  );

  factory VehicleEntryModel.fromJson(Map<String, dynamic> json){
    return VehicleEntryModel(
      slotId: json['slotId'], 
      start: (json['start'] != null && json['start'] != 0) ? DateTime.fromMillisecondsSinceEpoch(json['start']) : null,
      end: (json['end'] != null && json['end'] != 0) ? DateTime.fromMillisecondsSinceEpoch(json['end']) : null,
      id: json['id'],
      active: (json['start'] != null && json['start'] != 0) && (json['end'] == null || json['end'] == 0) ? true : false
    );
  }

  Map<String, dynamic> toJson(){   
    return {
      'slotId': slotId, 
      'start': start?.millisecondsSinceEpoch?? 0,
      'end': end?.millisecondsSinceEpoch?? 0 ,
      'id': id
    };
  }

  Map<String, dynamic> toJsonActive({bool returnStart = true}){
    return {
      'slotId': slotId, 
      'start': returnStart? start?.millisecondsSinceEpoch : 0,
      'id': id
    };
  }
}