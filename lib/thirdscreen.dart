import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
   List recordsbool=List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
final themecolor=Theme.of(context);
   
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
         Material(
            type: MaterialType.card,
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
             height: 50,
             width:MediaQuery.of(context).size.width/3-20,
            child:const Center(child: Text('Today')),
            ),
          ),
           Material(
            type: MaterialType.card,
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
             height: 50,
             width:MediaQuery.of(context).size.width/3-20,
            child: const Center(child:  Text('Weekly')),
            ),
          ),
          Material(
            type: MaterialType.card,
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
             height: 50,
             width:MediaQuery.of(context).size.width/3-20,
            child:const Center(child:  Text('Monthly',)),
            ),
          ),    
                
          ],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Material(
            type: MaterialType.card,
            elevation: 10,
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
             height: 80,
             width:MediaQuery.of(context).size.width/2-30,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FaIcon(FontAwesomeIcons.bolt,color: themecolor.colorScheme.primary,),
              const Text.rich( TextSpan(
                children: [
                  TextSpan(
                    text: '1020\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5
                    )
                  ),
                  TextSpan(
                    text: 'KWh used',
                     style: TextStyle(
                      fontSize: 12,
                      // height: 2
                    )
                  )
                ]
              ))
            ],),
            ),
          ),    
          Material(
            type: MaterialType.card,
            elevation: 10,
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
             height: 80,
             width:MediaQuery.of(context).size.width/2-30,
             child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FaIcon(FontAwesomeIcons.dollarSign,color: Colors.orange.shade200,),
              const Text.rich( TextSpan(
                children: [
                  TextSpan(
                    text: '186\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5
                    )
                  ),
                  TextSpan(
                    text: 'USD spent',
                     style: TextStyle(
                      fontSize: 12,
                      // height: 2
                    )
                  )
                ]
              ))
            ],),
            ),
          ),    
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              type: MaterialType.card,
              elevation: 10, 
              child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                              child: BarChart(
                                
                BarChartData(
                  
                  // backgroundColor: themecolor.primaryColor,
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                     
                    )
                   
                  ),
                  borderData: FlBorderData(
                    
                    show:false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 32.32,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 232.23,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 234.3,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(toY: 36.67,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 676.34,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(toY: 978.345 ,color: themecolor.colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(toY: 23.345,color: themecolor.colorScheme.primary),
                      ],
                      
                    ),
                    
                  ],
                ),
              ),

            
                ),
              
            ),
          ),
         const Padding(
            padding:  EdgeInsets.all(15.0),
            child:  Text('Device Power Consumption',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverList.separated(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return  SizedBox(
                              height: 70,
                              child:   Material(
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
                                type: MaterialType.card,
                                elevation: 10,
                                child: ListTile(
                                  leading:  Icon(Icons.light,color: themecolor.colorScheme.primary,),
                                  title: const Text('SmartLamp'),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        )
                      ],
                    ),
          ),
         
        ],
      ),
    );
  }
}

