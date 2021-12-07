import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:flip_card/flip_card.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
class LiXiItem extends StatefulWidget {
  int i;

  LiXiItem({this.i});

  @override
  _LixiItemState createState() => _LixiItemState();
}

class _LixiItemState extends State<LiXiItem> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<LiXiBloc,LiXiState>(
        listener: (context, state) {
          if(state is ResetLiXiState){
            if(cardKey.currentState.isFront==false){
              cardKey.currentState.toggleCard();
            }
          }
          else{
           // cardKey.currentState.;
          }
        },
        builder: (context, state) {
          return FlipCard(
            key: cardKey,
            flipOnTouch: false,
            front: InkWell(
              onTap: (){
                showDemoDialog(context: context,state:state.tien[widget.i]);
                BlocProvider.of<LiXiBloc>(context).add(ChonLiXi(true));
                cardKey.currentState.toggleCard();
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: AppTheme.nearlyYellow),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.ICON_LIXI),
                          fit: BoxFit.fitHeight,
                          height: 200,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            back: InkWell(
              onTap: (){
                cardKey.currentState.toggleCard();
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: AppTheme.nearlyYellow),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.ICON_LIXI2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      );
    }
  void showDemoDialog({BuildContext context,state}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogConfirmReport(
        barrierDismissible: true,
        money: state,
      ),
    );
  }
}


