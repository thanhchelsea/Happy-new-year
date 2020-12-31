import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/ui/widget/base_screen_widget.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/device.dart';

class LiXiScreen extends StatefulWidget {
  @override
  _LiXiScreenState createState() => _LiXiScreenState();
}

class _LiXiScreenState extends State<LiXiScreen> {
  void showDemoDialog({BuildContext context,state}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogAddMoney(
        barrierDismissible: true,
        money: state,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      iconBack: true,
      title: "home.li_xi",
      iconMenu: Icon(Icons.monetization_on,color: AppTheme.nearlyDarkBrown,size: 30,),
      menuMethod:(){showDemoDialog(context:context);},
      body: Lixi(),
    );
  }
}

class Lixi extends StatelessWidget {
  void showDemoDialog({BuildContext context,state}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogAddMoney(
        barrierDismissible: true,
        money: state,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final double itemHeight = (DeviceUtil.getDeviceHeight(context)) / 2;
    final double itemWidth = DeviceUtil.getDeviceWidth(context) / 1.7;
    return BlocConsumer<LiXiBloc, LiXiState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: DeviceUtil.getDeviceWidth(context),
          height: DeviceUtil.getDeviceHeight(context),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(AppImages.BACKGROUND_LIXI),
                fit: BoxFit.cover,
                height: DeviceUtil.getDeviceHeight(context),
                width: DeviceUtil.getDeviceWidth(context),
                alignment: Alignment.center,
              ),
              Center(
                // width: 100,height: 100,
                child: state.tien.isNotEmpty ?GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.tien.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    (orientation == Orientation.portrait) ? 3 : 4,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (context, index) {
                    return LiXiItem(i: index);
                  },
                ):
                InkWell(
                  onTap: (){
                    showDemoDialog(context:context);
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add,color: AppTheme.nearlyYellow,size: 25,),
                        Text("Lựa chọn mệnh giá lì xì",style: AppTheme.title,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
