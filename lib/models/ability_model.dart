class AbilityModel {
  int? force;
  int? intelligence;
  int? agility;
  int? endurance;
  int? velocity;

  AbilityModel({
    this.force,
    this.intelligence,
    this.agility,
    this.endurance,
    this.velocity,
  });

  AbilityModel.fromJson(Map<String, dynamic> json) {
    force = json['force'];
    intelligence = json['intelligence'];
    agility = json['agility'];
    endurance = json['endurance'];
    velocity = json['velocity'];
  }
}
