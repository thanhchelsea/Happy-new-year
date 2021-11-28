import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/utils/utils.dart';

class DialogAddMoney extends StatefulWidget {
  const DialogAddMoney({
    Key key,
    this.barrierDismissible = true,
    this.money,
  }) : super(key: key);
  final bool barrierDismissible;
  final int money;
  @override
  DialogAddMoneyState createState() => DialogAddMoneyState();
}

class DialogAddMoneyState extends State<DialogAddMoney>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  BuildContext context1;

  Widget ButtonWidget() {
    return Container();
  }

  @override
  deactivate() {
    super.deactivate();
  }

  List<String> moneyVn = [
    "10.000",
    "20.000",
    "50.000",
    "100.000",
    "200.000",
    "500.000",
    "May mắn"
  ];
  List<String> moneySelect = [];
  Widget itemMoney(String money, IconData icon, state,{bool isDelete}) {
    return  InkWell(
      onTap: () {
        if (moneySelect.length <=8) {
        if(isDelete==null){
          setState(() {
            moneySelect.add(money);
          });
        }else{
          setState(() {
            moneySelect.remove(money);
          });
        }
        }
       else {
         if(isDelete!=null) {
           setState(() {
             moneySelect.remove(money);
           });
         }
         BlocProvider.of<LiXiBloc>(context).add((ErrorLength(true)));
        }
      },
      child: Container(
        margin: EdgeInsets.all(2),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.nearlyDarkBrown,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.all(6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Center(
                    child: AutoSizeText(
                      money,
                      maxLines: 1,
                      style: TextStyle(color: AppTheme.nearlyBlack),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Icon(
                      icon,
                      size: 14,
                      color: AppTheme.lightText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey1,
      backgroundColor: Colors.transparent,
      body: BlocConsumer<LiXiBloc, LiXiState>(
        listener: (context, state) {
          if(state is Error){
            _scaffoldKey1.currentState.showSnackBar(new SnackBar(content: new Text(Language.of(context).getText("li_xi.error"))));
          }
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.notWhite,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.nearlyYellow.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 300,
                  height: 0.6 * DeviceUtil.getDeviceHeight(context),
                  //   color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: Image(
                              image: AssetImage(AppImages.ICON_DIALOG_LIXI),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          padding: EdgeInsets.only(
                            left: 6,
                          ),
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 6, bottom: 6),
                                child: Text(
                                  Language.of(context).getText("li_xi.da_chon"),
                                  style: AppTheme.subtitle,
                                ),
                              ),
                              moneySelect.isNotEmpty
                                  ? Container(
                                      width: 300,
                                      height: 100,
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        childAspectRatio: 300 / 100,
                                        padding: const EdgeInsets.all(4.0),
                                        mainAxisSpacing: 1,
                                        crossAxisSpacing: 0.1,
                                        children: List.generate(
                                          moneySelect.length,
                                          (index) => itemMoney(
                                              moneySelect[index],
                                              Icons.cancel,
                                              state,
                                              isDelete:true),
                                        ),
                                        // children: <Widget>[
                                        // Text("fdfd")
                                        // ],
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Container(
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                          Language.of(context).getText(
                                            "li_xi.chon_menh_gia",
                                          ),
                                          style: AppTheme.caption,
                                        )),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: AppTheme.nearlyDarkBlue,
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          padding: EdgeInsets.only(
                            left: 6,
                          ),
                          width: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 5),
                                  child: Text(
                                    Language.of(context)
                                        .getText("li_xi.menh_gia"),
                                    style: AppTheme.subtitle,
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      itemMoney(
                                        moneyVn[0],
                                        Icons.add_circle,state
                                      ),
                                      itemMoney(
                                        moneyVn[1],
                                        Icons.add_circle,state
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      itemMoney(
                                        moneyVn[2],
                                        Icons.add_circle,state
                                      ),
                                      itemMoney(
                                        moneyVn[3],
                                        Icons.add_circle,state
                                      ),
                                      itemMoney(
                                        moneyVn[4],
                                        Icons.add_circle,state
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      itemMoney(
                                        moneyVn[5],
                                        Icons.add_circle,state
                                      ),
                                      itemMoney(
                                        moneyVn[6],
                                        Icons.add_circle,state
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: AppTheme.nearlyDarkBlue,
                      ),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 3, bottom: 3),
                                child: InkWell(
                                  onTap: () {
                                    //  BlocProvider.of<LiXiBloc>(this.context).add(ResetLiXi(true));
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      Language.of(context)
                                          .getText("xac_nhan.huy"),
                                      style: TextStyle(
                                        color: AppTheme.deactivatedText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, bottom: 3),
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<LiXiBloc>(this.context)
                                        .add(ConfirmListLiXi(moneySelect));
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      Language.of(context)
                                          .getText("xac_nhan.xac_nhan"),
                                      style: TextStyle(
                                        color: AppTheme.nearlyDarkBrown,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
