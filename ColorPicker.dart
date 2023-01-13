import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  late final VoidCallback onTap;
  ColorPicker(this.color,this.outerBorder,);
  @override
  Widget build(BuildContext context) {
    return Container(height: 50,width: 50,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle,
          border: outerBorder ? Border.all(color: color, width: 3 ) : null),
      child: Container(padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle,),
      ),
    );
  }
}
