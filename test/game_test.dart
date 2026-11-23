import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kaykay_sorf_kosusu/oyun_kaykay_sorf_kosusu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kaykayConfig.title.length, 33);
    expect(kaykayConfig.tagline.length, 33);
    for (final s in kaykayConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kaykayRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kaykayId, optionalMechanics: kaykayRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kaykayRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
