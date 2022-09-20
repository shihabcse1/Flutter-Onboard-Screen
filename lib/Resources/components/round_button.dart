import 'package:flutter/material.dart';
import '../color.dart';

class RoundButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;

  const RoundButton({Key? key ,
    required this.title,
    this.loading = false ,
    required this.onPress ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPress,
        child: loading ? const CircularProgressIndicator(color: AppColors.whiteColor,) : Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.pinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}