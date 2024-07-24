import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> cardIcon = const [
  {
    'widget': FontAwesomeIcons.fan,
    'text': 'Air Condition',
    'subtext': '4 Devices'
  },
  {'widget': FontAwesomeIcons.tv, 'text': 'Smart TV', 'subtext': '3 Devices'},
  {
    'widget': FontAwesomeIcons.lightbulb,
    'text': 'Smart Light',
    'subtext': '4 Devices'
  },
  {
    'widget': (FontAwesomeIcons.kitchenSet),
    'text': ('Smart Kitchen'),
    'subtext': ('5 Devices')
  },
  {
    'widget': (FontAwesomeIcons.faucetDrip),
    'text': ('Smart Tap contoller'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.bell),
    'text': ('Smart Bell'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.houseLock),
    'text': ('Auto House Lock'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.bath),
    'text': ('water contol'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.doorOpen),
    'text': ('open door'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.shower),
    'text': ('shower controller'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.fireBurner),
    'text': ('Burner controller'),
    'subtext': ('4 Devices')
  },
  {
    'widget': (FontAwesomeIcons.houseChimney),
    'text': ('Chimmey'),
    'subtext': ('4 Devices')
  },
];
List names = [
  'AllDevice',
  'Living Rooms',
  'Bedroom',
  'Kitchen',
  'Master Bedroom',
  'sit out'
];



class RPSCustomPainter extends CustomPainter {
  Color color;
  Color secondcolor;
  RPSCustomPainter({required this.color,required this.secondcolor});
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..strokeWidth = 1.5
      ..shader = LinearGradient(
        colors: [
          secondcolor,
          Colors.grey.shade700,
           color,
          Colors.grey.shade700,
          secondcolor,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke;

     Path path_0 = Path();
 path_0.moveTo(size.width*0.0025000,size.height*0.4966667);
    path_0.quadraticBezierTo(size.width*0.2887500,size.height*0.5033333,size.width*0.3750000,size.height*0.4800000);
    path_0.cubicTo(size.width*0.4056250,size.height*0.4383333,size.width*0.4052083,size.height*0.3066667,size.width*0.5000000,size.height*0.3133333);
    path_0.cubicTo(size.width*0.5937500,size.height*0.3062500,size.width*0.6045833,size.height*0.4204167,size.width*0.6308333,size.height*0.4833333);
    path_0.quadraticBezierTo(size.width*0.7235417,size.height*0.4962500,size.width*1.0008333,size.height*0.5000000);


    canvas.drawPath(path_0, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


