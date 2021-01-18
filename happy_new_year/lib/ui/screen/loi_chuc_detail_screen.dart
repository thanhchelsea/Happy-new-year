import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/routes.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/ultils.dart';

class LoiChucDetailScreen extends StatefulWidget {
  const LoiChucDetailScreen({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _LoiChucDetailScreenState createState() => _LoiChucDetailScreenState();
}

class _LoiChucDetailScreenState extends State<LoiChucDetailScreen> {

  Future _shareMessage(String content) async {
    try {
      Share.text('title', content, 'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }
  void showDemoDialog({BuildContext context,bool isShowsaveimage, int index}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogConfirmText(
        barrierDismissible: true,
        isShowSaveImage: isShowsaveimage,
        isTaoThiepScreen: false,
        index: index,
      ),
    );
  }

  Widget bodyLoiChucDetail(BuildContext context, List<LoiChuc> list) {
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
                return itemLoiChuc(context, list, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemLoiChuc(BuildContext context, List<LoiChuc> list, int currentIndex) {
    //final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String content = list[currentIndex].content;
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
                padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
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
                          itemControl(Icons.question_answer_outlined, 'Gửi tin nhắn', ()  {
                            _shareMessage(content);
                          }),
                          itemControl(Icons.copy_outlined, 'Sao chép', () {
                            Clipboard.setData(ClipboardData(text: content)).then((value) {
                              final snackBar = SnackBar(
                                content: Text('Copied to Clipboard'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            });
                          }),
                          itemControl(Icons.edit_outlined, 'Chỉnh sửa', () {
                            BlocProvider.of<TaoThiepBloc>(context).add(ChangeText(content));
                            showDemoDialog(context: context, index: currentIndex);
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
          Icon(icon, color: AppTheme.white,),
          SizedBox(height: 4,),
          Text(title, style: TextStyle(
            color: AppTheme.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),),
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<LoiChucBloc>(context).add(LoiChucFetched(topic: widget.title));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'loi_chuc.${widget.title}',
      iconBack: true,
      body: BlocBuilder<LoiChucBloc, LoiChucState>(
        builder: (context, state) {
          if (state is LoiChucIntital) {
            return Center(
              child: Text('Loi Chuc'),
            );
          }
          if (state is LoiChucLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoiChucLoadSuccess) {
            print('Success');
            return bodyLoiChucDetail(context, state.list);
          }
          return Center(
            child: Text('Fail to Load'),
          );
        },
      ),
    );
  }
}

