import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/routes/routes.dart';
import '../../shared/widgets/glass_morphism.dart';
import '../../shared/widgets/input_form_field.dart';
import '../../shared/widgets/submit_button.dart';
import '../../shared/widgets/text_button_custom.dart';
import '../buisness_logic/cubit/auth_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.errorLoginging) {
              //TODO ...Set login error state action
            }

            if (state.successLoginging) {
              context.router.pushAndPopUntil(
                const ApplicationRoute(),
                predicate: (_) => false,
              );
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: w,
              height: h,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: MediaQuery.paddingOf(context).top + 10,
                          ),
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 94, 167, 16),
                                  radius: w * 0.2,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: w * 0.2 - 5,
                                ),
                                Image(
                                  width: w * 0.3,
                                  height: w * 0.2,
                                  fit: BoxFit.cover,
                                  image: const AssetImage(
                                      'assets/images/logo.jpg'),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            child: Text(
                              'Se Connecter',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GlassMorphism(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InputFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    label: 'Email',
                                    hintText: 'Votre email',
                                    autofillHints: const [AutofillHints.email],
                                    validators: [
                                      FormBuilderValidators.required(
                                        errorText: 'Adresse email requis',
                                      ),
                                      FormBuilderValidators.email(
                                        errorText: 'Adresse email invalide',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18.0),
                                  InputFormField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    label: 'Mot de passe',
                                    hintText: 'Votre mot de passe',
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    validators: [
                                      FormBuilderValidators.required(
                                        errorText: 'Mot de passe requis',
                                      ),
                                      FormBuilderValidators.match(
                                          '[a-zA-Z0-9@]+'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButtonCustom(
                                        onPressed:
                                            () {}, //TODO : redirect to forgot password page
                                        text: ' Mot de passe oublié ?',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SubmitButton(
                                        height: 45,
                                        width: w * 0.7,
                                        loading: state.isLoginging,
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<AuthCubit>().login(
                                                  email: _emailController.text,
                                                  password: _passwordController
                                                      .text
                                                      .trim(),
                                                );
                                          }
                                        },
                                        text: 'Se Conneter',
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: TextButtonCustom(
                                      onPressed: () {
                                        context.router
                                            .push(const RegisterRoute());
                                      }, //TODO : redirect to register page
                                      text: 'Créer un Compte',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          'Ou Continue avec',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        iconSize: 35,
                                        onPressed:
                                            () {}, //TODO connect with facebook
                                        icon: const Icon(Icons.facebook),
                                      ),
                                      IconButton(
                                        iconSize: 35,
                                        onPressed:
                                            () {}, //TODO connect with google
                                        icon: const Icon(Icons.mail),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
