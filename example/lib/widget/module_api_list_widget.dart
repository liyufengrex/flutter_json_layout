import 'package:example/ex/ex_widget.dart';
import 'package:example/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../api/api_config.dart';
import '../page/api_detail_page.dart';

class ModuleApiListWidget extends StatelessWidget {
  const ModuleApiListWidget({Key? key}) : super(key: key);

  static const _apiList = <ApiEnum>[
    ApiEnum.text,
    ApiEnum.colum,
    ApiEnum.row,
    ApiEnum.sizeBox,
    ApiEnum.divider,
    ApiEnum.flex,
    ApiEnum.empty,
    ApiEnum.padding,
    ApiEnum.richText,
    ApiEnum.barcode,
    ApiEnum.ifElse,
  ];

  @override
  Widget build(BuildContext context) {
    return GroupWidget([
      const GroupTitle('支持的元素控件', fontSize: 15),
      SizedBox(height: 10.w),
      const DescText('用于填充 content 组成布局文件'),
      SizedBox(height: 10.w),
      const DescText(''),
      const DescText(''),
      const DescText(''),
      SizedBox(height: 21.w),
      ListView.separated(
        shrinkWrap: true,
        itemCount: _apiList.length,
        itemBuilder: (context, index) => _ItemWidget(
          apiEnum: _apiList[index],
        ),
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Theme.of(context).dividerColor,
          );
        },
      ).withContainerBorder()
    ]);
  }
}

class _ItemWidget extends StatelessWidget {
  final ApiEnum apiEnum;

  const _ItemWidget({
    Key? key,
    required this.apiEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ApiDetailPage(
                apiEnum: apiEnum,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 10.w,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            apiEnum.titleDesc,
            style: TextStyle(
              fontSize: 9.w,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
