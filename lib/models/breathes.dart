class BreathersShortModel {
  int id;
  String name;

  BreathersShortModel(this.id, this.name);

  static List<BreathersShortModel> getListMock() {
    return [
      BreathersShortModel(1, 'strong practice'),
      BreathersShortModel(2, 'smell practice'),
      BreathersShortModel(3, 'peace practice'),
    ];
  }
}
