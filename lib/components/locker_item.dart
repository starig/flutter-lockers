import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lockers/config/colors.dart';
import 'package:lockers/config/scale.dart';
import 'package:lockers/cubits/lockers/lockers_cubit.dart';

class LockerItem extends StatefulWidget {
  final String title;
  final bool isLock;
  final String code;
  final int index;

  const LockerItem(
      {Key? key,
      required this.title,
      required this.isLock,
      required this.code,
      required this.index})
      : super(key: key);

  @override
  State<LockerItem> createState() => _LockerItemState();
}

class _LockerItemState extends State<LockerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scale(118),
      padding: EdgeInsets.symmetric(horizontal: scale(21), vertical: scale(17)),
      decoration: BoxDecoration(
          color: addGreen, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: scale(50),
                height: scale(50),
                padding: EdgeInsets.all(scale(15)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(scale(50)),
                    color: widget.isLock ? action : orange),
                child: SvgPicture.asset("assets/icons/lock.svg"),
              ),
              SizedBox(
                width: scale(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: scale(17),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "id: ${widget.code}",
                        style: TextStyle(fontSize: scale(12)),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: widget.isLock ? action : orange,
                      borderRadius: BorderRadius.circular(scale(30)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: scale(10), vertical: 2),
                    child: Text(
                      widget.isLock
                          ? 'Locked'.toUpperCase()
                          : 'Unlocked'.toUpperCase(),
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: action,
            value: widget.isLock,
            onChanged: (value) {
              context.read<LockersCubit>().toggleLocker(widget.index, value);
            },
          )
        ],
      ),
    );
  }
}
