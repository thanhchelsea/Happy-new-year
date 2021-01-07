import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/utils/ultils.dart';

class DialogConfirmText extends StatefulWidget {
  const DialogConfirmText({
    Key key,
    this.barrierDismissible = true,
  }) : super(key: key);
  final bool barrierDismissible;
  @override
  DialogConfirmTextState createState() => DialogConfirmTextState();
}

class DialogConfirmTextState extends State<DialogConfirmText>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  BuildContext context1;
  TextEditingController controller=new TextEditingController();

  Widget ButtonWidget() {
    return Container();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<TaoThiepBloc,TaoThiepState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 0.5 * DeviceUtil.getDeviceHeight(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 0.3 * DeviceUtil.getDeviceHeight(context),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 17),
                              hintText: 'Nhập lời chúc của bạn...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            BlocProvider.of<TaoThiepBloc>(context).add(ChangeText(controller.text));
                            Navigator.of(context).pop();
                          },
                          color: AppTheme.nearlyDarkBrown,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: AppTheme.nearlyDarkBrown.withOpacity(0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),

                            child: Text( Language.of(context).getText("xac_nhan.xac_nhan"),style: AppTheme.body1,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -30,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.nearlyYellow,
                      radius: 30,
                      child: Icon(
                        Icons.mode_edit,
                        color: AppTheme.nearlyDarkBrown.withOpacity(0.7),
                        size: 30,
                      ),
                    )),
              ],
            ));
      },
    );
  }
}
