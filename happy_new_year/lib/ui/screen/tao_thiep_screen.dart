import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/ui/widget/base_screen_widget.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/ui/widget/widget_to_image.dart';
import 'package:happy_new_year/utils/common.dart';
import 'package:happy_new_year/utils/device.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TaoThiepScreen extends StatefulWidget {
  @override
  _TaoThiepScreenState createState() => _TaoThiepScreenState();
}

class _TaoThiepScreenState extends State<TaoThiepScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      iconBack: true,
      title: "home.tao_thiep",
      body: BodyThiep(),
    );
  }
}

class BodyThiep extends StatefulWidget {
  @override
  _BodyThiepState createState() => _BodyThiepState();
}

class _BodyThiepState extends State<BodyThiep> {
  bool isShowSelection = true;
  bool isLoiChuc = false,
      isDoiNen = false,
      isDoiKieuChu = false,
      isThuVienThiep = false;
  List<ListItemSlect> listItem = [];
  int currentIndex;

  Uint8List bytes1;
  GlobalKey key1;

  _saveImage() async {
    this.bytes1 = bytes1;
    try {
      final bytes1 = await Common.capture(key1);
      if (!(await Permission.storage.status.isGranted))
        await Permission.storage.request();
     await ImageGallerySaver.saveImage(bytes1, quality: 80);
      showDemoDialog(context: context, isShowsaveimage: true);
    } catch (e) {
      print(e.toString());
    }
  }

  _shareImages() async {
    this.bytes1 = bytes1;
    try {
      final bytes1 = await Common.capture(key1);
      await Share.files(
          'esys images',
          {
            'esys.png': bytes1.buffer.asUint8List(),
          },
          'image/png');
    } catch (e) {
      print('error: $e');
    }
  }

