import 'package:blurry/blurry.dart';
import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BlurryDemo(),
    );
  }
}

class BlurryDemo extends StatelessWidget {
  const BlurryDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blurry package demo'),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.info(
                    layoutType: LayoutType.rtl,
                    title: 'المعلومات ضبابية',
                    description:
                        'اربك تكست هو اول موقع يسمح لزواره الكرام بتحويل الكتابة العربي الى كتابة مفهومة',
                    confirmButtonText: 'يتأكد',
                    cancelButtonText: 'يلغي',
                    titleTextStyle: const TextStyle(fontFamily: 'Zen'),
                    popupHeight: 300,
                    buttonTextStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Zen'),
                    descriptionTextStyle: const TextStyle(fontFamily: 'Zen'),
                    onConfirmButtonPressed: () {},
                  ).show(context);
                },
                child: const Text('Info blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.success(
                    title: 'Success blurry',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                    barrierColor: Colors.white.withOpacity(0.7),
                    dismissable: false,
                  ).show(context);
                },
                child: const Text('Success blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.error(
                    title: 'Error blurry',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                  ).show(context);
                },
                child: const Text('Error blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.warning(
                    title: 'Warning blurry',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                  ).show(context);
                },
                child: const Text('Warning blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry(
                    icon: Icons.verified_user,
                    themeColor: Colors.purple,
                    title: 'Custom blurry',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                  ).show(context);
                },
                child: const Text('Custom blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.input(
                    title: 'Blurry Input',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                    inputLabel: 'Email',
                    themeColor: Colors.red,
                    icon: Icons.reduce_capacity_outlined,
                    inputTextController: TextEditingController(),
                  ).show(context);
                },
                child: const Text('Input blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  var textController = TextEditingController();
                  Blurry.input(
                    title: 'Blurry Code Input',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {},
                    inputLabel: 'Code',
                    defaultTheme: DefaultThemes.info,
                    inputTextController: textController,
                    textInputType: TextInputType.number,
                  ).show(context);
                },
                child: const Text('Number Input blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  var textController = TextEditingController();
                  Blurry.password(
                    title: 'Blurry Code Input',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    confirmButtonText: 'Confirm',
                    onConfirmButtonPressed: () {
                      Navigator.pop(context);
                    },
                    inputLabel: 'Password',
                    defaultTheme: DefaultThemes.info,
                    inputTextController: textController,
                  ).show(context);
                },
                child: const Text('Password input blurry dialog'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Blurry.singleChoiceSelector(
                    items: List.generate(
                      5,
                      (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text('Name: User $index'),
                            subtitle: Text('Age : ${index * 20}'),
                          )),
                    ),
                    title: 'Blurry Single selector',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    themeColor: Colors.pink,
                    icon: Icons.account_circle_outlined,
                    popupHeight: 300,
                  ).show(context);
                },
                child: const Text('Single choice selector'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
