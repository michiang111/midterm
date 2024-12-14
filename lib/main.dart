import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C111156113 自傳',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("m1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('資工三甲 C111156113 楊玉琳 的個人檔案'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/p1.png', width: 40, height: 40,):Image.asset('assets/p1.png', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("m1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("m2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("m3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("m4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我出生在一個很平凡的家庭，家住在高雄，父母都是在高雄工作，而姊姊自己去台北工作，我還在大學就讀，目前就讀高雄科技大學資訊工程系三年級，平常的興趣是打遊戲跟畫畫，喜歡去吃很多美食，'
      '從小，我便養成了獨立的習慣，在學校我不僅學到了許多專業知識，也結交了很多朋友，這讓我的成長過程更加豐富多彩。在高中時就讀資訊科，大學一開始是讀高雄科技大學的智慧商務系，後來積極準備轉系，'
      '成功轉進了資工系，進了資工系加深了對專業知識的理解，並也獲得許多寶貴的經驗。我認為自己是個積極主動且具有責任心的人。在工作和生活中，我會盡全力做好每一件事，並且樂於接受挑戰。我善於與人溝通，'
      '並且能夠很好地聆聽他人的意見與建議，這使得我在團隊合作中能夠發揮出更大的價值。同時，我也有很強的學習能力，面對新事物時能夠快速適應，並將其轉化為自己的優勢。我相信這種學習能力會在未來的工作中繼續幫助我成長與進步。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('自我簡介', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/p1.png'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/p2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/p3.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '學習歷程',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildItem(
              title: '1. 資料壓縮和解壓縮的程式',
              description: '學習並使用Python寫出一個無失真的壓縮與解壓縮的程式',
              fileUrl: 'https://drive.google.com/file/d/1g0o7f7di4tPuJZnFLWWlJD5n-CCdysz9/view?usp=drive_link',
            ),
            SizedBox(height: 10),
            _buildItem(
              title: '2. opencv影像辨識',
              description: '利用opencv和ai咒語生成完成影像辨識、影像處理。',
              fileUrl: 'https://drive.google.com/file/d/1LE7jif2I3MmEsJNhJPav7ru5yYkYLBfl/view?usp=drive_link',
            ),
            SizedBox(height: 10),
            _buildItem(
              title: '3. 學生分數管理系統',
              description: '使用c語言做出一個學生分數管理系統之程式。',
              fileUrl: 'https://drive.google.com/file/d/16jyDs-BAqXlTwmks-KYGzUdqGmYdajXI/view?usp=drive_link',
            ),
            SizedBox(height: 10),
            _buildItem(
              title: '4. 數字檔案處理與基本統計',
              description: '使用c語言做出一個可以讀取和寫入檔案並處理檔案內數字。',
              fileUrl: 'https://drive.google.com/file/d/1OlT9413Sr8803bl7_aF_FAvnqdnFM4WP/view?usp=drive_link',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String title, required String description, required String fileUrl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: () => _launchURL(fileUrl),
          child: Text('下載檔案'),
        ),
      ],
    );
  }

  // 用來開啟檔案的URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '無法打開該URL: $url';
    }
  }
}



class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('大一時期'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: [
                      Text('1. 學好英文'),
                      Text('2. 組合語言'),
                      Text('3. 考取證照'),
                      Text('4. 人際關係'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('大二時期'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: [
                      Text('1. 深入學習資料結構與演算法'),
                      Text('2. 參加實作專案'),
                      Text('3. 增加外語能力'),
                      Text('4. 學習團隊合作'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('大三時期'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: [
                      Text('1. 專攻領域技能，如AI或Web開發'),
                      Text('2. 參加競賽與黑客松'),
                      Text('3. 實習工作'),
                      Text('4. 開始準備研究所或職場發展'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('大四時期'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: [
                      Text('1. 完成畢業專題'),
                      Text('2. 參加求職活動'),
                      Text('3. 面試與履歷優化'),
                      Text('4. 持續學習最新技術'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '專業方向',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. 人工智慧與機器學習',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '深入學習AI演算法、神經網路及相關工具。',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              '2. 網頁與移動端開發',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '掌握前後端技術如Flutter、Node.js，開發高效應用程式。',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              '3. 資料科學與大數據',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '學習處理和分析大數據的技能，和資料視覺化。',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              '4. 資訊安全',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '探索網路安全、密碼學和漏洞測試以保障資訊系統安全。',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

