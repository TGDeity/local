

part of 'login_view.dart';

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    required TextEditingController emailController,
    required TextEditingController textEditingControllerPsword,
    required this.formLoginKey,
  }) : _textEditingControllerEmail = emailController,
       _textEditingControllerPsword = textEditingControllerPsword;

  final TextEditingController _textEditingControllerEmail;
  final TextEditingController _textEditingControllerPsword;
  final GlobalKey<FormState> formLoginKey;

  @override
  Widget build(BuildContext context) {
    _textEditingControllerEmail.text = 'eve.holt@reqres.in';
    _textEditingControllerPsword.text = 'cityslicka';
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: state ? 0.3 : 1,
            child: Column(
              children: [
                Padding(
                  padding: PagePadding.all(),
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        controller: _textEditingControllerEmail,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (data) => (data.ext.isValidEmail) ? null : 'Problem',
                      ),
                      TextFormField(
                        controller: _textEditingControllerPsword,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        //validator: (data) => data.ext.isValidPassword ? null : 'pROblEma',
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) { //Gelen stateleri dinlemek için kullanılır.
                            // TODO: implement listener
                            if (state.isCompleted) {
                              context.route.navigateName(NavigateRoutesEnum.lottieLearn.path);
                            }
                          },
                          builder: (context, state) {
                            return BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (formLoginKey.currentState?.validate() ?? false) {
                                      context.read<LoginCubit>().checkUser(
                                        _textEditingControllerEmail.text,
                                        _textEditingControllerPsword.text,
                                      );
                                    }
                                  },
                                  child: Text('Login with: ${state.loginModel?.email ?? ''}'),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.fromLTRB(super.left, super.top, super.right, super.bottom) : super.fromLTRB();

  const PagePadding.all() : super.all(20);
}
