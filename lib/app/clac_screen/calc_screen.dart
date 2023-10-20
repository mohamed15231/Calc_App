
import 'package:calculator_app/app/clac_screen/calc_screen_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Text(
                        CalcScreenData.showData,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 50.sp,
                            overflow: TextOverflow.fade,
                            color: Colors.white),
                      ),
                    ),
                  )),
              SizedBox(
                height: 500.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10,
                    children: List.generate(
                      CalcScreenData.button.length,
                      (index) => InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {});

                         CalcScreenData.calcLogicIfElse(index: index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  CalcScreenData.colorSelection(index: index),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              CalcScreenData.button[index],
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
