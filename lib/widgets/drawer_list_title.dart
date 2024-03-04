import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';

class DrawerListTitle extends StatefulWidget {
  const DrawerListTitle({
    super.key,
    required this.textDrawer,
    required this.drawerIcons,
    required this.drawerMethod,
  });
  final String textDrawer;
  final IconData drawerIcons;
  final Widget drawerMethod;

  @override
  State<DrawerListTitle> createState() => _DrawerListTitleState();
}

class _DrawerListTitleState extends State<DrawerListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.drawerMethod,
          ),
        );
      },
      leading: Icon(
        widget.drawerIcons,
        color: Colors.white,
      ),
      title: Text(
        widget.textDrawer,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitech = false;
  // Color colorApp =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        title: const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      backgroundColor: containerColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Switch(
                value: isSwitech,
                onChanged: (value) {
                  setState(
                    () {
                      isSwitech = value;
                      if (isSwitech == false) {
                        // backGroundColor = Color.fromARGB(255, 13, 10, 27);
                      }
                    },
                  );
                },
              ),
              const Text(
                "Do you want switch app colors?",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
