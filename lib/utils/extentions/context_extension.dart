part of 'extension.dart';

extension XBuildContext on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  void showAlertDialog({
    required String title,
    required String message,
    required String btn1Text,
    String btn2Text = 'Cancel',
    required VoidCallback btn1Tap,
  }) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: this,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(this);
                  btn1Tap();
                },
                child: Text(btn1Text),
              ),
              CupertinoDialogAction(
                child: Text(btn2Text),
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
                child: Text(btn1Text),
                onPressed: () {
                  Navigator.pop(this);
                  btn1Tap();
                },
              ),
              TextButton(
                child: Text(btn2Text),
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

  void showErrorDialog({required String title, required String message}) {
    if (Platform.isIOS) {
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
