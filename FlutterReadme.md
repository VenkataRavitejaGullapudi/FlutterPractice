# Flutter
- Its a tool that allows you to build native cross platform (ios, android) apps with one programming language and one codebase.
- It is both toolset and programming framework on dart language.
- Flutter app's UI as widget Tree.
- Flutter app is an application where the developer will built UI by adding widgets.
- Widgets are components or the building blocks of the UI. Here everything is almost a widget.

- Flutter consists of 
  #### Software Development Kit
    - Which contains tools to compile your code to native machine code directly + develop with ease.
  #### Framwork/Widget Library
    - Which contains Reusable UI building blocks(=widgets), utility functions, packages.
- Flutter is a framework(set of features) that built on dart i.e., its a dart framework, provides utility functions and UI elements(Widgets).

# Dart 
  - It is a object oriented programming language which is developed by google which focused on frontend(mobile apps, web) User interface(UI) development.



#### How flutter/dart transformed to a native app?
- In the app, we have the dart code which uses the flutter API/ framework consisting some utilities and widgets.
- And also we can have our own widgets.
- This Dart code is compiled in/using the flutter SDK to a native code directly which controls every pixel directly with high performance.
- Flutter doesnot use any platform primitives.[It means if we use **any other framework** and written some button then that is **converted** into the Android button or ios button but in **Flutter** the same button will have own custom implementation which will directly controls every pixel on the screen and will not convert into native equivalent code like other.]
- Flutter ships the code into its own flutter engine which take control of the each and every pixel on screen by its own.

#### Material Design 
  - It is a Design System created and heavily used by Google.
  - It is highly customizable and even works on IOS devices too.
  - We can also find apple style Cupertino widgets.

#### Flutter vs React Native vs Ionic

|Dart+Flutter|Js/Rect.js| Js|
|:------------|:-----------|:-------------|
|Compiled Native Apps | Partly Compiled Native apps(UI components) | Webview of Hosted web apps|
|Does not compile to IOS/Android UI components| Does Compile to IOS/Android UI components|Does not compile to IOS/Android UI components as its only a web view|
|Cross-Platform(mobile,desktop,web)|React-native mostly mobile apps(web apps also)|Cross-Platform(mobile,desktop,web)|
|Google|Facebook|Ionic|
______



## Section 1

- How a flutter app starts and works
- Working with widgets and Building Custome Widgets
- Reacting to User Events
- Stateless & Stateful Widgets
- Dart Fundamentals

### Flutter App Creation

