import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../bottom_navigation.dart'; // Placeholder for dashboard


class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  final int _otpLength = 6;
  int _secondsRemaining = 30;
  bool _canResend = false;
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 30;
    _canResend = false;
    Future.delayed(const Duration(seconds: 1), _tick);
  }

  void _tick() {
    if (_secondsRemaining > 0) {
      if (mounted) {
        setState(() {
          _secondsRemaining--;
        });
        Future.delayed(const Duration(seconds: 1), _tick);
      }
    } else {
      if (mounted) {
        setState(() {
          _canResend = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_clock_outlined,
                size: 80,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 24),
              const Text(
                'Enter Verification Code',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'We have sent a verification code to your mobile number +91 XXXXX XXXXX',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              // OTP Input Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _otpLength,
                  (index) => Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < _otpLength - 1) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                             FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _canResend
                    ? 'Did not receive the code?'
                    : 'Resend code in $_secondsRemaining s',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              if (_canResend)
                TextButton(
                  onPressed: () {
                    startTimer();
                    // Implement resend logic
                  },
                  child: const Text('Resend OTP'),
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Dashboard or Login
                     Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavigation()),
                      (route) => false,
                    );
                  },
                  child: const Text('Verify'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
