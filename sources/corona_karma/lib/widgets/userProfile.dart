import 'package:flutter/cupertino.dart';

import '../styles.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key key, this.skills}) : super(key: key);

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    skills.insert(0, "Du kannst helfen beim:");

    return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              Container(
                  child: Image(
                      image: AssetImage("assets/profile.png"),
                      width: 91,
                      height: 91)),
              Spacer(),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills
                      .map(
                          (skill) => Text(skill, style: Styles.messageTimeText))
                      .toList(growable: false)),
              Spacer()
            ],
          ),
          Row(children: <Widget>[
            Spacer(),
            SizedBox(width: 91, height: 91),
            Spacer(),
            Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    border: Border.all(color: Styles.blue1),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text("    Profil bearbeiten   ",
                    style: Styles.editProfileButton)),
            Spacer(),
          ])
        ]));
  }
}
