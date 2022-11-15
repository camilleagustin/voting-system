import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/screens.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VoteApp());
}

class VoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
          context
              .read<AuthenticationService>()
              .authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/wrapper': (context) => Wrapper(),
            '/login': (context) => LoginScreen(),
            '/home': (context) => HomeScreen(),
            '/admin_home': (context) => AdminHomeScreen(),
            '/user_home': (context) => UserHomeScreen(),
            '/form': (context) => FormScreen(),
            '/response': (context) => ResponseScreen(),
            '/status': (context) => StatusScreen(),
            '/college': (context) => CollegeDepartmentScreen(),
            '/elect': (context) => ElectScreen(),
            '/vote_wrapper': (context) => VoteWrapper(),
            '/school_level': (context) => SchoolLevelScreen(),
            '/vote': (context) => VoteScreen(),
            '/thank_you': (context) => ThankYouScreen(),
            '/results': (context) => ResultsScreen(),
            '/shs_wrapper': (context) => SHSWrapper(),
            '/college_wrapper': (context) => CollegeWrapper(),
            '/list': (context) => ListScreen(),
            '/details': (context) => DetailsScreen(),
            '/delete': (context) => DeleteCandidateScreen(),
            '/list_wrapper': (context) => ListWrapper(),
            '/form_wrapper': (context) => FormWrapper(),
          }),
    );
  }
}
