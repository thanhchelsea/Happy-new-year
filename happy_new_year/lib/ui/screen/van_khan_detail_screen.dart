import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/utils.dart';
import 'package:path/path.dart';

import '../../locator.dart';

class VanKhanDetailScreen extends StatelessWidget {
  const VanKhanDetailScreen({Key key, @required this.groupModel}) : super(key: key);
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VanKhanBloc>(
      create: (context) => VanKhanBloc(locator())..add(VanKhanFetched(groupId: groupModel.id)),
      child: BaseScreen(
        title: 'home.van_khan',
        iconBack: true,
        body: BlocBuilder<VanKhanBloc, VanKhanState>(
          builder: (context, state) {
            print(state.listOfVanKhan);
            if (state is VanKhanLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is VanKhanLoadSuccess) {
              return _bodyVanKhanDetail(context, state.listOfVanKhan);
            }
            return Center(
              child: Text('Fail to Load'),
            );
          },
        ),
      ),
    );
  }

  Widget _bodyVanKhanDetail(BuildContext context, List<VanKhanModel> list) {
    return Container(
      width: DeviceUtil.getDeviceWidth(context),
      height: DeviceUtil.getDeviceHeight(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage(AppImages.ANH_NEN1),
            fit: BoxFit.fill,
            height: DeviceUtil.getDeviceHeight(context),
            width: DeviceUtil.getDeviceWidth(context),
            alignment: Alignment.center,
          ),
          Center(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _itemVanKhan(context, list[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemVanKhan(context, VanKhanModel vanKhan) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppTheme.red,
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              vanKhan.groupName,
              style: TextStyle(fontSize: 18, color: AppTheme.nearlyYellow),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vanKhanSection('Ý nghĩa', vanKhan.meaning),
                  SizedBox(height: 16),
                  _vanKhanSection('Sắm lễ', vanKhan.samle),
                  SizedBox(height: 16),
                  _vanKhanSection('Văn khấn', vanKhan.vankhan),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _vanKhanSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: AppTheme.nearlyYellow,
          ),
        ),
        SizedBox(height: 16),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.nearlyYellow,
          ),
        ),
      ],
    );
  }
}
