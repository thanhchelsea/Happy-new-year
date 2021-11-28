import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/utils/utils.dart';

class DialogConfirmText extends StatefulWidget {
  DialogConfirmText({
    Key key,
    this.barrierDismissible = true,
    this.isShowSaveImage,
    this.isTaoThiepScreen,
    this.index,
  }) : super(key: key);

  bool barrierDismissible = false;
  final bool isShowSaveImage;
  final bool isTaoThiepScreen;
  final int index;

  @override
  DialogConfirmTextState createState() => DialogConfirmTextState();
}

class DialogConfirmTextState extends State<DialogConfirmText>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  BuildContext context1;
  TextEditingController controller = new TextEditingController();

  Widget ButtonWidget() {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    controller.text = BlocProvider.of<TaoThiepBloc>(context).state.loiChuc;
  }

  Widget build(BuildContext context) {
    return BlocConsumer<TaoThiepBloc, TaoThiepState>(
      listener: (context, state) {
        // controller.text=state.loiChuc;
      },
      builder: (context, state) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                widget.isShowSaveImage == false ||
                        widget.isShowSaveImage == null
                    ? Container(
                        height: 0.5 * DeviceUtil.getDeviceHeight(context),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height:
                                    0.4 * DeviceUtil.getDeviceHeight(context),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: controller,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16),
                                    hintText: Language.of(context)
                                        .getText("tao_thiep.nhap_loi_chuc"),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  (widget.isTaoThiepScreen)
                                      ? BlocProvider.of<TaoThiepBloc>(context)
                                          .add(
                                          ChangeText(controller.text),
                                        )
                                      : BlocProvider.of<LoiChucBloc>(context)
                                          .add(
                                          LoiChucChanged(
                                            changeText: controller.text,
                                            index: widget.index,
                                          ),
                                        );
                                  Navigator.of(context).pop();
                                },
                                color: AppTheme.nearlyDarkBrown,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.nearlyDarkBrown
                                        .withOpacity(0.7),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    Language.of(context)
                                        .getText("xac_nhan.xac_nhan"),
                                    style: AppTheme.body1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(50),
                        child: Text(
                          Language.of(context).getText("tao_thiep.saved"),
                          style: AppTheme.subtitle,
                        ),
                      ),
                Positioned(
                  top: -30,
                  child: CircleAvatar(
                    backgroundColor: AppTheme.nearlyYellow,
                    radius: 30,
                    child: Icon(
                      widget.isShowSaveImage == false ||
                              widget.isShowSaveImage == null
                          ? Icons.mode_edit
                          : Icons.save_alt,
                      color: AppTheme.nearlyDarkBrown.withOpacity(0.7),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
