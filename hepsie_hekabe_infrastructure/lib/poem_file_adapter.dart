import 'package:flutter/services.dart';
import 'package:hepsie_hekabe_domain/domain.dart';

class PoemFileAdapter implements IObtainsPoems {
  PoemFileAdapter(String filePath) {
    rootBundle.loadString(filePath).then((value) => _poem = value);
  }

  String _poem;

  @override
  String getAPoem() {
    return _poem;
  }
}
