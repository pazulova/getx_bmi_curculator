
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getx_bmi_curculator/app_constants/app_text_styles.dart';
import 'package:getx_bmi_curculator/widgets/circular_button.dart';



class WeightHeightWidget extends StatelessWidget {
  const WeightHeightWidget({
    @required this.title,
    @required this.increment,
    @required this.decrement,
    this.weight,
    this.age,
    Key key,
  }) : super(key: key);

  final String title;
  final String weight;
  final String age;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.titleTextStyle,
          ),
          weight != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      weight,
                      style: AppTextStyles.numberTextStyle,
                    ),
                    Text(' kg'),
                  ],
                )
              : Text(
                  age,
                  style: AppTextStyles.numberTextStyle,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: decrement,
                child: Icon(FontAwesomeIcons.minus),
              ),
              const SizedBox(width: 5.0),
              CustomButton(
                onTap: increment,
                child: Icon(FontAwesomeIcons.plus),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
