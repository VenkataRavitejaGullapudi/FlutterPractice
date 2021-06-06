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
### To make app run on the web, Execute below commands in the app folder
- `flutter channel beta`
- `flutter upgrade`
- `flutter config --enable-web`

### Linking External packages
- **We can find many open source packages on pub.dev which can be mentioned in the dependencies section of the pubspec.yaml file which manages assets and dependencies for a Flutter App**
- Then to pull the dependencies or packages into our project run `flutter pub get`


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
- **Stateful Widgets** requires atleast two classes.
  1. Stateful Widget class that creates instance of
  2. State class

- * As we  need some state stored when retrieving next question which needs to change the question in the body field i.e., within widget we need Stateful Widget.
- While extending StatefulWidget Class, we need to override the createState() method in the StatefulWidget Class and in that method we need to return the State<StatefulWidget> type.
- So for that we create another class named as widgetnameState and it should extend State class and all the code that we written in the stateless widget is placed here.



#### setState method
- It is only available in the **stateful widget** class.
- **setState** is a function that notifies and forces the flutter to rerender the user interface build method of that particular state widget only(not the entire user interface of entire app).
- And here when we clicked the button we need to increase the question index i.e., similiar to change the state so for that we are using a function **setState** which takes the function as input in which the state is setted.
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

## Apps
- first_app - Basic quiz
- flutter_assignment - Just some practice with useState.

### Errors
- Syntax errors - Which can be resolved with in IDE before running app.
- Runtime errors - Which can be occured when app is running and we may also encouter on the app's screen also.
  - Like Index out of Bound, Invalid format input and so on.
  - We can use some Debugging Techniques in the IDEs to resolve the runtime errors.
#### Debugging Techniques
  - We can use **print statements** at the places or things so that we can check whats going in the code.
  - We can use **IDE dubuggers** by setting break point on the left side of the code editor(side of the line numbers).
  - We can use **Dart Devtools** in the VS Editor.
  ##### Using Dart Devtools
  - First, Press Ctrl+Shift+P to bring the command panel of the VS.
  - There type the Dart Dev tools and Select it by click on it.
  - Add next click on the open devtools on browser.
  - It will open a page on localhost server in browser.
  - Explore the widgets with their tree structure, what are the main widgets, child widgets, properties of each widget and many more options.
  - You can also use **Select Widget mode button** to directly check the widget selected in the app here(just like inspect element in the webpages)
  - You can also see the why the app looks like that means the padding the structure of the widgets and everything just by clicking the Debug Paint option on the Dart Dev Tools page.
  - We can use **Paint base lines** to see the text lines in the app.
  - We can use **Performance Overlay** on clicking on that button in the dev tools, performance overlay will be activated. We can see performance overlays on the app.
  - **Repaint Window** is the another option on the Dev tools on activating it we can check what actually repainted on the app.
  - We can also see some other useful things like Logging, App size, timeline, performance, memory and so on which are especially useful in production mode not on debug mode.
  
## Personal Expenses App (More than a basic)
**Section 2:**
- More Widgets.
- Theming and Material Design.
- Working with images and fonts.
- Adding business logic to an app.
  
- We can check in the **flutter widgets catalog** in the flutter's official website for more widgets.
### Most Crucial Widgets
1.  App/Page Setup
  - MaterialApp/ Cupertino App
  - Scaffold/ CupertinoPageScaffold
2.  Layout 
  - Container (Wrapper)
  - Row
  - Column
3. Row/Column widgets
  - Flexible
  - Expanded
4. Content Containers
  - Stack
  - Card
5. Repeat Elements
  - ListView
  - GridView
  - ListTitle
6. Content Types
  - Text
  - Image
  - Icon
7. User Input
  - TextField
  - RaisedButton/ FlatButton
  - We can create our own buttons or some other using Invisible Detector like _Gesture Detector_ and partially invisible detector like _InkWell_ (which gives ripple effect when youn tap and able to wrap anything to widget and able apply many listeners).

