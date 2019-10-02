class Record {
  final id;
  final date;
  final startTime;
  final endTime;
  final workTime;
  final rate;

  const Record(
      {this.id,
      this.date,
      this.startTime,
      this.endTime,
      this.workTime,
      this.rate});

  String toString() { /***   FOR TESTING   **/
    return "\n\ndate " +
        date.toString() +
        "\n start time " +
        startTime.toString() +
        "\n end time " +
        endTime.toString() +
        "\n workTime " +
        workTime.toString() +
        "\n rate " +
        rate.toString();
  }
}