  Widget item(String title, IconData icon, int index) {
    return InkWell(
      onTap: () {
        if (index != currentIndex) {
          setState(() {
            currentIndex = index;
            isShowSelection = true;
          });
        } else {
          setState(() {
            currentIndex = index;
            isShowSelection = !isShowSelection;
          });
        }

        setState(() {
          //  isShowSelection = !isShowSelection;
          switch (index) {
            case 0:
              {
                isLoiChuc = true;
                isDoiNen = false;
                isDoiKieuChu = false;
                isThuVienThiep = false;
                // tao dialog tai day
                showDemoDialog(context: context);
                break;
              }
            case 1:
              {
                isDoiNen = true;
                isLoiChuc = false;
                isDoiKieuChu = false;
                isThuVienThiep = false;
                break;
              }
            case 2:
              {
                isDoiKieuChu = true;
                isLoiChuc = false;
                isDoiNen = false;
                isThuVienThiep = false;
                break;
              }
            case 3:
              {
                isThuVienThiep = true;
                isLoiChuc = false;
                isDoiNen = false;
                isDoiKieuChu = false;
                break;
              }
            case 4:
              {
                _shareImages();
                break;
              }
            case 5:
              {
                print("luu");
                _saveImage();
              }
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Icon(
                icon,
                color: AppTheme.nealyRed,
                size: 24,
              ),
            ),
            Container(
              child: Text(
                Language.of(context).getText(title),
                style: AppTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDemoDialog({BuildContext context, state, isShowsaveimage}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogConfirmText(
        barrierDismissible: true,
        isShowSaveImage: isShowsaveimage,
      ),
    );
  }

  String contentText = "Chúc mừng năm mới 2021";
  TextStyle fontText = GoogleFonts.rye(
    fontSize: 14,
    color: AppTheme.nearlyDarkBrown,
  );
  Offset position = Offset.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    position = new Offset(50, 50);
  }

  @override
  Widget build(BuildContext context) {
    listItem.add(new ListItemSlect("tao_thiep.loi_chuc", Icons.title));
    listItem
        .add(new ListItemSlect("tao_thiep.doi_phong_nen", Icons.aspect_ratio));
    listItem.add(new ListItemSlect("tao_thiep.font_chuc", Icons.format_italic));
    listItem.add(
        new ListItemSlect("tao_thiep.thu_vien_loi_chuc", Icons.receipt)); //
    listItem.add(new ListItemSlect("tao_thiep.chia_se", Icons.share));
    listItem.add(new ListItemSlect("tao_thiep.luu", Icons.save_alt));
    return BlocConsumer<TaoThiepBloc, TaoThiepState>(
      listener: (context, state) {
        // pinyonScript , lato ,share ,zeyada,yesevaOne,rye
        switch (state.font) {
          case "1":
            {
              setState(() {
                fontText = GoogleFonts.pinyonScript(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });
              break;
            }
          case "2":
            {
              setState(() {
                fontText = GoogleFonts.lato(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });
              break;
            }
          case "3":
            {
              setState(() {
                fontText = GoogleFonts.share(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });
              break;
            }
          case "4":
            {
              setState(() {
                fontText = GoogleFonts.tangerine(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });
              break;
            }
          case "5":
            {
              setState(() {
                fontText = GoogleFonts.yesevaOne(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });
              break;
            }
          case "0":
            {
              setState(() {
                fontText = GoogleFonts.rye(
                  fontSize: double.parse((state.size.toString())),
                  color: state.color,
                );
              });

              break;
            }
        }
      },
      builder: (context, state) {
        return Container(
          color: AppTheme.black,
          alignment: Alignment.center,
          width: DeviceUtil.getDeviceWidth(context),
          height: DeviceUtil.getDeviceHeight(context) - 70,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.center,
                  child: WidgetToImage(
                    builder: (key) {
                      this.key1 = key;
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(state.image),
                          ),
                          Positioned(
                            left: position.dx, //right: position.dx,
                            top: position.dy, //bottom: position.dy,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  position = Offset(
                                      position.dx + details.delta.dx,
                                      position.dy + details.delta.dy);
                                });
                              },
                              child: Container(
                                child: Text(
                                  state.loiChuc,
                                  textAlign: TextAlign.center,
                                  style: fontText,
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        isShowSelection
                            ? ItemSelect(
                                isLoiChuc: isLoiChuc,
                                isDoiKieuChu: isDoiKieuChu,
                                isDoiNen: isDoiNen,
                                isThuVienThiep: isThuVienThiep,
                              )
                            : Container(),
                        Container(
                          alignment: Alignment.center,
                          color: AppTheme.white,
                          width: DeviceUtil.getDeviceWidth(context),
                          height: (1 / 9) * DeviceUtil.getDeviceHeight(context),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                6,
                                (index) => item(listItem[index].title,
                                    listItem[index].icon, index),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListItemSlect {
  String title;
  IconData icon;

  ListItemSlect(this.title, this.icon);
}

class ItemSelect extends StatefulWidget {
  bool isLoiChuc, isDoiNen, isDoiKieuChu, isThuVienThiep;
  ItemSelect({
    this.isLoiChuc,
    this.isDoiNen,
    this.isDoiKieuChu,
    this.isThuVienThiep,
  });

  @override
  _ItemSelectState createState() => _ItemSelectState();
}

class _ItemSelectState extends State<ItemSelect> {
  List<String> listImage = [];
  List<Color> listColor = [];
  // List<String> fontText = [];
  List<TextStyle> fontText = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listImage.add(AppImages.THIEP6);
    listImage.add(AppImages.THIEP1);
    listImage.add(AppImages.THIEP7);
    listImage.add(AppImages.THIEP2);
    listImage.add(AppImages.THIEP3);
    listImage.add(AppImages.THIEP4);
    listImage.add(AppImages.THIEP5);
    listImage.add(AppImages.ANH_NEN7);

    listColor.add(Color(0xfffdcb6e));
    listColor.add(Color(0xff2d3436));
    listColor.add(Color(0xffd63031));
    listColor.add(Color(0xff9b59b6));
    listColor.add(Color(0xffffffff));
    listColor.add(Color(0xff16a085));
    listColor.add(Color(0xff74b9ff));
    listColor.add(Color(0xfffd79a8));
    listColor.add(Color(0xff00b894));

    fontText.add(
      GoogleFonts.rye(
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
    fontText.add(
      GoogleFonts.pinyonScript(
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
    fontText.add(
      GoogleFonts.lato(
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
    fontText.add(
      GoogleFonts.share(
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
    fontText.add(
      GoogleFonts.tangerine(
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
    fontText.add(
      GoogleFonts.yesevaOne(
        //pinyonScript , lato ,share ,zeyada,yesevaOne,rye
        fontSize: 14,
        color: AppTheme.black,
      ),
    );
  }

  int valueHolder = 20;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaoThiepBloc, TaoThiepState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: widget.isLoiChuc == null &&
                  widget.isDoiNen == null &&
                  widget.isDoiKieuChu == null &&
                  widget.isThuVienThiep == null
              ? EdgeInsets.all(0)
              : EdgeInsets.all(10),
          width: DeviceUtil.getDeviceWidth(context),
          decoration: BoxDecoration(color: AppTheme.white),
          child: Stack(
            children: <Widget>[
              widget.isThuVienThiep && widget.isThuVienThiep == true
                  ? Container(
                      width: DeviceUtil.getDeviceWidth(context),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            listImage.length,
                            (index) => InkWell(
                              onTap: () {
                                BlocProvider.of<TaoThiepBloc>(context)
                                    .add(ChoseImage(listImage[index]));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                color: Colors.blue,
                                child: Image(
                                  //   width: DeviceUtil.getDeviceWidth(context) / 5,
                                  height: 50,
                                  image: AssetImage(listImage[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              widget.isDoiNen && widget.isDoiNen == true
                  ? Container(
                      width: DeviceUtil.getDeviceWidth(context),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            listImage.length,
                            (index) => InkWell(
                              onTap: () {
                                BlocProvider.of<TaoThiepBloc>(context)
                                    .add(ChoseImage(listImage[index]));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                color: Colors.blue,
                                child: Image(
                                  //   width: DeviceUtil.getDeviceWidth(context) / 5,
                                  height: 50,
                                  image: AssetImage(listImage[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              widget.isDoiKieuChu && widget.isDoiKieuChu == true
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              Language.of(context).getText("tao_thiep.mau_chu"),
                              style: AppTheme.caption,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    listColor.length,
                                    (index) => InkWell(
                                          onTap: () {
                                            BlocProvider.of<TaoThiepBloc>(
                                                    context)
                                                .add(ChangColor(
                                                    listColor[index]));
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: listColor[index],
                                              border: Border.all(
                                                color: AppTheme.nearlyYellow,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                          ),
                          Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Language.of(context)
                                        .getText("tao_thiep.co_chu") +
                                    ": ",
                                style: AppTheme.caption,
                              ),
                              Text(
                                ' $valueHolder',
                                style: AppTheme.body3,
                              ),
                            ],
                          )),
                          Center(
                              child: Column(children: [
                            Container(
//                            margin: EdgeInsets.only(bottom: 15),
                              child: Slider(
                                value: valueHolder.toDouble(),
                                min: 1,
                                max: 30,
                                divisions: 50,
                                activeColor: AppTheme.nearlyYellow,
                                inactiveColor: AppTheme.nearlyYellow,
                                label: '${valueHolder.round()}',
                                onChanged: (double newValue) {
                                  setState(() {
                                    valueHolder = newValue.round();
                                  });
                                  BlocProvider.of<TaoThiepBloc>(context)
                                      .add(ChangeSize(valueHolder));
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()}';
                                },
                              ),
                            ),
                          ])),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              Language.of(context)
                                  .getText("tao_thiep.kieu_chu"),
                              style: AppTheme.caption,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    fontText.length,
                                    (index) => InkWell(
                                          onTap: () {
                                            BlocProvider.of<TaoThiepBloc>(
                                                    context)
                                                .add(
                                              ChangeFont(
                                                index.toString(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              "New Year",
                                              style: fontText[index],
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
