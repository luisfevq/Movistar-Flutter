import 'package:flutter_test/flutter_test.dart';
import 'package:fluvistar/app/demo.dart';

void main() {
  test("custom date format - Test", () {
    DateTime date = DateTime(2021, 3, 25);
    expect(date.formatCustom, "25/03/2021");
    date = DateTime(2021, 3, 2);
    expect(date.formatCustom, "02/03/2021");
    date = DateTime(2021, 10, 25);
    expect(date.formatCustom, "25/10/2021");
    date = DateTime(2021, 10, 5);
    expect(date.formatCustom, "05/10/2021");
  });
}
