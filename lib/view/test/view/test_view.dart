import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/base/view/base_view.dart';
import '../view_model/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Network Service Test"),
            ),
            body: Center(
              child: viewmodel.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Observer(
                          builder: (context) => Text(viewmodel.data.toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: viewmodel.getData,
                                child: Text("get data")),
                            SizedBox(
                              width: 10.w,
                            ),
                            ElevatedButton(
                                onPressed: viewmodel.postData,
                                child: Text("post data"))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
            ));
      },
    );
  }
}
