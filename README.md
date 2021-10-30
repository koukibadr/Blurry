
#  Blurry Dialog

  

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/blurry_logo.gif?raw=true"  height="400"/>
</p>

  

##  Features

  

- Display simple blurry dialog popup
- Offer built-in themes
- Possibility to create you custom dialog
- Button click handler callbacks
- Customizable text
- Customizable barrier color and behavior
- Customize popup size

  

##  Getting started

To use the blurry dialog package you need to add it in `pubspec.yaml` file

```yaml
dependencies:
	blurry: ^1.0.1
```

##  Usage

###  Parameters
```dart
///the dialog popup title, required in all blurry class constructors
final  String title;


///the dialog description text
///required in all blurry class constructors
final  String description;


///the cancel button text, by default it's 'Cancel'
final  String cancelButtonText;


///the confirm button (primary button) text string
final  String confirmButtonText;


///the dialog theme color
///will be applied on buttons and icon
///not available in default types constructors (info, error, warning, success)
late  Color? themeColor;


///function invoked when the primary button is pressed
///required in all constructors
final  Function onConfirmButtonPressed;


///the callback that will be invoked when pressing on cancel button
final  Function? onCancelButtonPressed;


///the icon that will be rendered in the dialog
///required only when using the default constructor
late  IconData icon;


///title text style, by default it's null
final  TextStyle? titleTextStyle;


///description text style, by default it's null
final  TextStyle? descriptionTextStyle;


///button text style, by default it's null
//if it's not null the button text will be bold alongside with other style attributes
final  TextStyle? buttonTextStyle;


///the blurry dialog popup height
final  double? popupHeight;


///indicate whether the cancel button will be rendered or not
///by default the cancel button is displayed
final  bool displayCancelButton;


///indicates whether the popup dialog is dismissable or not
///by default [dismissable = true]
final  bool dismissable;


///the color of the barrier of the burry dialog
///if it's null the barrier color will be the default color [Colors.black54]
final  Color? barrierColor;
```

  

###  Examples

**Info style blurry package**

```dart
Blurry.info(
	title:  'Info blurry',
	description:
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntut labore et dolore magna aliqua. Ut enim ad minim veniam',
	confirmButtonText:  'Confirm',
	titleTextStyle: const  TextStyle(fontFamily:  'Zen'),
	popupHeight:  300,
	buttonTextStyle:  const  TextStyle(
		decoration:  TextDecoration.underline,
		fontFamily:  'Zen'
	),
	descriptionTextStyle:  const  TextStyle(fontFamily:  'Zen'),
	onConfirmButtonPressed: () {})
.show(context);
```

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/info_blurry_example.png?raw=true"  height="500"/>
</p>


**Success style blurry package**


```dart
Blurry.success(
	title:  'Success blurry',
	description:
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
	confirmButtonText:  'Confirm',
	onConfirmButtonPressed: () {},
	barrierColor:  Colors.white.withOpacity(0.7),
	dismissable:  false,)
.show(context);
```

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/success_blurry_example.png?raw=true"  height="500"/>
</p>

  

**Error style blurry package**

```dart

Blurry.error(
title:  'Error blurry',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun',
confirmButtonText:  'Confirm',
onConfirmButtonPressed: () {
	print('hello world');
})
.show(context);
```

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/error_blurry_example.png?raw=true"  height="500"/>
</p>

  

**Warning style blurry package**

```dart
Blurry.warning(
	title:  'Warning blurry',
	description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun',
	confirmButtonText:  'Confirm',
	onConfirmButtonPressed: () {
		print('hello world');
	})
.show(context);
```

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/warning_blurry_example.png?raw=true"  height="500"/>
</p>

  

**Custom style blurry package**

```dart
Blurry(
	icon: Icons.verified_user,
	themeColor: Colors.purple,
	title:  'Custom blurry',
	description:  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
	confirmButtonText:  'Confirm',
	onConfirmButtonPressed: () {})
.show(context);

```

<p  align="center">
<img  src="https://github.com/koukibadr/Blurry/blob/main/example/custom_blurry_example.png?raw=true"  height="500"/>
</p>

  

##  Contribution

Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Blurry)

-  If you **found a bug**, open an issue.
-  If you **have a feature request**, open an issue.
-  If you **want to contribute**, submit a pull request.