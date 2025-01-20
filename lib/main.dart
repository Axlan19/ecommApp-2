import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sececommerce/firebase_options.dart';
import 'package:sececommerce/provider/add_to_cart_provider.dart';
import 'package:sececommerce/provider/fav_provider.dart';
import 'package:sececommerce/views/Cart/cart_screen.dart';
import 'package:sececommerce/views/favorite_screen.dart';
import 'package:sececommerce/views/Home/home_screen.dart';
import 'package:sececommerce/views/login_view.dart';
import 'package:sececommerce/views/Profile/profile_screen.dart';
import 'package:sececommerce/views/register_view.dart';
//import 'package:sececommerce/views/verify_email_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    // MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     appBarTheme:
    //         AppBarTheme(color: const Color.fromARGB(255, 197, 133, 84)),
    //     colorScheme: ColorScheme.fromSeed(
    //         seedColor: const Color.fromARGB(255, 141, 81, 8)),
    //     useMaterial3: true,
    //   ),
    //   home: const HomePage(),
    //   routes: {
    //     '/login/': (context) => const LoginView(),
    //     '/register/': (context) => const RegisterView(),
    //   },
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme:
              AppBarTheme(color: const Color.fromARGB(255, 241, 202, 172)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 141, 81, 8)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/login/': (context) => const LoginView(),
          '/register/': (context) => const RegisterView(),
        },
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainView();
          } else {
            return LoginView();
          }
        },
      ),
    );

    //   body: StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         // Show a loading indicator while the stream is initializing
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasData) {
    //         // Get the currently signed-in user
    //         final User? user = snapshot.data;
    //         if (user != null) {
    //           if (user.emailVerified == false) {
    //             return VerifyEmailView();
    //           } else if (user.emailVerified == true) {
    //             return MainView();
    //           }
    //         }
    //       } else if (snapshot.hasError) {
    //         // Handle potential errors
    //         return Center(
    //           child: Text(
    //             'Error: ${snapshot.error}',
    //           ),
    //         );
    //       }
    //       // If no user is signed in
    //       return LoginView();
    //     },
    //   ),
    // );
    // return FutureBuilder(
    //   future: Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   ),
    //   builder: (context, snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.done:
    //         final user = FirebaseAuth.instance.currentUser;
    //         if (user != null) {
    //           if (user.emailVerified) {
    //             print('Email is verified.');
    //           } else {
    //             return const VerifyEmailView();
    //           }
    //         } else {
    //           return const LoginView();
    //         }
    //         return const MainView();
    //       default:
    //         return const CircularProgressIndicator();
    //     }
    //   },
    // );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  List views = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Our Shop'),
      // ),
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Faviorite',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ]),
    );
  }
}
