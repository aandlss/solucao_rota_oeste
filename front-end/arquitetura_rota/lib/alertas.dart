class Alerta {
  final int id;
  final String type;
  final String durationType;
  final double durationValue;
  final String durationUnit;
  final String occurrences;
  final String engineHoursType;
  final double engineHoursValue;
  final String engineHoursUnit;
  final int machineLinearTime;
  final int bus;
  final DateTime time;
  final String locationType;
  final double lat;
  final double lon;
  final String color;
  final String severity;
  final String acknowledgementStatus;
  final bool ignored;
  final bool invisible;
  final int definitionId;
  final String definitionType;
  final String definitionSuspectParameterName;
  final String definitionFailureModeIndicator;
  final int definitionBus;
  final String definitionSourceAddress;
  final String definitionThreeLetterAcronym;
  final String definitionDescription;

  Alerta({
    required this.id,
    required this.type,
    required this.durationType,
    required this.durationValue,
    required this.durationUnit,
    required this.occurrences,
    required this.engineHoursType,
    required this.engineHoursValue,
    required this.engineHoursUnit,
    required this.machineLinearTime,
    required this.bus,
    required this.definitionId,
    required this.time,
    required this.locationType,
    required this.lat,
    required this.lon,
    required this.color,
    required this.severity,
    required this.acknowledgementStatus,
    required this.ignored,
    required this.invisible,
    required this.definitionType,
    required this.definitionSuspectParameterName,
    required this.definitionFailureModeIndicator,
    required this.definitionBus,
    required this.definitionSourceAddress,
    required this.definitionThreeLetterAcronym,
    required this.definitionDescription,
  });
  factory Alerta.fromJson(Map<String, dynamic> json) {
    return Alerta(
      id: int.parse(json['Id'].toString()),
      type: json['Type'],
      durationType: json['DurationType'],
      durationValue: double.parse(json['DurationValue'].toString()),
      durationUnit: json['DurationUnit'],
      occurrences: json['Occurrences'],
      engineHoursType: json['EngineHoursType'],
      engineHoursValue: double.parse(json['EngineHoursValue'].toString()),
      engineHoursUnit: json['EngineHoursUnit'],
      machineLinearTime: int.parse(json['MachineLinearTime'].toString()),
      bus: int.parse(json['Bus'].toString()),
      time: DateTime.parse(json['Time']),
      locationType: json['LocationType'],
      lat: double.parse(json['Lat'].toString()),
      lon: double.parse(json['Lon'].toString()),
      color: json['Color'],
      severity: json['Severity'],
      acknowledgementStatus: json['AcknowledgementStatus'],
      ignored: json['Ignored'],
      invisible: json['Invisible'],
      definitionId: int.parse(json['DefinitionId'].toString()),
      definitionType: json['DefinitionType'],
      definitionSuspectParameterName: json['DefinitionSuspectParameterName'],
      definitionFailureModeIndicator: json['DefinitionFailureModeIndicator'],
      definitionBus: int.parse(json['DefinitionBus'].toString()),
      definitionSourceAddress: json['DefinitionSourceAddress'],
      definitionThreeLetterAcronym: json['DefinitionThreeLetterAcronym'],
      definitionDescription: json['DefinitionDescription'],
    );
  }
}