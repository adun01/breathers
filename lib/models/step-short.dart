class BreathersShortModel {
  int id;
  String name;
  int circles;

  BreathersShortModel(this.id, this.name, this.circles);

  static List<BreathersShortModel> getListMock() {
    return [
      BreathersShortModel(1, 'Relax breathing', 12),
      BreathersShortModel(1, 'Relax breathing', 12),
      BreathersShortModel(1, 'Relax breathing', 12),
    ];
  }
}
