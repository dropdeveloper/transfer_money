import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_transfer/model/trans_model.dart';
import 'package:money_transfer/screens/receive_money.dart';
import 'package:money_transfer/screens/send_money.dart';
import 'package:money_transfer/screens/shake_phone.dart';
import 'package:money_transfer/styles/image_assets.dart';
import 'package:money_transfer/styles/text_styles.dart';
import 'package:money_transfer/widgets/card_widget.dart';
import 'package:money_transfer/widgets/side_drawer.dart';
import 'package:money_transfer/widgets/trans_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TransactionModel> transactionList = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    transactionList.add(TransactionModel(id: 1020, ref: "Mobile Recharge", desc: "Jio number +91 96454569986 @99 pack", amount: 99.0, type: 1, image: ""));
    transactionList.add(TransactionModel(id: 1021, ref: "Fund Transfer", desc: "to zor.te@gmail.com", amount: 2000.0, type: 1, image: ""));
    transactionList.add(TransactionModel(id: 1020, ref: "Fund Creadited", desc: "from +919645469986", amount: 5500.0, type: 0, image: ""));
    transactionList.add(TransactionModel(id: 1020, ref: "Mobile Recharge", desc: "Jio number +91 96454569986 @99 pack", amount: 99.0, type: 1, image: ""));
    transactionList.add(TransactionModel(id: 1021, ref: "Fund Transfer", desc: "to zor.te@gmail.com", amount: 2000.0, type: 1, image: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 56.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const CircleAvatar(
              maxRadius: 44.0,
              backgroundImage: AssetImage(dpImage),
            ),
          ),
        ),
        title: Text(
          "Hi, Ijas Aslam",
          style: title1Style,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: CardView(color: Color.fromARGB(255, 15, 15, 15), cardExpiration: "08/2028", cardHolder: "IJAS ASLAM", cardNumber: "3546 7532 XXXX 9742")),
                  const SizedBox(width: 10.0),
                  SmoothPageIndicator(
                      axisDirection: Axis.vertical,
                      controller: PageController(),
                      count: 2,
                      effect: const ExpandingDotsEffect(radius: 10, dotWidth: 10, dotHeight: 4, activeDotColor: Colors.black),
                      onDotClicked: (index) {}),
                ],
              ),
              const SizedBox(height: 27.0),
              _categoryMenus(),
              const SizedBox(height: 27.0),
              Text("Transactions", style: title2Style),
              const SizedBox(height: 10.0),
              Column(children: List.generate(transactionList.length, (index) => TransItem(model: transactionList[index]))),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.mobile_off],
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.black,
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 5,
        rightCornerRadius: 5,
        onTap: (index) => 1,
        //other params
      ),
    );
  }

  Widget _categoryMenus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _cateItem(Icons.arrow_forward, "Send", () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => const SendMoneyScreen()));
        }),
        _cateItem(Icons.arrow_back, "Receive", () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => const ReceiveMoney()));
        }),
        _cateItem(Icons.explicit_sharp, "Exchange", () {}),
        _cateItem(Icons.phone_iphone, "Shake", () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => const ShakePhone()));
        }),
      ],
    );
  }

  Widget _cateItem(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            elevation: 4,
            color: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(title, style: labelTitleStyle)
      ],
    );
  }
}
