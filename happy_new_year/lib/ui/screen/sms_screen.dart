import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/utils.dart';
import 'package:share/share.dart';

import '../../locator.dart';
import '../../routes.dart';

class SMSScreen extends StatelessWidget {
  const SMSScreen({Key key}) : super(key: key);

  Future _shareMessage(String content) async {
    try {
      try {
        //   Share.text('title', content, 'text/plain');
        Share.share(content, subject: "Lời chúc");
      } catch (e) {
        print('error: $e');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SMSBloc>(
      create: (context) => SMSBloc(locator())..add(GetSMS()),
      child: BaseScreen(
        title: 'home.sms_teen',
        iconBack: true,
        body: BlocBuilder<SMSBloc, SMSState>(
          builder: (context, state) {
            print(state.listOfSMS);
            if (state is SMSLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SMSLoadSuccess) {
              return bodySMSDetail(context, state.listOfSMS);
            }
            return Center(
              child: Text('Fail to Load'),
            );
          },
        ),
      ),
    );
  }

  Widget bodySMSDetail(BuildContext context, List<SMSTeenModel> list) {
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
                return itemSMS(context, list, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemSMS(BuildContext context, List<SMSTeenModel> list, int currentIndex) {
    final String content = list[currentIndex].info;
    print(list[currentIndex]);
    return InkWell(
      onTap: () {
        BlocProvider.of<TaoThiepBloc>(context).add(ChangeText(content));
        Navigator.pushNamed(context, Routes.taothiep);
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: AppTheme.nearlyYellow,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.red,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage(AppImages.ANH_GIF3),
                  // fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                // color:Colors.yellow,
                alignment: Alignment.topRight,
                child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage(AppImages.ANH_GIF3),
                  // fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 4, left: 16, right: 16),
                child: Column(
                  children: [
                    AutoSizeText(
                      content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.nearlyYellow,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          itemControl(
                              Icons.question_answer_outlined, 'Gửi tin nhắn',
                              () {
                            _shareMessage(content);
                          }),
                          itemControl(Icons.copy_outlined, 'Sao chép', () {
                            Clipboard.setData(ClipboardData(text: content))
                                .then((value) {
                              final snackBar = SnackBar(
                                content: Text('Copied to Clipboard'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            });
                          }),
                          itemControl(Icons.edit_outlined, 'Chỉnh sửa', () {
                            BlocProvider.of<TaoThiepBloc>(context)
                                .add(ChangeText(content));
                            DialogUtil.showSaveEdit(
                              context: context,
                              index: currentIndex,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemControl(IconData icon, String title, Function method) {
    return InkWell(
      onTap: method,
      child: Column(
        children: [
          Icon(
            icon,
            color: AppTheme.white,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
