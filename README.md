# This project is for excerising Provider with Flutter

## A Flutter project implementing three different example project with provider.

## Features

**1. This Flutter app demonstrates a breadcrumb navigation system using the Provider package to manage state. Breadcrumbs help track user navigation and indicate the current location within an app.** </br>

- Dynamic Breadcrumb Creation</br>
- Breadcrumb State Management</br>

**2. This Flutter application demonstrates the use of the provider package for efficient state management, focusing on selective widget updates based on data changes.**</br>

- Utilizes context.watch and context.select for listening to provider updates, ensuring widgets rebuild only when relevant data changes.</br>
- Updates CheapObject every second and ExpensiveObject every 10 seconds using periodic streams.</br>
- Provides buttons to start and stop the periodic updates of objects dynamically.</br>
- CheapWidget, ExpensiveWidget, and ObjectProviderWidget rebuild independently based on their specific data dependencies.</br>

  **3. This Flutter project demonstrates the use of MultiProvider with StreamProvider to create a dynamic UI that updates based on time.** </br>

- Seconds widget updates every second. And Minutes widget updates every minute.</br>
- Uses StreamProvider to listen to and provide streams of Seconds and Minutes.</br>

<a><img src="demo/first.gif" width="200"></a>
<a><img src="demo/second.gif" width="205"></a>
<a><img src="demo/third.gif" width="200"></a>

## File stracture

    ├── lib
    │   ├── main.dart
    │   ├── bread_crumb_example.dart
    │   ├── cheap_and_expensive_object.dart
    │   ├── multi_provider.dart

## Run Locally

Clone the project

```bash
  git clone git@github.com:abdulawalarif/provider_from_course.git
```

Go to the project directory

```bash
  cd provider_from_course
```

Install dependencies

```bash
  flutter pub get
```

Connect a physical device or start a virtual device on your machine

```bash
  flutter run
```

## How to tweak this project for your own uses

```bash
# This is type safe I won't be able to fetch ExpensiveObject on CheapObject declearations

final expensivObject = context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,);
```

```bash
# This is looking for any changes in the whole state class then it will re-build the widgets

final objectProvider = context.watch<ObjectProvider>();
```

```bash
# For manipulating list i am using consumer

Consumer<BreadCrumbExample>(builder: (context, value, child) {

#sending the UnmodifiableListView of BreadCrumb type into BreadCrumbWidget to be renderd

  return BreadCrumbWidget(breadCrumbs: value.item);
 }),

````
```bash
# This code is for interecting with button
 context.read<BreadCrumbExample>().reset();
 context.read<BreadCrumbExample>().add(breadCrumb);
````

## Reporting Bugs or Requesting Features?

If you found an issue or would like to submit an improvement to this project,
please submit an issue using the issues tab above. If you would like to submit a PR with a fix, reference the issue you created!

## Known Issues and Future Work

-

## Author

- [@abdulawalarif](https://github.com/abdulawalarif)

## License

The MIT License (MIT). Please view the [License](LICENSE) File for more information.
