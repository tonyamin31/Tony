import 'package:flutter/material.dart';

import '../widget/appbarwithback.dart';

class Rules extends StatelessWidget {
  Rules({Key? key});

  final Map<String, String> cardrules = {
    'واحد بيقول اول حرف من اسم دولة و اللي بعده بيكمل اسم الدولة (مش لازم نفس الدولة)و اللي بيقع بيزيد 1':
        ':ربع قرد',
    'اللي معاه الورقة بيقول عايز (ولد , بنت , حيوان , نبات , جماد) بحرف الكذا و الللي بيقع بيزيد 1':
        ':اوتوبيس كومبليت',
    'اللي معاه الورقة بيقول عمري معملت و لو فيه كتير عملوها كلهم بيزيدو 1':
        ':عمري معملت',
    'اللي معاه الكرت بيقول الرقم و يخبط و اخر واحد بيخبط هو بيزيد 1':
        ':اخبط على الطرابيزة',
    'اللي معاه الكرت بيقول كلمة و اللي بعده بيجيب كلمة على نفس الوزن و اللي بيقع بيزيد 1 ':
        ':وزن وقافية',
    'اللي معاه الكرت بيقول اسم براند (مثلا نضارة ساعة برفان) والللي بيقع بيزيد 1':
        ':براندات',
    'اللي معاه الكرت بيختار حد يزيد 1': ':بتدي الورقة لأي حد',
    'اللي معاه الكرت بيتقول نكتة و اللي بيضحك بيزيد 1': ':بتقول نكتة',
    'اللي معاه الكرت محدش بيرد عليه واللي بيرد عليه بيزيد 1': ':محدش يرد عليه',
    'اللي معاه الكرد بيزيد 1': ':بتاخدها انت',
    'اللي معاه الكرت بيخيار حد يسأله سؤال ممكن يكون عارفه ولو مردش بيزيد 1':
        ':سؤال تعجيزي'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const backTop_Of_Page(),
            const Center(
              child: Text(
                'القوانين',
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 167, 42),
                  fontSize: 30,
                  fontFamily: 'MarheyVariableFont',
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cardrules.length,
              itemBuilder: (context, index) {
                final key = cardrules.keys.toList()[index];
                final value = cardrules[key];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        value ?? '',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color.fromARGB(255, 156, 144, 218),
                            fontSize: 28,
                            fontFamily: 'MarheyVariableFont'),
                      ),
                      SizedBox(height: 4),
                      Text(
                        key,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontFamily: 'MarheyVariableFont'),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
