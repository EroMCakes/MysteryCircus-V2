import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:mystery_circus_app/View/Utils/color_theme.dart';

class AuthenticationForm extends StatefulWidget {
  AuthenticationForm(this.submitform, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String userName,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitform;

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _fomrKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _fomrKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid!) {
      _fomrKey.currentState?.save();
      widget.submitform(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _fomrKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    key: const ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Adresse Email...',
                    ),
                    validator: ((value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Veuillez utiliser une adresse Email valide.';
                      }
                    }),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('userName'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Prénom/Pseudo',
                      ),
                      validator: ((value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Veuillez utiliser une adresse Email valide.';
                        }
                      }),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    obscureText: true,
                    key: const ValueKey('password'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe...',
                    ),
                    validator: ((value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Veuillez utiliser une adresse Email valide.';
                      }
                    }),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.isLoading)
                    const CircularProgressIndicator(
                      color: mainRedSwatch,
                    ),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(
                        _isLogin ? 'Connexion' : 'Créer un compte',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? 'Créer un nouveau compte'
                          : 'J\'ai déjà un compte',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
