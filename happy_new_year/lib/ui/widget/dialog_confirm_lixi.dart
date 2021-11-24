import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/utils/ultils.dart';

class DialogConfirmReport extends StatefulWidget {
  const DialogConfirmReport({
    Key key,
    this.barrierDismissible = true,
    this.money,
  }) : super(key: key);
  final bool barrierDismissible;
  final String money;
  @override
  DialogConfirmReportState createState() => DialogConfirmReportState();
}

class DialogConfirmReportState extends State<DialogConfirmReport>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  BuildContext context1;

  Widget ButtonWidget() {
    return Container();
  }

  @override
  deactivate() {
    // call khi vong doi huy
    super.deactivate();
    BlocProvider.of<LiXiBloc>(this.context).add(ResetLiXi(true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey1,
      backgroundColor: Colors.transparent,
      body: BlocConsumer<LiXiBloc, LiXiState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Container(
              width: 300,
           //   height: 0.9* DeviceUtil.getDeviceHeight(context),
              //   color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                  //  height: 500,
                    color: Colors.teal,
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(AppImages.ANH_NEN2),
                          // fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: -200,
                          child:  Center(
                            child: Container(
                               width: 300,
                              alignment: Alignment.topCenter,
                              child: Image(
                                image: AssetImage(AppImages.ANH_GIF5),
                                // fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),),
                        Center(// var a=[1,2.3] ;
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.money.toString() == "May mắn" ? widget.money.toString():widget.money.toString()+ " vnđ",
                                style: AppTheme.headline,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  FlatButton(
                    onPressed: (){
                      BlocProvider.of<LiXiBloc>(this.context).add(ResetLiXi(true));
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 30, right: 30),
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBrown,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),

                      child: Text( Language.of(context).getText("li_xi.tiep_tuc"),style: AppTheme.body1,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
