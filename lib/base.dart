
import 'package:flutter/material.dart';
import 'package:todo/screens/login/Login_with_mvvm/connector.dart';

abstract class BaseConnector {
  showLoading();

  showMessage(String message);

  hideLoading();


}

class BaseViewModel<CON extends BaseConnector> extends ChangeNotifier {
  CON? connetor;
}

abstract class BaseView<VM extends BaseViewModel, S extends StatefulWidget>
    extends State<S>
    implements BaseConnector {
  late VM viewmodel;
 VM initMyViewModel();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel=initMyViewModel();
  }

  @override
  hideLoading() {
    // TODO: implement hideLoading
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(context: context,
      barrierDismissible: false,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(child: CircularProgressIndicator()),),);
  }

  @override
  showMessage(String message) {
    showDialog(context: context,
      barrierDismissible: false,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.transparent,
            title: Text("Error"),
            content: Text(message),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Okay"))
            ],
          ),);
  }

}