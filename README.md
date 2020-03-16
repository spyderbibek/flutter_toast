# [fluttertoast](https://pub.dartlang.org/packages/fluttertoast)

Android and iOS Toast Library for Flutter

> Supported Platforms
> - Android
> - IOS

## Usage

```yaml
# add this line to your dependencies

```

```dart
import 'package:fluttertoast/fluttertoast.dart';
```

```dart
FlutterToast.showToast(
        message: "You message here",
        toastLength: ToastLength.LENGTH_SHORT
        );
```

| property        | description                                                        |
| --------------- | ------------------------------------------------------------------ |
| msg             | String (Not Null)(required)                                        |
| toastLength     | ToastLength.LENGTH_SHORT or ToastLength.LENGTH_LONG (optional)     |

## If you need any features suggest