import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Common/Route/routes_list.dart';
import 'package:scanner/Common/Utilities/utilities.dart';
import 'package:scanner/Common/styles/common_styles.dart';
import 'package:scanner/Di/get_it.dart';
import 'package:scanner/Presentation/Bloc/Authentication/authentication_bloc.dart';
import 'package:scanner/Presentation/Journey/Product/product_list.dart';

class LoginPageFom extends StatefulWidget {
  const LoginPageFom({Key? key}) : super(key: key);

  @override
  State<LoginPageFom> createState() => _LoginPageFomState();
}

class _LoginPageFomState extends State<LoginPageFom> {
  var _formKey = GlobalKey<FormState>();
  var _email = TextEditingController();
  var _password = TextEditingController();
  bool autoValidate = false;
  bool visible = false;
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationCubit = getItInstance<AuthenticationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocProvider<AuthenticationCubit>.value(
          value: authenticationCubit,
          child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationSuccess) {
                print('Auth Success');
                Navigator.of(context).pop(false);
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteList.product, (route) => false);
                // Navigator.push(context, new MaterialPageRoute(builder: (context)=>ProductList()));
              }
              //}
              if (state is AuthenticationFailure) {
                Navigator.of(context).pop(false);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is AuthenticationInitial) {
                debugPrint('Auth initial builder');
              }
              return Center(
                  child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Stack(
                          fit: StackFit.loose,
                          overflow: Overflow.visible,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              overflow: Overflow.visible,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 400,
                                  margin: EdgeInsets.all(6),
                                  alignment: Alignment.center,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Image(
                                          image:
                                              Image.asset('assets/images.png')
                                                  .image,
                                        ),
                                        //  Container(

                                        //   decoration: BoxDecoration(
                                        //   image: DecorationImage(
                                        //     fit: BoxFit.cover,
                                        //     image: Image.asset('assets/images.png',).image)
                                        // //  ),),
                                        //   SizedBox(
                                        //     height: 10,
                                        //   ),
                                        // Text('INFINITY BOX',

                                        // style: CommonStyles(context: context).getHeaderText(),),
                                        // SizedBox(
                                        //   height: 30,
                                        // ),
                                        exportFormField(
                                          controller: _email,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Cannot Empty';
                                            }
                                            return null;
                                          },
                                          hintText: 'Enter Username',
                                          prefix: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.person_outline)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        exportFormField(
                                            controller: _password,
                                            visible: !visible,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Cannot Empty';
                                              }
                                              return null;
                                            },
                                            hintText: 'Enter Password',
                                            prefix: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.lock)),
                                            suffix: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    visible = !visible;
                                                  });
                                                },
                                                icon: visible
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off))),

                                        /* Container(
                                            padding: EdgeInsets.symmetric(horizontal: 20),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Cannot Empty';
                                                }
                                                return null;
                                              },
                                              controller: _email,
                                              onFieldSubmitted: (value) {
                                                if (_formKey.currentState!.validate()) {}
                                              },
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.book),
                                                  labelText: 'Enter college Code',
                                                  labelStyle:
                                                      TextStyle(fontStyle: FontStyle.italic),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(8))),
                                            ),
                                          ),*/
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 170,
                                  bottom: -30,
                                  child: Card(
                                    shadowColor: Colors.grey,
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(blurRadius: 5.0)
                                          ],
                                          // borderRadius: BorderRadius.circular(80),),
                                          shape: BoxShape.circle),
                                      child: InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            authenticationCubit.createUser(
                                                _email.text, _password.text);
                                            Utilities.waitingForServer(context);
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          // onPressed: () {},
                                          //  ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )));
            },
          ),
        ));
  }
}

Widget exportFormField(
    {required TextEditingController controller,
    required String? Function(String?)? validator,
    required String hintText,
    bool readOnly = false,
    bool? visible = false,
    Widget? suffix,
    Widget? prefix}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      obscureText: visible!,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.only(left: 10),
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          hintText: hintText,
          isDense: true,
          hintStyle: TextStyle(),
          // errorText: errorText,
          filled: true,
          suffixIcon: suffix,
          prefixIcon: prefix),
      style: TextStyle(),
    ),
  );
}
