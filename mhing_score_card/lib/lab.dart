import 'dart:math';

main() {
  int bound = 7;
  int test = 11;
  for (int e = 5; e < 17; e++) {
    if (test <= bound) {
      print('test: $test; e: $e, bound: $bound, score: ${pow(2, e)}');
      break;
    } else
      bound += 3;
  }
}
