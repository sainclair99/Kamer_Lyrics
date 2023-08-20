import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kamer_lyrics/shared/routes/routes.dart';
import 'package:kamer_lyrics/shared/widgets/glass_morphism.dart';

import '../../shared/widgets/input_form_field.dart';
import '../../shared/widgets/submit_button.dart';
import '../../shared/widgets/text_button_custom.dart';
import '../buisness_logic/cubit/auth_cubit.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorRegistration) {
            // TODO Implement failure registration actions
          }

          if (state.successRegistration) {
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
                                image:
                                    const AssetImage('assets/images/logo.jpg'),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Text(
                            'Créer un Compte',
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
                                  controller: _nameController,
                                  keyboardType: TextInputType.emailAddress,
                                  label: 'Pseudo',
                                  hintText: 'Nom',
                                  autofillHints: const [AutofillHints.name],
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: 'Adresse email requis',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18.0),
                                InputFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  label: 'Email',
                                  hintText: 'Adresse email',
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
                                  hintText: 'Mot de passe',
                                  autofillHints: const [AutofillHints.password],
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
                                      onPressed: () {
                                        context.router.push(
                                          const LoginRoute(),
                                        );
                                      }, //TODO : redirect to forgot password page
                                      text: ' j\'ai déjà un compte',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SubmitButton(
                                      height: 45,
                                      width: w * 0.7,
                                      loading: state.isRegistrating,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthCubit>().register(
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                              );
                                        }
                                      },
                                      text: 'Créer',
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
    );
  }
}
