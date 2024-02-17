import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/bloc/register/bloc/register_bloc.dart';
import 'package:simple_bloc/data/models/request/register_request_model.dart';
import 'package:simple_bloc/presentation/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Register User"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 16,
            ),

            BlocConsumer<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ElevatedButton(
                  onPressed: () {
                    final model = RegisterRequestModel(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                    context.read<RegisterBloc>().add(
                          RegisterButtonTapped(model: model),
                        );
                  },
                  child: const Text("Register"),
                );
              },
              listener: (context, state) {
                if (state is RegisterError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Error"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state is RegisterSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Success name ${state.model.name}"),
                      backgroundColor: Colors.blue,
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                }
              },
            ),

            // ============= BLOCLISTENER =============
            // BlocListener<RegisterBloc, RegisterState>(
            //   listener: (context, state) {
            //     if (state is RegisterError) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text("Error"),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     }

            //     if (state is RegisterSuccess) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text("Success name ${state.model.name}"),
            //           backgroundColor: Colors.blue,
            //         ),
            //       );

            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) {
            //             return const LoginPage();
            //           },
            //         ),
            //       );
            //     }
            //   },

            // ============= BLOCBUILDER =============
            //   child: BlocBuilder<RegisterBloc, RegisterState>(
            //     builder: (context, state) {
            //       if (state is RegisterLoading) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }

            //       return ElevatedButton(
            //         onPressed: () {
            //           final model = RegisterRequestModel(
            //               name: nameController.text,
            //               email: emailController.text,
            //               password: passwordController.text);
            //           context.read<RegisterBloc>().add(
            //                 DoRegisterEvent(model: model),
            //               );
            //         },
            //         child: const Text("Register"),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
