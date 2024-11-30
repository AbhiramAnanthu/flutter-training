import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _app_bar(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/eiffel-tower-3349075_1280.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        _date_display(),
        SizedBox(
          height: 14,
        ),
        _temperature_display(),
        Container(
            child: Row(
          children: [Container()],
        ))
      ]),
    );
  }

  Container _temperature_display() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 300, 0, 300),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(child: SvgPicture.asset('assets/sunny.svg')),
                Center(
                  child: Text(
                    "Clear",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                )
              ],
            )),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "24",
                      style: GoogleFonts.roboto(
                        fontSize: 86,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "ºC",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container _date_display() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 200, 0, 200),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "June 07",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "Updated as of 6/7/2023 12:25 PM",
              style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
            )
          ],
        ));
  }

  AppBar _app_bar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 100.0,
      leading: Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.white, size: 31),
            Text("Paris",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18))
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 20),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 32,
              )),
        )
      ],
    );
  }
}
