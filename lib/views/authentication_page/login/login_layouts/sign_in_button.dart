import '../../../../config.dart';

class SignInButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const SignInButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      title: LoginFont().signInCapital,
      onTap: onTap,
    );
  }
}
