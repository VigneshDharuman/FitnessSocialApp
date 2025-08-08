import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/journey_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/learn_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/onboarding/login_screen.dart';
import 'screens/onboarding/signup_screen.dart';
import 'screens/onboarding/profile_setup_screen.dart';
import 'screens/onboarding/goals_selection_screen.dart';
import 'screens/onboarding/tutorial_screen.dart';

void main() {
  runApp(const ThriveSpaceApp());
}

class ThriveSpaceApp extends StatelessWidget {
  const ThriveSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThriveSpace',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF5f41c4,
          <int, Color>{
            50: const Color(0xFFF3F0FF),
            100: const Color(0xFFE4D9FF),
            200: const Color(0xFFCBB8FF),
            300: const Color(0xFFAC92FF),
            400: const Color(0xFF8B6BFF),
            500: const Color(0xFF5f41c4),
            600: const Color(0xFF5339B0),
            700: const Color(0xFF47309C),
            800: const Color(0xFF3B2788),
            900: const Color(0xFF2F1E74),
          },
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5f41c4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AppWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  AppState _appState = AppState.loading;
  Map<String, dynamic> _userData = {};
  Map<String, dynamic> _onboardingData = {};

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash duration
    
    // Check if user is logged in and has completed onboarding
    // In a real app, you'd check local storage/preferences
    final bool isLoggedIn = false; // Mock check
    final bool hasCompletedOnboarding = false; // Mock check
    
    if (isLoggedIn && hasCompletedOnboarding) {
      setState(() {
        _appState = AppState.main;
      });
    } else {
      setState(() {
        _appState = AppState.welcome;
      });
    }
  }

  void _handleLogin(Map<String, dynamic> userData) {
    setState(() {
      _userData = userData;
      _appState = AppState.profileSetup;
    });
  }

  void _handleSignup(Map<String, dynamic> userData) {
    setState(() {
      _userData = userData;
      _appState = AppState.profileSetup;
    });
  }

  void _handleProfileSetup(Map<String, dynamic> profileData) {
    setState(() {
      _onboardingData.addAll(profileData);
      _appState = AppState.goalsSelection;
    });
  }

  void _handleGoalsSelection(Map<String, dynamic> goalsData) {
    setState(() {
      _onboardingData.addAll(goalsData);
      _appState = AppState.tutorial;
    });
  }

  void _handleTutorialComplete() {
    setState(() {
      _appState = AppState.main;
    });
    // In a real app, save onboarding completion to local storage
  }

  @override
  Widget build(BuildContext context) {
    switch (_appState) {
      case AppState.loading:
        return SplashScreen(onComplete: () {});

      case AppState.welcome:
        return WelcomeScreen(
          onGetStarted: () => setState(() => _appState = AppState.signup),
          onSignIn: () => setState(() => _appState = AppState.login),
        );

      case AppState.login:
        return LoginScreen(
          onLogin: _handleLogin,
          onSignup: () => setState(() => _appState = AppState.signup),
          onBack: () => setState(() => _appState = AppState.welcome),
          onForgotPassword: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Forgot Password - Coming Soon!')),
            );
          },
        );

      case AppState.signup:
        return SignupScreen(
          onSignUp: _handleSignup,
          onSignIn: () => setState(() => _appState = AppState.login),
          onBack: () => setState(() => _appState = AppState.welcome),
        );

      case AppState.profileSetup:
        return ProfileSetupScreen(
          onNext: _handleProfileSetup,
          onBack: () => setState(() => _appState = AppState.signup),
          userData: _userData,
        );

      case AppState.goalsSelection:
        return GoalsSelectionScreen(
          onNext: _handleGoalsSelection,
          onBack: () => setState(() => _appState = AppState.profileSetup),
        );

      case AppState.tutorial:
        return TutorialScreen(
          onComplete: _handleTutorialComplete,
          onBack: () => setState(() => _appState = AppState.goalsSelection),
        );

      case AppState.main:
        return const MainNavigation();
    }
  }
}

enum AppState {
  loading,
  welcome,
  login,
  signup,
  profileSetup,
  goalsSelection,
  tutorial,
  main,
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  int _unreadNotifications = 3;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MyJourneyScreen(),
    const ProfileScreen(),
    const MessagesScreen(),
    const LearnScreen(),
  ];

  final List<TabItem> _tabs = [
    TabItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    TabItem(
      icon: Icons.trending_up_outlined,
      activeIcon: Icons.trending_up,
      label: 'Progress',
    ),
    TabItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
    TabItem(
      icon: Icons.forum_outlined,
      activeIcon: Icons.forum,
      label: 'Community',
    ),
    TabItem(
      icon: Icons.school_outlined,
      activeIcon: Icons.school,
      label: 'Learn',
    ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openSearch() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SearchScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  void _openNotifications() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const NotificationsScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  void _openCreatePost() {
    // TODO: Implement create post screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Create Post - Coming Soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          _screens[_currentIndex],
          
          // Header Actions (Search & Notifications) - Only show on non-Profile and non-Community screens
          if (_currentIndex != 2 && _currentIndex != 3)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              right: 16,
              child: Row(
                children: [
                  _buildHeaderButton(
                    icon: Icons.search,
                    onPressed: _openSearch,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderButton(
                    icon: Icons.notifications_outlined,
                    onPressed: _openNotifications,
                    badge: _unreadNotifications > 0 ? _unreadNotifications : null,
                  ),
                ],
              ),
            ),
          
          // Floating Action Button
          Positioned(
            bottom: 96,
            right: 16,
            child: FloatingActionButton(
              onPressed: _openCreatePost,
              backgroundColor: const Color(0xFFFF6B35),
              foregroundColor: Colors.white,
              elevation: 4,
              child: const Icon(Icons.add, size: 28),
            ),
          ),
        ],
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 0.5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_tabs.length, (index) {
                final tab = _tabs[index];
                final isActive = _currentIndex == index;
                
                return GestureDetector(
                  onTap: () => _onTabTapped(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive 
                          ? theme.primaryColor.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isActive)
                          Container(
                            width: 32,
                            height: 2,
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        const SizedBox(height: 4),
                        Icon(
                          isActive ? tab.activeIcon : tab.icon,
                          color: isActive 
                              ? theme.primaryColor 
                              : const Color(0xFF64748b),
                          size: 20,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                            color: isActive 
                                ? theme.primaryColor 
                                : const Color(0xFF64748b),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton({
    required IconData icon,
    required VoidCallback onPressed,
    int? badge,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF0a0a0a),
                  size: 20,
                ),
                if (badge != null && badge > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 16,
                      height: 16,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFdc2626),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          badge > 9 ? '9+' : badge.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  TabItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
