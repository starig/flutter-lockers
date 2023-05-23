import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lockers/components/locker_item.dart';
import 'package:lockers/components/refresh_widget.dart';
import 'package:lockers/config/colors.dart';
import 'package:lockers/config/scale.dart';
import 'package:lockers/cubits/lockers/lockers_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/my_lockers.svg",
                width: scale(20),
                height: scale(20),
              ),
              SizedBox(
                width: scale(2),
              ),
              Text(
                'ALILOCK',
                style: TextStyle(
                  color: action,
                  fontWeight: FontWeight.w800,
                  fontSize: scale(20),
                  letterSpacing: scale(-0.04),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: white,
        currentIndex: 0,
        selectedItemColor: action,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/my_lockers.svg"),
            label: 'My lockers',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/friends.svg"),
            label: 'My friends',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            label: 'Profile',
          ),
        ],
      ),
      body: BlocBuilder<LockersCubit, LockersState>(
        builder: (context, state) {
          return Container(
            height: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: scale(24),
              vertical: scale(22),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(scale(22)),
                topRight: Radius.circular(scale(22)),
              ),
              color: white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My lockers',
                        style: TextStyle(
                          fontSize: scale(26),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/logout.svg")
                    ],
                  ),
                  SizedBox(
                    height: scale(25),
                  ),
                  RefreshWidget(
                    onRefresh: () async {
                      try {
                        await context.read<LockersCubit>().getLockers();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            closeIconColor: white,
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.lockers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: scale(13)),
                            child: LockerItem(
                              index: index,
                              title: state.lockers[index].title!,
                              isLock: state.lockers[index].isLock!,
                              code: state.lockers[index].code!,
                            ),
                          );
                        }),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: action,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(scale(12)),
                      ),
                    ),
                    child: Text(
                      '+ Add locker',
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: scale(17)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
