import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: Text(
              'Contact Us',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          FadeIn(
            duration: const Duration(milliseconds: 900),
            child: SizedBox(
              width: 700.w,
              child: Text(
                'Have questions or need support? Reach out to our team and we’ll be happy to help you.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.darkBlue, fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: SizedBox(width: 400.w, child: _ContactForm()),
          ),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            validator:
                (value) =>
                    value == null || !value.contains('@')
                        ? 'Enter a valid email'
                        : null,
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _messageController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter your message'
                        : null,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // TODO: Handle send action (show snackbar for now)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent!')),
                  );
                }
              },
              child: const Text('Send', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
