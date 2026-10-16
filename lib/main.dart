import 'package:flutter/material.dart';

void main() {
  runApp(const HorrorGameApp());
}

class HorrorGameApp extends StatelessWidget {
  const HorrorGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // خلفية سوداء بالكامل لأجواء الرعب
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // هنا سنضع نص القصة الحالي والخيارات
  String storyText = "تستيقظ في غرفة مظلمة تماماً. الهواء بارد ورائحة التعفن تمتلئ بالمكان. تسمع صوت خطوات ثقيلة تقترب من الباب المكسور...\n\nماذا ستفعل؟";
  String choice1 = "التخفي تحت السرير المليء بالتراب";
  String choice2 = "محاولة الهروب عبر النافذة المكسورة";
  
  int stage = 1;

  // دالة لتغيير القصة بناءً على اختيار اللاعب
  void makeChoice(int choiceNumber) {
    setState(() {
      if (stage == 1) {
        if (choiceNumber == 1) {
          storyText = "تزحف تحت السرير بهدوء... تسمع صوت أقدام تدخل الغرفة وتتوقف بجانب السرير مباشرة! ينحني كي ينظر تحت السرير... وتلتقي أعينكم في الظلام!\n\n(لقد مت!)";
          choice1 = "إعادة المحاولة";
          choice2 = "الخروج للقائمة الرئيسية";
          stage = 2;
        } else {
          storyText = "ترکض نحو النافذة وتقفز وسط الزجاج المكسور! تسقط على الأرض وتستمر في الركض نحو الغابة المظلمة وأنت تنظر خلفك وتسمع صرخات غاضبة تملأ المكان...\n\n(لقد نجوْت مؤقتاً!)";
          choice1 = "إعادة اللعب";
          choice2 = "الخروج للقائمة الرئيسية";
          stage = 2;
        }
      } else {
        // إعادة ضبط اللعبة من البداية
        storyText = "تستيقظ في غرفة مظلمة تماماً. الهواء بارد ورائحة التعفن تمتلئ بالمكان. تسمع صوت خطوات ثقيلة تقترب من الباب المكسور...\n\nماذا ستفعل؟";
        choice1 = "التخفي تحت السرير المليء بالتراب";
        choice2 = "محاولة الهروب عبر النافذة المكسورة";
        stage = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("لعبة الرعب: الغرفة المظلمة", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // مربع عرض القصة
            Expanded(
              child: Center(
                child: Text(
                  storyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // زر الخيار الأول
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () => makeChoice(1),
              child: Text(choice1, style: const TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 15),
            
            // زر الخيار الثاني
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () => makeChoice(2),
              child: Text(choice2, style: const TextStyle(fontSize: 16, color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}