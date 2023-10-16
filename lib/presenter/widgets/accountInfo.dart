import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0), // Adjust the border radius as needed
          ),
          child: Container(
            width: 394.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0), // Same as the card's border radius
              gradient: LinearGradient(
                colors: [
                  Color(0x14E5262B), // 9% opacity for #E5262B
                  Color(0x14932974), // 9% opacity for #932974
                  Color(0x1400ADEE), // 9% opacity for #00ADEE
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Subscriber ID: 1026589555 |',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF271F27),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.0,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        ' Account Balance: ₹1.33',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF271F27),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.0,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0), // Add spacing
                  Row(
                    children: [
                      Container(
                        width: 77.0,
                        height: 77.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red,
                            width: 6.0,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning_amber,
                              color: Colors.red,
                            ),
                            SizedBox(height: 4.0), // Added spacing
                            Text(
                              'Deactive',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF271F27),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0), // Add spacing
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              children: [
                                TextSpan(
                                  text: 'Expired on: ',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF271F27)),
                                ),
                                TextSpan(
                                  text: '02 Jul \'23',
                                  style: TextStyle(fontSize: 14, color: Color(0xFF271F27), fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0), // Add spacing
                          RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              children: [
                                TextSpan(
                                  text: 'Monthly Recharge: ',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF271F27)),
                                ),
                                TextSpan(
                                  text: '₹154',
                                  style: TextStyle(fontSize: 14, color: Color(0xFF271F27), fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0), // Add spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Colors.blue,
                              ),
                              Text(
                                'Refresh',
                                style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal, fontSize: 14, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(height: 4.0), // Add spacing
                      GestureDetector(
                        onTap: () {
                          // Handle button tap here
                        },
                        child: Container(
                          width: 88.0,
                          height: 33.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFE5262B),
                                Color(0xFF932974),
                                Color(0xFF00ADEE),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                          ),
                          child: Center(
                            child: Text(
                              'Recharge',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

            ),
          ),
        )

    );
  }
}
