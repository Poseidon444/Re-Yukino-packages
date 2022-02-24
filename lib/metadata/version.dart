class TenkaVersion {
  TenkaVersion(this.year, this.month, this.revision);

  factory TenkaVersion.parse(final String version) {
    final RegExpMatch? match =
        RegExp(r'(\d{4})\.(\d{2})-r(\d+)').firstMatch(version);
    if (match == null) {
      throw Exception('Invalid format');
    }

    final int year = int.parse(match.group(1)!);
    final int month = int.parse(match.group(2)!);
    final int revision = int.parse(match.group(3)!);
    if (month < 1 || month > 12) {
      throw Exception('Invalid month');
    }

    return TenkaVersion(year, month, revision);
  }

  int year;
  int month;
  int revision;

  void increment() {
    final DateTime now = DateTime.now();

    if (year != now.year || month != now.month) {
      year = now.year;
      month = now.month;
      revision = 0;

      return;
    }

    revision += 1;
  }

  @override
  String toString() => '$year.${month.toString().padLeft(2, '0')}-r$revision';

  bool operator >(final TenkaVersion version) =>
      year > version.year ||
      (year == version.year && month > version.month) ||
      year == version.year &&
          month == version.month &&
          revision > version.revision;

  bool operator <(final TenkaVersion version) =>
      year < version.year ||
      (year == version.year && month < version.month) ||
      year == version.year &&
          month == version.month &&
          revision < version.revision;

  @override
  bool operator ==(final Object other) =>
      other is TenkaVersion &&
      year == other.year &&
      month == other.month &&
      revision == other.revision;

  @override
  int get hashCode => Object.hash(year, month, revision);
}
