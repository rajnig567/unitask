part of 'extension.dart';

extension XBuildContext on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  void showErrorDialog({required String title, required String message}) {
    if(Platform.isIOS){
      showCupertinoDialog(
        context: this,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(this);
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(this);
                },
              ),
            ],
          );
        },
      );
    }
  }

}
