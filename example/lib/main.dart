import 'package:flutter/material.dart';
import 'package:inogami_ui/inogami_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyDimensions.width(context),
        height: MyDimensions.height(context),
        color: Colors.amber,
        child: MyBottomNavBar(
          mainPages: [
            Container(
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showMyAnimatedSnackBar(
                      context: context,
                      dataToDisplay:
                          "Hello, I'm a custom SnackBar JKNDaj dajba hjbadhabdb ajdbadha dahdbuirh kwnfoin ehb wiwf f efw!",
                      // "Hello, I'm a custom SnackBar",
                      enableBlurEffect: false,
                      borderColor: Colors.grey.shade600,
                      borderWidth: 2,
                    );
                  },
                  child: Text("Show SnackBar"),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: MyTextField(
                  labelText: "username",
                  prefixIcon: Icons.person_outline_rounded,
                  textController: TextEditingController(),
                  borderRadius: 10,
                  borderWidth: 2,
                  borderColor: Colors.grey.shade600,
                  activeBorderColor: Colors.black,
                ),
              ),
            ),
            Container(color: Colors.red),
            Container(color: Colors.orange),
          ],
          navBarItems: [
            MyNavBarItem(label: "Home", icon: Icon(Icons.home_rounded)),
            MyNavBarItem(label: "Search", icon: Icon(Icons.search)),
            MyNavBarItem(label: "Settings", icon: Icon(Icons.settings)),
            MyNavBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
