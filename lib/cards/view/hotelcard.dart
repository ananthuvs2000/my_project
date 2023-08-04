import 'package:flutter/material.dart';
import 'package:myproject/hotels/hotels.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), ),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HotelsList(),));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Image.asset('assets/images/hotel1.jpeg'),
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hotel Rahmath',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    Text('4.5'),
                  ],
                ),
                
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Text('Near 2nd gate,Calicut'),
                        ],
                      ),
                    ),
                    
                  
                
              ],
              
            ),
            
          ),
        ),
      
      );
  }
}