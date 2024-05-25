import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app_task/core/api/auth/model/user.dart';
import 'package:you_app_task/presentation/bloc/auth/auth_cubit.dart';
import 'package:you_app_task/presentation/bloc/auth/auth_state.dart';
import 'package:you_app_task/presentation/widget/golden_gradient_widget.dart';
import 'package:you_app_task/presentation/widget/inpit_password_filed.dart';
import 'package:you_app_task/presentation/widget/input_text_filed.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthCubit _authCubit;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  Widget back = Image.asset('assets/back.png', width: 7, height: 14);

  @override
  void initState() {
    super.initState();
    _authCubit = BlocProvider.of<AuthCubit>(context);
    _authCubit.emit(AuthLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF1F4247),
                  Color(0xFF0D1D23),
                  Color(0xFF0D1D23),
                ],
                focalRadius: 24,
              ),
            ),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedIn) {
                  Navigator.pushReplacementNamed(
                    context,
                    "/profile",
                    arguments: state.token,
                  );
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.exception.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                    duration: const Duration(seconds: 3),
                  ));
                }
              },
              child:
                  BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                if (state is AuthLogin) {
                  return _buildLoginForm(context);
                } else if (state is AuthError) {
                  return _buildLoginForm(context);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 17,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 18),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 41),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputTextFieLd(
                    controller: _emailController,
                    hintText: 'Enter Username/Email'),
                const SizedBox(height: 15),
                InputPasswordField(
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    showPassword: _showPassword,
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    }),
                const SizedBox(height: 20),
                Container(
                    width: 331.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF62CDCB), Color(0xFF4599DB)],
                      ),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text);
                          _authCubit.login(
                            User(
                              email: emailValid ? _emailController.text : "",
                              username: emailValid ? "" : _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        },
                        child: const Center(
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Inter'))))),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No account?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter'),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: goldenGradientWidget(
                        const Text(
                          'Register here',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
    );
  }
}
