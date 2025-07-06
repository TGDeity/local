import 'package:ders/101/icon_learn.dart';
import 'package:ders/101/image_learn.dart';
import 'package:flutter/material.dart';

class TabLearnView extends StatefulWidget {
  const TabLearnView({super.key});

  @override
  State<TabLearnView> createState() => _TabLearnViewState();
}

class _TabLearnViewState extends State<TabLearnView> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _notchMargin = 10.0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViewEnum.values.length, vsync: this); //TabController oluşturuluyor
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViewEnum.values.length,
      child: Scaffold(
        extendBody: true, //Ortadaki tab barı extended yapıyor arkasını gizliyor.
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, //FlotatingActionButtonu ortaya koyuyor.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViewEnum.page1.index); //0.sayfaya git
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchMargin,
          shape: CircularNotchedRectangle(),

          child: TabBar(
            indicatorColor: Colors.red, //Page1/Page2'nin altındaki çizgi.
            //isScrollable: true, //page1 ve 2yi sıkıştırıyor. Spacebetween gibi.
            labelColor: Colors.amber, //Selected pagein label rengi.
            unselectedLabelColor: Colors.blue, //seçilmemiş pagein label rengi
            padding: EdgeInsets.zero, //bazem uygulama crash olabilyor paddingi kapatabiliriz. İco
            controller: _tabController,
            onTap: (value) {
              print(value);
            },
            tabs: _MyTabViewEnum.values.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(400), bottomRight: Radius.circular(400)),
          ),
          bottom: _myTablView(),
        ),
        body: _tabbarView(),//Genel Tabbarlar.
      ),
    );
  }

  TabBar _myTablView() {
    return TabBar(
      controller: _tabController,
      tabs: _MyTabViewEnum.values.map((e) => Tab(text: e.name)).toList(),
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: ScrollPhysics(
        parent: NeverScrollableScrollPhysics(),
      ), //Sağa sola el ile geçişi kapatıyor, sadece page1 page2 gibi butonlarla geçilebilir hale getiriyor.
      controller: _tabController,
      children: [ImageLearnView(), IconLearnView(), ImageLearnView(), IconLearnView()],
    );
  }
}

enum _MyTabViewEnum { page1, page2, home, settings }

extension _MyTabViewExtension on _MyTabViewEnum {}
