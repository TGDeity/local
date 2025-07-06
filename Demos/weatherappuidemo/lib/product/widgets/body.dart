import 'package:flutter/material.dart';
import 'package:weatherappuidemo/product/colors.dart';

class ProjectBody extends StatefulWidget {
  const ProjectBody({super.key});

  @override
  State<ProjectBody> createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> with TickerProviderStateMixin, Uipaddng {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabBarItemsMixin.values.length, vsync: this); //TabController oluşturuluyor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              _backGround(context),
              _oylesine(),
              _homeGround(context),
              _bottomCustomCard(context, _tabController),
              _bottomBarrectalnge(context),
              _bottomBarSubtract(context),
              _bottomBar(context),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _oylesine() {
    double height = 100;
    return Positioned(
      top: 100,
      child: Column(
        children: [
          SizedBox(
            height: height,
            width: height,
            child: TextField(cursorColor: UIColors.page_48319d, autofocus: true),
          ), SizedBox(
            height: height,
            width: height,
            child: TextField(cursorColor: UIColors.page_48319d, autofocus: true),
          ),
        ],
      ),
    );
  }

  Positioned _homeGround(BuildContext context) {
    //double height = 390;
    //double paddingTop = 325.0;
    return Positioned(
      top: mediaHeight(context)/3,
      left: 0,
      child: SizedBox(
        height: mediaHeight(context, flex: 0.4),
        width: mediaWidth(context, flex: 1),
      
        child: Image.asset('assets/png/house.png', fit: BoxFit.fill),
      ),
    );
  }

  DefaultTabController _bottomCustomCard(BuildContext context, TabController tabController) {
    String rectanglepng = 'assets/png/Rectangle.png';
    double circiualRadius = 30;
    return DefaultTabController(
      length: TabBarItemsMixin.values.length,
      child: Positioned(
        bottom: 0,
        child: Container(
          height: mediaHeight(context, flex: 0.5) < 300 ? mediaHeight(context, flex: 0.7) : mediaHeight(context, flex: 0.5),
          width:  mediaWidth(context),
          decoration: BoxDecoration(
            // backgroundBlendMode: BlendMode.dst,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(circiualRadius),
              topRight: Radius.circular(circiualRadius),
            ),
            image: DecorationImage(image: AssetImage(rectanglepng), fit: BoxFit.cover, opacity: 1),
          ),
          child: SizedBox(
            height: mediaHeight(context, flex: 0.4),
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(text: 'Today'),
                    Tab(text: 'Week'),
                  ],
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.all(0),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      _TabBarItemBuilder(modelPng: 'Hourly'),
                      _TabBarItemBuilder(modelPng: 'nowweather'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _bottomBarrectalnge(BuildContext context) {
    var rectangle364 = 'assets/png/Rectangle364.png';
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: mediaWidth(context),
        height: mediaHeight(context, flex: 0.13),
        child: Image.asset(rectangle364, fit: BoxFit.fill),
      ),
    );
  }

  Positioned _bottomBarSubtract(BuildContext context) {
    var subtractpng = 'assets/png/Subtract.png';
    return Positioned(
      right: mediaWidth(context) / 7.5,
      bottom: 0,
      child: SizedBox(
        height: mediaHeight(context, flex: 0.14),
        width: mediaWidth(context, flex: 0.75),
        child: Image.asset(subtractpng, fit: BoxFit.fill),
      ),
    );
  }

  Positioned _backGround(BuildContext context) {
    return Positioned(
      child: SizedBox(height: mediaHeight(context), width: mediaWidth(context), child: _BackGroundImg()),
    );
  }

  Positioned _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: mediaHeight(context, flex: 0.13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: mediaWidth(context, flex: 0.2)),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/png/Location.png', fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: mediaWidth(context, flex: 0.2)),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/png/Settings.png', fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarItemBuilder extends StatefulWidget {
  const _TabBarItemBuilder({required this.modelPng});
  final String? modelPng;

  @override
  State<_TabBarItemBuilder> createState() => _TabBarItemBuilderState();
}

class _TabBarItemBuilderState extends State<_TabBarItemBuilder> with Uipaddng {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mediaWidth(context, flex: 0.2),
                height: mediaHeight(context, flex: 0.2),
                child: Image.asset('assets/png/${widget.modelPng}.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackGroundImg extends StatelessWidget {
  final String src = 'assets/png/background_img.png';
  @override
  Widget build(BuildContext context) {
    return Image.asset(src, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Placeholder());
  }
}

mixin Uipaddng {
  double mediaHeight(BuildContext context, {flex = 1}) => MediaQuery.of(context).size.height * flex;
  double mediaWidth(BuildContext context, {flex = 1}) => MediaQuery.of(context).size.width * flex;
}

enum TabBarItemsMixin { location, settings }