- Install flutter in you system by downloading the zip file from [here](https://flutter.dev/docs/get-started/install)
- Extract it to the directory of your choice.
- And Copy the path to flutter folder and bin folder inside flutter.
- Paste it in the Environment variables of the computer to access it from anywhere(in command prompt).
- Setup your android studio especially the Android virtual device.(_Android studio IDE_ is not much configured or explained in this)
- If we want to run in the mobile we can also connect it and run by switching on usb debugging mode in mobile.
- Later download visual studio code and setup the flutter and dart extensions.
- Open the Command prompt (Go to the directory you want)
- To create an app first we need to run the following command to check all are setted up well if not,do the mentioned suggestions that appear when you run the following command.
  `flutter doctor`
- Later to create an app in your specific drive/folder go to that & run the following command
  `flutter create app_name`

### Running Flutter Application

- First, navigate to the flutter app (app_name) folder that you have created in the above step.
- Run the following command to run it on the android virtual device or your own mobile device connected on usb debugging, which is available.
  `flutter run`

### Going to Visual Studio

- Open the app folder in the Visual studio.
- You can see the main.dart file in the lib directory which is the main code of the app that previously ran in android device by using run command.
- Next we can open terminal directly in the visual studio bhy clicking on Terminal>New Terminal in top menu.
- We can directly run the `flutter run` command in that terminal or else we can run it by clicking on the Run>Run without debugging(or start debugging).
- Choose environment as Dart and flutter (if multiple environments are installed it will show generally or first time).
- Then it will automatically detect the device and install the app on the device.
- To auto format or document the code in a readable way in visual studio do as follows.
- Even we make changes in code while app is running, it will **hot reload the app**.
- Hot Reload means we no need to reload the app and the current state of the app is updated automatically.
- Preferences> Keyboard Shortcuts> Search for format document find the shortcut key binding to do that.
- Shift +Alt+F

### Directory Structure

- android/ios -> Its the folder where the flutter sdk manage the android application after build. Its a normal android/ios project. Mostly not used.
- build - which holds the o/p of the flutter application. Its also managed entirely by flutter that we not touched.
- lib - library folder where we add all the dart files and write code in it. Folder that we will deal with more.
- test is the folder for testing the app.
- gitignore is the file that specify some folders/files to stop uploading to git
- metadata - automatically managed by flutter and save some info to build app correctly.
- packages - dependencies and libraries file that is also managed by flutter
- flutter_complete_guide.iml - which has some internal dependencies and managed by sdk
- pubspec.yaml - This is a file that allow us to configure the packages even third parties, images, fonts etc.. can be done here.
- pubspec.lock - Generated automatically based on the .yaml above file.

**_main.dart:_**

- Holds all the code that renders our app.

- main() is the first function that app will start first.

# Dart Overview

- It is a strongly typed language and object oriented programming.
- main function is the starting point in the program.
- If the no type mentioned it will consider that as "dynamic" type.

  ```
  addNumbers(a,b){
    print(a+b);
    return a+b;
  }

  void main(){
    String name = "Ravi";
    dynamic a=34;
      print(name+a.toString());
      print(addNumbers(3,4));
  }

  ```

- To append variable in the string use the ${} in the quotes 'Hello $(user)' [consider user as variable].
- Comments is using '//'
- Always mentioning the type is preferred.
- Default uninitialised variable is null for max types.
- Types can be int,String, and all primitive types. And also var, const, dynamic 

### Classes and objects

```
  class Person{
    String name;
    int age;
  }

  var p1  = Person();

```

#### Constructors and Named arguments

- Named Parameters:
- These are parameters that can be passed in any order by passing the name of the parameter followed by the passed value. For example:
  `void sum({int num1, int num2});`. \
- This function is called like this:
  `sum(num1: 12, num2: 24);`
- The parameters mentioned in the `{}` will become optional by default.
- We need to pass default parameters as it will not raise compiler error even if we not passed the values in the function.
- But may have chance to break in runtime as null values come across.

```
class Person {
  String name;
  int age;
  // {} - specifies the named arguments where we can assign with name and age
  // We need to provide default values here as it also accept even if not passed any parameters.
  Person({String name='Dart', int age=10}){
    this.name = name;
    this.age = age;
  }
}


void main() {
  var p1 = Person(name:'Ravi', age:21);
  var p2 = Person();
  print(p1);
  dynamic age = p1.age;
  var name = p1.name;

  print(name + " " + age.toString());
  print("Second object details");
  print(p2.name+" "+p2.age.toString());
}

```

- Only in the **FLUTTER**, Instead of default values, we can use special annotation `@required` in front of [datatype val] to make the parameters mandatory.
- Shortcut for directly assigning the value passed to constructor into the instance variables.
  `Person({this.name = 'Dart',this.age=10});`
- In dart, we can also create a constructor with our own name by just Classname followed by '.' followed by name we want to assign to the constructor. 
  `Person.veryOld(this.name){ age=60 }`
  - Here veryOld is one type of constructor.
  - Here this.name will be directly assigned with the value that we got to the veryOld constructor and age is always set default to 60.

  ```
  class Person {
      String name;
      int age;
      // {} - specifies the named arguments where we can assign with name and age
      // We need to provide default values here as it also accept even if not passed any parameters
    //   Person({String name='Dart', int age=10}){
    //     this.name = name;
    //     this.age = age;
    //   }
      Person({this.name = 'Dart',this.age=10});
    }

    addNumbers(a, b) {
      print(a + b);
      return a + b;
    }

    void main() {
      var p1 = Person(name:'Ravi', age:21);
      var p2 = Person();
      print(p1);
      dynamic age = p1.age;
      var name = p1.name;
      print(addNumbers(3, 4));
      print(name + " " + age.toString());
      print("Second object details");
      print(p2.name+" "+p2.age.toString());
    }

  ```

### dynamic vs var vs final

- dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
- var: can't change TYPE of the variable if you assigned with value at the time of declaration, if we not assigned with the value at the time of declaration it is same as the dynamic.
- final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.

```
void main() {
  dynamic x = 'hal';
  x = 123;
  print(x);

  var a = 'hal';
//   a = 123; //raises error as a is already of type string

  var b;
  b = "hal";
  b=123; // In this case no error as we not defined the value at the time of declaration.

  print(b);
  print(a);
}
```
- Adding `_` Underscore before the name of class or method or variable make them private.

#### Final
 - The variable whose value doesnt change once initialised for the first time.
 - Runtime Constant.
 - A runtime constant is a value that is computed only while the program is running.
 - A runtime constant can have a different value each time the application is run.
#### Const
 - Compile time Constant and therefore implicitly runtime constant.
 - A compile-time constant will have the same value each time the application is run.
 - Once declared with value it will never change.
 - We can have a **const variable** and the same time **const value**
 Eg:
 ```
    const arr = [1,2,3];
    arr.Add(4); // Is possible as we defined arr as const
    arr = []; // Is not possible as we defined arr variable as const that means it cannot be reassigned
    // But the changes in the value can be done here.
    // So if we mention value as const then we cant change the value also

    const arr = const[1,2,3];
    arr.Add(4); // Not possible as value is const.
    arr = []; // Not possible as variable is const.
 ```



# Back to flutter

## Widgets

- Flutter is all about widgets.
- Each and everything is a widget in the flutter.
- App bar, header, footer, lists, list items,.....
- Widgets often consists of other widgets(Widget Tree).
- Even the App is one main or root widget and each page is a Widget.
- Widget is a type of object
- To create a widget we need to extend the Some widget class here we have taken the stateless widget which is in flutter/material.dart
- In main.dart clear everything and write this.

- Hello World Program

```
  import 'package:flutter/material.dart';
  // Material dart  will have lots of themes which work on both ios and android and it also supports to create our own widget

  void main(){
    //Takes object of the our widget to run widget
    runApp(MyApp());
  }

  // Now after extending we can create our own widget
  // After extending it raises as missing build method implementation(may be abstract).
  class MyApp extends StatelessWidget {

    //context is a object of build context which has some meta information about our app and this widget
    //build method is called by the flutter automatically and it return widget type
    // here we have returned material app which is also in material dart file in the flutter.
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(home: Text('Hello Flutter!'),);
    }
  }
```

- runApp() is a method in the material of flutter package and does all the background scenes which take the widget object, recreate it and draw it on the screen and even calls the build method.

- Every widget in the flutter is a dart class which in turn have the build method.
- Every widget in the flutter must extend **StatelessWidget** or **StatefulWidget** classes.
- These classes force to implement the **build** method because in the end the flutter will always call that build method for you when it prompts to draw something on the screen and provides the context for it(we need only to accept the context).
- **build method** is always responsible for returning a new widget which should be drawn on the screen. So at the end of build method we need to return on base widget to render on to screen.
- **@override** is a decorator provided by dart to override the build method in the parent class.
- Even though we not mentioned it by default the override action is performed. But it is common and good practice to make it clear that we are not accidently overriding the method instead we are overriding by willingly.

- **{Widget home}** which is a parameter that we passed in the MaterialApp Constructor is a widget for the default route of the app ([Navigator.defaultRouteName], which is /).
- This is the route that is displayed first when the application is started normally, unless [initialRoute] is specified. It's also the route that's displayed if the [initialRoute] can't be displayed.
- So here to check we have sent the **Text** widget

- If we have only one line in the function as like in the main() we can use the arrow function shorthand representation as below.
  `void main() => runApp(MyApp());`

- **Let start some nice look to the hello world app**
  ```
  import 'package:flutter/material.dart';
  // Material dart  will have lots of themes which work on both ios and android and it also supports to create our own widget

  void main() => runApp(MyApp());
  //runApp Takes object of the our widget to run widget

  // Now after extending we can create our own widget
  // After extending it raises as missing build method implementation(may be abstract).
  class MyApp extends StatelessWidget {
    //context is a object of build context which has some meta information about our app and this widget
    //build method is called by the flutter automatically and it return widget type
    // here we have returned material app which is also in material dart file in the flutter.
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      // Scafflod() is another widget which is baked into material dart and it has a job of creating a base page design, structure and color scheme
      // for your app which contains some named arguments (to get the autocompletion in ide use ctrl+space).
      // appBar takes PreferredSizeWidget as parameter (here we provided predefined AppBar() present in material dart)
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text('Lets Go Flutter'),
        ),
        body: Text('This is the beginning of Flutter Learning!!'),
      )
      );
    }
  }

  ```
### Different Types of Widgets
1. Output and Input (Visible Widgets)
    - RaisedButton(), Text(), Card(),....
    - These Draw on to the screen: (What user sees)
2. Layout and Control (In Visible Widgets)
    - Row(), Column(), ListView(),...
    - We don't see them but these gives our app structure and control how visible widgets are drawn onto the screen(indirectly visible).
3. Something like Hybrid
  - Container() widget, which belongs to both the categories based on how we use it.
  - By default it is invisible, but we can also give it with some styles to see it.


## Pure Basic Quiz App
- If you want to render widgets in a column(i.e., one above one or below one - in a column) flutter has a **Column widget** (Class). 
- If you want to render items next to each other (like in a row) instead of above each other we use a **Row Widget** (Class).
- So as we need all the options of a question in a single column (one below one) we use **Column Widget**.

#### Column Widget
 - It takes children as a parameter which accepts a list of widgets that need to be in a column.
 `Column(children: <Widget>[],)`

 - Always add all related functions and properties of same widget in the same class as a particular widget should always work standalone.

 - Code till here
 ```
  import 'package:flutter/material.dart';
  // Material dart  will have lots of themes which work on both ios and android and it also supports to create our own widget

  void main() => runApp(MyApp());
  //runApp Takes object of the our widget to run widget

  // Now after extending we can create our own widget
  // After extending it raises as missing build method implementation(may be abstract).
  class MyApp extends StatelessWidget {

    //placed here as build method may always rerun everytime the widget builds which can of any time.
    //But in the state less widget questionIndex must be immutable i.e., not changeable so it asks to make it final
    // So we using Stateful widget
    var questionIndex = 0;
    void answerQuestion(){
      questionIndex = questionIndex+1;
      print(questionIndex);
    }


    // context is a object of build context which has some meta information about our app and this widget
    // build method is called by the flutter automatically and it return widget type
    // here we have returned material app which is also in material dart file in the flutter.
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      var questions=[
        "What is Ravi's favourite color?",
        "What is Ravi's favourite animal?",
        "What is Ravi's favourite food?",
        "What is Ravi's most interested game?"
      ];

      // Scafflod() is another widget which is baked into material dart and it has a job of creating a base page design, structure and color scheme
      // for your app which contains some named arguments (to get the autocompletion in ide use ctrl+space).
      // appBar takes PreferredSizeWidget as parameter (here we provided predefined AppBar() present in material dart)
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text('Lets Go Flutter'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(onPressed: answerQuestion, child: Text('Answer 1')),
            RaisedButton(onPressed: answerQuestion, child: Text('Answer 2')),
            RaisedButton(onPressed: answerQuestion, child: Text('Answer 3')),
            RaisedButton(onPressed: answerQuestion, child: Text('Answer 4')),
          ],
        ),
      ));
    }
  }

 ```


### State
- State is Data/Information used by your App
- It can be of
  1. App State - Authenticated users, loaded users,...
  2. Widget State - Current User input, Is a loading spinner shown?

### Stateless vs Stateful
- In a **stateless widget** which is meant for rendering UI. We can recieve the data from outside to the stateless widget through the constructor.
- _UI_ gets re rendered or_ rebuilded_ when the _input data changes_.
- But the data inside the widget class the data will never changed.


- In a **stateful widget** which also has the build method and renders UI and also can recieve the data from outside to stateful widget through constructor.
- But we can also have some internal state within the widget state.
- _UI_ gets rerendered or _rebuilded_ when the _input data or local state changes_.

- * As we  need some state stored when retrieving next question which needs to change the question in the body field i.e., within widget we need Stateful Widget.
- While extending StatefulWidget Class, we need to override the createState() method in the StatefulWidget Class and in that method we need to return the State<StatefulWidget> type.
- So for that we create another class named as widgetnameState and it should extend State class and all the code that we written in the stateless widget is placed here.

#### setState method
- It is only available in the **stateful widget** class.
- And we we clicked the button we need to increase the question index i.e., similiar to change the state so for that we are using a function **setState** which takes the function as input in which the state is setted.
- **setState** is a function that forces the flutter to rerender the user interface build method related that particular state widget only(not the entire user interface of entire app).
- In our case the entire _MyAppState build method is rebuilded_ again as _the setState is called in that MyAppState widget_ itself.
- For more information refer [this](https://medium.com/codechai/basics-of-state-management-in-flutter-497ddb506608).

- After setting state
  ```
    import 'package:flutter/material.dart';
    // Material dart  will have lots of themes which work on both ios and android and it also supports to create our own widget

    void main() => runApp(MyApp());
    //runApp Takes object of the our widget to run widget

    // Now after extending we can create our own widget
    // After extending it raises as missing build method implementation(may be abstract).
    class MyApp extends StatefulWidget {
      // Which mentions that the state is MyAppState
      @override
      State<StatefulWidget> createState() {
        // TODO: implement createState
        return _MyAppState();
      }
    }

    // Widget_name+State(Convention)
    // State<MyApp> - State belongs to MyApp
    class _MyAppState extends State<MyApp> {

      //placed here as build method may always rerun everytime the widget builds which can of any time.
      //But in the state less widget questionIndex must be immutable i.e., not changeable so it asks to make it final
      // So we using Stateful widget
      var _questionIndex = 0;
      void _answerQuestion() {
        
        setState(() {
          _questionIndex = _questionIndex + 1;
        });
        print(_questionIndex);
      }

      // context is a object of build context which has some meta information about our app and this widget
      // build method is called by the flutter automatically and it return widget type
      // here we have returned material app which is also in material dart file in the flutter.
      @override 
      Widget build(BuildContext context) {
        // TODO: implement build
        var questions = [
          "What is Ravi's favourite color?",
          "What is Ravi's favourite animal?",
          "What is Ravi's favourite food?",
          "What is Ravi's most interested game?"
        ];

        // Scafflod() is another widget which is baked into material dart and it has a job of creating a base page design, structure and color scheme
        // for your app which contains some named arguments (to get the autocompletion in ide use ctrl+space).
        // appBar takes PreferredSizeWidget as parameter (here we provided predefined AppBar() present in material dart)
        return MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: Text('Lets Go Flutter'),
          ),
          body: Column(
            children: [
              Text(questions[_questionIndex]),
              RaisedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
              RaisedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
              RaisedButton(onPressed: _answerQuestion, child: Text('Answer 3')),
              RaisedButton(onPressed: _answerQuestion, child: Text('Answer 4')),
            ],
          ),
        ));
      }
    }

  ```

### Lifting the state up
- We manage the state and share it on the common denominator of the different widgets that need the state.
- Is some what that means lifting the state up.

---------5:23:40