import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/interText.dart';
import '../../../Utils/appColor.dart';
import 'AboutScreen.dart';
import 'MemberScreen.dart';
import 'SendMessageScreen.dart';

class FacilityDetailScreen extends StatefulWidget {
  const FacilityDetailScreen({super.key});

  @override
  State<FacilityDetailScreen> createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController(
    initialPage: 0,
  );
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CommonAppBar(
          title: InterText(text: 'Beacon Health Center', color: AppColors.blue),
        ),
        floatingActionButton:
        InkWell(
          onTap: (){
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              backgroundColor: AppColors.white,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    setState(() {});
                    return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const SendMessageScreen());
                  },
                );
              },
            );
          },
          child: Container(
              margin: EdgeInsets.only(bottom: Reponsive_.crosslength * 0.02),
              height: Reponsive_.crosslength * 0.06,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.yallow),
              child: Image.asset(
                'assets/dashBoardFlow/mail.png',
                scale: 1,
                color: Colors.white,
              )
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    _controller.animateToPage(selectedIndex,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  });
                },
                tabs: [
                  Container(
                    width: double.infinity,
                    height: Reponsive_.crosslength * 0.04,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: selectedIndex == 0
                                    ? AppColors.yallow
                                    : Colors.transparent,
                                width: 2))),
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'About',
                      color: selectedIndex == 0
                          ? AppColors.light_blue
                          : AppColors.white.withOpacity(0.3),
                      fontSize: Reponsive_.crosslength * 0.017,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: selectedIndex == 1
                                    ? AppColors.yallow
                                    : Colors.transparent,
                                width: 2))),
                    height: Reponsive_.crosslength * 0.04,
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'Members(40)',
                      color: selectedIndex == 1
                          ? AppColors.light_blue
                          : AppColors.white.withOpacity(0.3),
                      fontSize: Reponsive_.crosslength * 0.017,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                children: const [
                  AboutScreen(),
                  MemberScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
