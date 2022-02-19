
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void snackThis({required BuildContext context, Widget content = const Text("Something Happened. Please try again."), int duration=3, Color color=Colors.green, SnackBarBehavior behavior= SnackBarBehavior.floating}){
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    Flushbar flush = Flushbar();
    dismiss(){
      flush.dismiss();
    }
    Widget changedContent = content;
    try{
      changedContent=Text((content as Text).data.toString(), style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700
      ),);
    }catch(e){}
    flush = Flushbar(
      isDismissible: true,
      messageColor: Colors.white,
      message: "",
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      backgroundColor: color,
      duration: Duration(seconds: duration),
      messageText: TweenAnimationBuilder<Duration>(
          duration: Duration(seconds: duration),
          tween: Tween(begin: Duration(seconds: duration), end: Duration.zero),
          builder: (context, Duration value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 5,
                    child: changedContent),
                InkWell(
                  onTap: (){
                    dismiss();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Stack(
                      children: [
                        Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent, color: Colors.white,value: value.inMilliseconds/(duration*1000), )),
                        Positioned.fill(
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  child: Icon(Icons.close, color: Colors.white,))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
      ),
    )..show(context);
  });


}