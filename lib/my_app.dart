import 'package:flutter/material.dart';
import 'package:scanner/Common/Route/route.dart';
import 'package:scanner/Di/get_it.dart';
import 'package:scanner/Presentation/Bloc/Authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Presentation/Journey/Product/product_list.dart';
import 'Presentation/Journey/Login/login.dart';
import 'fade_page_route.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationCubit = getItInstance<AuthenticationCubit>();
    authenticationCubit.autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings routeSettings) {
        final routes = Routes.getRoutes(routeSettings);
        final WidgetBuilder? builder = routes[routeSettings.name];
        return FadePageRouteBuilder(
          builder: builder!,
          settings: routeSettings,
        );
      },
      title: 'INFINITY BOX',
      theme: new ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: Colors.orange,
        accentColor: Colors.grey.shade900,
        //hintColor: CommonColors.gray,
        dividerColor: Colors.orangeAccent,
        splashColor: Colors.orange,
        iconTheme: new IconThemeData(color: Colors.white),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.accent,
        ),
        textTheme: TextTheme(
          caption: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.orange),
        ),
      ),
      home: BlocProvider<AuthenticationCubit>.value(
        value: authenticationCubit,
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is AutoLoginState) {
              return ProductList();
            }
            if (state is AuthenticationNotAuthenticated) {
              return LoginPage();
            }

            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          },
        ),
      ),
    );
  }
}
