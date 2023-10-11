import 'package:flutter/material.dart';
import 'package:plant_based_detection/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
  );

  late final Animation<Offset> _slideAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0), // Start off-screen to the right
    end: const Offset(-0.3, 0.0), // Slide to the center
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );
  late final Animation<Offset> _slideAnimation1 = Tween<Offset>(
    begin: const Offset(-0.1, 0.0), // Start off-screen to the right
    end: const Offset(0.1, 0.0), // Slide to the center
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 31),
      body: Center(
        child: SizedBox(
          width: size.width,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   right: 100,
              //   top: size.height * 0.32,
              //   child: FutureBuilder<void>(
              //     future:
              //         Future.delayed(Duration(seconds: 1)), // 1-second delay
              //     builder:
              //         (BuildContext context, AsyncSnapshot<void> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Container();
              //       } else {
              //         return SlideTransition(
              //           position: _slideAnimation1,
              //           child: FadeTransition(
              //             opacity: _animation,
              //             child: Image.asset(
              //               'assets/logo2.png',
              //               width: 130,
              //               height: 80,
              //             ),
              //           ),
              //         );
              //       }
              //     },
              //   ),
              // ),
              Positioned(
                right: 100,
                top: size.height * 0.32,
                child: SlideTransition(
                  position: _slideAnimation1,
                  child: FadeTransition(
                    opacity: _animation1,
                    child: Image.asset(
                      'assets/logo2.png',
                      width: size.width * 0.33,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
