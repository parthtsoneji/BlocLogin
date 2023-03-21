import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/BLoc/login_bloc.dart';
import 'package:loginbloc/Services/LoginModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? loginBloc;
  int index = 0;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
    loginBloc != null ? loginBloc!.add(LoginLoadEvent()) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginBloc!,
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoginLoadedState) {
            LoginResponse list = state.loaded;
            return _loginWidget(list);
          }
          return const Text("Something wrong");
        }),
      ),
    );
  }

  final baseURL = 'https://coupinos-app.azurewebsites.net';

  Widget _loginWidget([LoginResponse? list]) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            title: Text(
              list!.address!.city.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            pinned: true,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.edit, color: Color(0xFFF8485E)),
              )
            ],
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Column(
                    children: [
                      Image.network(
                          "$baseURL${list.contactperson!.defaultImagePath.toString()}"),
                      const SizedBox(height: 20),
                      Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFFF8485E),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: const Center(
                            child: Text("Profibild andern",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20)),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(list.contactperson!.firstname.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 5),
                          Text(list.contactperson!.lastname.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                          height: 20,
                          child: Text(list.contactperson!.email.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                      const SizedBox(height: 2),
                      const Text(
                          "Auf diese E-mail bekommen Sie einen Code zur Verifizierung",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w100)),
                      const SizedBox(height: 15),
                      const Text(
                        "Adresse",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Strabe und Hausnummer",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        list.address!.streetnumber.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "PLZ",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        list.address!.postalcode.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Ort",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        list.address!.city.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ]),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 30),
          child: FloatingActionButton.extended(
            backgroundColor: const Color(0xFFF8485E),
            onPressed: () {},
            isExtended: true,
            extendedPadding:
                EdgeInsets.all(MediaQuery.of(context).size.width / 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: const Text(
              "Anderungen speichern",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
