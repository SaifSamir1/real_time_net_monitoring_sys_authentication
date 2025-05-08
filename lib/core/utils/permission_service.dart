

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class PermissionService {
  /// Method to request gallery permission
  Future<bool> requestGalleryPermission(BuildContext context) async {
    final status = await Permission.photos.status;

    if (status.isGranted) {
      // ✅ الإذن بالفعل ممنوح
      return true;
    }

    if (status.isDenied) {
      // ❌ الإذن مرفوض سابقًا، نطلبه مرة أخرى
      final newStatus = await Permission.photos.request();
      return newStatus.isGranted;
    }

    if (status.isPermanentlyDenied) {
      // ⚠️ المستخدم رفض الإذن نهائيًا، لازم يفتح الإعدادات
      _showSettingsDialog(context);
      return false;
    }

    if (status.isRestricted) {
      // 🚫 قيود النظام تمنع الوصول (غالبًا في iOS)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Access to photos is restricted by system settings.')),
      );
      return false;
    }

    return false;
  }

  /// Show dialog to open settings if permission is permanently denied
  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'This feature requires access to your photos. Please enable it in settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }
}