### Material App
- An application that uses material design.
- A convenience widget that wraps a number of widgets that are commonly required for material design applications.  It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.
- _home_: The widget for the default route of the app
- _title_ :
    - A one-line description used by the device to identify the app for the user.
    - On Android the titles appear above the task manager's app snapshots which are displayed when the user presses the "recent apps" button. On iOS this value cannot be used.

- **SingleChildScrollView** makes the widget scrollable in case of lists.
### ListView
- But instead of manually adding that flutter has a shortcut i.e., use the **ListView** instead of Column or Row.
- **ListView** doesn't have a fixed height like **Column** in which it is fit to the screen width, so it will have infinite length. That causes an error (_Unbounded height_) if we doesnot bound it with some height where it need to be scrollable(Like container).
- There are two ways of using ListView.
  1. ListView(children:[])
    - Similar to Column with SingleChildScrollView.
    - Loads all the elements or children widgets in that list.
  2. ListView.builder()
    - Works similarly but there is no wrapping single child scrollview.
    - Instead we have some optimisation, i.e., It will loads only the child widgets or elements that are visible on the screen. i.e., Which are off screen are not loaded
    - This builder constructor takes some new parameters like, itemBuilder(instead children is not there) and itemCount
      - **itemBuilder** - Which takes a function as input and that function must take the build context and index, but both are provided by flutter itself and returns the Widget that we need to render for each item in the list not the entire list and we access through iterating over the list by using the index parameter of the function that we passed to the itemBuilder (Here its a single transaction not a list of transactions).
      - **itemCount** - Which takes no of items in that list. So that it can build items that are needed now on screen.
    - Finally, ListView.builder() gives best performance incase if we have huge items or that we dont know in advance.
    - In this we can use a **ListTile**. It is a single fixed-height row that typically contains some text as well as a leading or trailing icon.

### showModalBottomSheet(context: ctx, builder: (bctx){ });
- It is the built in method to open a Modal.
- It takes to context object (If we written in the build method we can use it or if we take it another function we can accept the BuildContext as a parameter to that function and use it.)
- And also the builder which takes a function which accepts the build context which is different from the above and returns the widget that need to be rendered in the modal.

- **GestureDetector**(
    onTap: (){}, //No Action will be performed when the user tapped on the new transaction form
    child: NewTransaction(_addNewTransaction), 
    behavior: HitTestBehavior.opaque, //With this event behavior we catch the tap event and avoid the handling of it by anyone else. 
  );

### Theming
- We can add application wide theming in the App.
- In Material App that we returned in the main.dart, myapp widget, we can pass _theme_ to the MaterialApp constructor.
### Fonts
- We can use the custom fonts by adding them to some fonts folder in the project folder and configure them in the pubspec.yaml file.

### Padding Widget
-  If we want to use container for only padding we can use padding widget instead of the container.



### Flexible Widget
- It controls how a child of a row, column or Flex.
-  Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main axis (e.g., horizontally for a Row or vertically for a Column)
- But, unlike Expanded, Flexible does not require the child to fill the available space.
- A Flexible widget must be a descendant of a Row, Column, or Flex, and the path from the Flexible widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidg ets (not other kinds of widgets, like RenderObjectWidgets).
- FlexFit.tight is used to force the child to fill the available space even we mentioned the size(height or weight).
  - If more than 2 flexible child in a row or column they split the space among themselves equally.
  - If we want one child to get more space than other instead of splitting equally in the above case, then we can use *flex property* in the Flexible widget which is 1 by default.
  - Suppose, if there are 2 flexible.tight childs with one child of _flex-2_ and other the default _flex-1_ then total available space is divided into _2+1 = 3 segments_. and 2 segments are given to flex-2 and 1 for flex-1 childs.
