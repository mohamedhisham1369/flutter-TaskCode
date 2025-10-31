import 'package:flutter/material.dart';

class AppColors {
  // Background Colors
  static const Color primaryBackground = Color(0xFF000000);
  static const Color secondaryBackground = Color(0xFF0A0A0A);
  static const Color cardBackground = Color(0xFF171717);
  static const Color dividerColor = Color(0xFF2D2D2D);
  static const Color lightDividerColor = Color(0xFF262626);
  static const Color darkDividerColor = Color(0xff484848);
  static const Color lightBgColor = Color(0xff262626);

  // Primary Text Colors
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFF9CA3AF);
  static const Color disabledText = Color(0xFF6B7280);

  // Action Button Colors
  static const Color accentYellow = Color(0xffFFC268);
  static const Color accentYellowDark = Color(0xFFD87E00);
  static const Color moreButtonBackground = Color(0xFF3F3F3F);
  static const Color filterButtonBackground = Color(0xff171717);

  // Status Colors - Ready for Travel
  static const Color readyForTravelPrimary = Color(0xFF33BFED);
  static const Color readyForTravelSecondary = Color(0xFF147A9A);

  // Status Colors - Pending Approval
  static const Color pendingApprovalPrimary = Color(0xFFC25F30);
  static const Color pendingApprovalSecondary = Color(0xFF8A3E1D);

  // Status Colors - Proposal Sent
  static const Color proposalSentPrimary = Color(0xFFFFC268);
  static const Color proposalSentSecondary = Color(0xFFD87E00);

  // Status Colors - Default
  static const Color defaultStatusPrimary = Color(0xFF8B5CF6);
  static const Color defaultStatusSecondary = Color(0xFF5B21B6);

  // Gradient Colors
  static const List<Color> activeNavGradient = [
    Color(0xFFFFA726),
    Color(0xFFFF8A00),
  ];

  // Opacity variants
  static const double opacityLight = 0.1;
  static const double opacityMedium = 0.15;
  static const double opacityHeavy = 0.25;
  static const double opacityStrong = 0.4;
  static const double opacityIntense = 0.7;
  static const double opacityGlass = 0.8;

  // Helper method to get status gradient based on status string
  static List<Color> getStatusGradient(String status) {
    switch (status.toLowerCase()) {
      case 'ready for travel':
        return [readyForTravelPrimary, readyForTravelSecondary];
      case 'pending approval':
        return [pendingApprovalPrimary, pendingApprovalSecondary];
      case 'proposal sent':
        return [proposalSentPrimary, proposalSentSecondary];
      default:
        return [defaultStatusPrimary, defaultStatusSecondary];
    }
  }

  // Helper method to get status gradient with opacity for glassmorphism
  static List<Color> getStatusGradientWithOpacity(String status) {
    final colors = getStatusGradient(status);
    return [
      colors[0].withValues(alpha: opacityHeavy),
      colors[1].withValues(alpha: opacityMedium),
    ];
  }

  // Helper method to get status border color
  static Color getStatusBorderColor(String status) {
    final colors = getStatusGradient(status);
    return colors[0].withValues(alpha: opacityGlass);
  }
}
