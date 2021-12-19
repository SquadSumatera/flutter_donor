import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_donor/get_x/controller/request_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

class RequestLetterWidget extends StatelessWidget {
  final RequestController requestGetX = Get.find();
  int index;
  String type;
  String fileName;
  RequestLetterWidget(
      {Key? key,
      required this.index,
      required this.type,
      required this.fileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            width: 150,
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: AppColor.cGrey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 80,
                    child: Text(
                      fileName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColor.cGrey,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      requestGetX.removeListDocs(index);
                    },
                    child: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