- FlexFit.loose(Default behavior) will not force child to fill available space therefore it fills only required based on the content it need. 
  - If we mentioned the flex attribute here, the child will take only the required space for its child content and remaining will be left empty.
  - Suppose, if there are 1 flexible.loose child and 1 flexible.tight child with one child of _flex-2_ and other the _flex-1_ then total available space is divided into _2+1 = 3 segments_. From that the flex loose child will take only its required space from that segment but the if the remaining space is present it will not be taken by the flexible tight child as it is allocated to flex loose and so that space will be left empty.

### Expanded Widget
- Almost similar to the flexible.tight without fit attribute.
- A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.
- Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis (e.g., horizontally for a Row or vertically for a Column). 
- If multiple children are expanded, the available space is divided among them according to the flex factor.

- An Expanded widget must be a descendant of a Row, Column, or Flex, and the path from the Expanded widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidgets (not other kinds of widgets, like RenderObjectWidgets).


### FittedBox Widget
- Creates a widget that scales and positions its child within itself according to.
- Suppose if we have a text that should shrink, if its size becomes bigger due to its length. Then we can wrap that text with fittedbox so that the text decreases if the length increase. i.e., it makes the text be within itself.

### FractionallySizedBox Widget
- Creates a widget that sizes its child to a fraction of the total available space. Based on the percentage given.

### Stack
-  Similar to the Column but instead of Column which aligns it children one by one down on the screen, Stack makes the children one above(on the widget) the other widget.(In case colors, violet on the grey color means violet will be visible grey will not as it will be below the violet)

### ListTile
- A single fixed-height row that typically contains some text as well as a leading or trailing icon.


### Future 
- These futures are classes that allow us to create objects which will give us the value in future.
- We can use a future also for HTTP requests where you need to wait for a response to comeback from the server.
- In the same way, we can also wait for the use to pick a date value.
- To be informed about that response or selection which will be in future, we can add the method called **then method**.
- **then method** will simply allows us to provide a function which is executed once the future resolves to a value.
- Another important feature is that the code execution in your app will not pause and wait for this to happen.
- The function which will be passed in the _then method_ is stored in the memory and the other code after the show date picker will be executed immediately without wait for future to resolve.
- After the response automatically the function stored in the memory will be called.

### showDatePicker
- It is predefined method to open the datepicker in the flutter.
- It will return a Future Type class.
- When we call this method, it will returns a future object which cant immediately give us the date the user picked because we dont know when the user pick the value after showing the datepicker.

## Responsive
- It should have different or better look in the different sized devices.
## Adaptive 
- It should have better styles and look in different operating systems based on their own features.
- **Android** - Material-Design look/styles
              - Android Animations/Route Transitions
              - Android Fonts
- **iOS**     - Cupertino Look/ Styles
              - iOS Animations/Route Transitions
              - iOS Fonts
###### So based on the Platform and the size we render different widgets like ios widget for ios subtree widget and android widget for android.
 
## Navigation
- In Flutter, the Navigator manages a stack containing the app's routes. Pushing a route onto the Navigator's stack updates the display to that route. Popping a route from the Navigator's stack returns the display to the previous route.
- Next, you'll build a route and push it to the Navigator's stack. 
- That action changes the screen to display the new route. 
- The content for the new page can also built in MaterialPageRoute's builder property in an anonymous function.

## MediaQuery
- It gives us the device information like measures and so on.

## Constraints
- All built in flutters have default constraints
- Constraints refers to height and width which varies from 0 to infinity.

## Layout Builder
- Builds a widget tree that can depend on the parent widget's size.
- Similar to the Builder widget except that the framework calls the builder function at layout time and provides the parent widget's constraints. This is useful when the parent constrains the child's size and doesn't depend on the child's intrinsic size. 
- The LayoutBuilder's final size will match its child's size.

## Controlling Device Orientation
- In order control device orientation we can use setpreferredorientations method in systemchrome.
- Go through the below code and place it in the main method before running the app(runApp())
```
// As per the latest version of the flutter
// Before the setting orientation we need to initialise binding(before runApp) by calling like this
WidgetsFlutterBinding.ensureInitialized();

// Setting Orientation
SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
```