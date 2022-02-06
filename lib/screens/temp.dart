// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';

// class Temp extends StatefulWidget {
//   const Temp({Key? key}) : super(key: key);

//   @override
//   _TempState createState() => _TempState();
// }

// final List data = [
//   {'color': Colors.red},
//   {'color': Colors.green},
//   {'color': Colors.blue}
// ];

// class _TempState extends State<Temp> {
//   // List<Card> cards = [
//   //   Card(
//   //     data[0]['color'],
//   //   ),
//   //   Card(
//   //     data[1]['color'],
//   //   ),
//   //   Card(
//   //     data[2]['color'],
//   //   )
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff000000),
//       body: Container(
//         child: Scaffold(
//           body: Container(
//             height: 500,
//             child: Swiper(
//               itemCount: data.length,
//               itemWidth: MediaQuery.of(context).size.width - 2 * 64,
//               layout: SwiperLayout.STACK,
//               itemBuilder: (context, index) {
//                 return Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Card(
//                           color: Colors.white,
//                           child: Column(
//                             children: [],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
