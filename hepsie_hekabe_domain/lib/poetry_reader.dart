import 'domain.dart';

class PoetryReader implements IRequestVerses {
  PoetryReader();

  PoetryReader.create(this._poetryLibrary);

  IObtainsPoems _poetryLibrary;

  @override
  String giveMeSomePoetry() {
    if (_poetryLibrary == null) {
      return 'If you could read a leaf or tree\r\nyou’d have no need of books.\r\n-- © Alistair Cockburn (1987)';
    }
    return _poetryLibrary.getAPoem();
  }
}
