import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/screens/wrapper.dart';
import 'package:corona_karma/services/auth.dart';
import 'package:corona_karma/services/chat.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'models/chat.dart';

void main() {
  timeago.setLocaleMessages('de', timeago.DeMessages());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<User>.value(value: AuthService().user),
          StreamProvider<Iterable<Chat>>(
              create: (context) =>
                  ChatService(Provider.of<User>(context, listen: false).uid)
                      .chats),
        ],
        child: CupertinoApp(
          home: Wrapper(),
        ));
  }
}
