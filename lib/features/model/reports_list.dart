import 'package:flutter/material.dart';

class ReportsList {
  static List<Map<String, dynamic>> reports = [
    {
      'id': 1,
      'title': 'Price Manipulation Report',
      'description': 'Report about a store increasing prices artificially',
      'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
      'status': 'Under Review',
      'location': 'Downtown Market, Main Street',
      'reporter': 'Anonymous',
      'tracking': [
        {
          'step': 1,
          'title': 'Report Submitted',
          'description':
              'Your report has been successfully submitted to our system.',
          'timestamp': DateTime.now().subtract(const Duration(days: 5)),
          'completed': true,
          'icon': Icons.assignment_turned_in,
        },
        {
          'step': 2,
          'title': 'Initial Review',
          'description':
              'Our team has reviewed your report and determined it requires further investigation.',
          'timestamp': DateTime.now().subtract(const Duration(days: 4)),
          'completed': true,
          'icon': Icons.find_in_page,
        },
        {
          'step': 3,
          'title': 'Under Investigation',
          'description':
              'Field agents have been assigned to investigate the reported issue.',
          'timestamp': DateTime.now().subtract(const Duration(days: 2)),
          'completed': true,
          'icon': Icons.search,
        },
        {
          'step': 4,
          'title': 'Evidence Collection',
          'description':
              'Our team is collecting evidence and documenting findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 1)),
          'completed': true,
          'icon': Icons.photo_camera,
        },
        {
          'step': 5,
          'title': 'Legal Assessment',
          'description':
              'Legal team is reviewing the evidence and determining appropriate actions.',
          'timestamp': DateTime.now(),
          'completed': false,
          'icon': Icons.gavel,
        },
        {
          'step': 6,
          'title': 'Action Taken',
          'description':
              'Enforcement actions will be taken based on investigation findings.',
          'timestamp': null,
          'completed': false,
          'icon': Icons.policy,
        },
        {
          'step': 7,
          'title': 'Case Closed',
          'description':
              'The case has been resolved and appropriate measures have been implemented.',
          'timestamp': null,
          'completed': false,
          'icon': Icons.task_alt,
        },
      ],
    },
    {
      'id': 2,
      'title': 'Expired Products',
      'description': 'Found expired products being sold at the supermarket',
      'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      'status': 'Investigating',
      'location': 'SuperMart, East Avenue',
      'reporter': 'John Doe',
      'tracking': [
        {
          'step': 1,
          'title': 'Report Submitted',
          'description':
              'Your report has been successfully submitted to our system.',
          'timestamp': DateTime.now().subtract(const Duration(days: 3)),
          'completed': true,
          'icon': Icons.assignment_turned_in,
        },
        {
          'step': 2,
          'title': 'Initial Review',
          'description':
              'Our team has reviewed your report and determined it requires further investigation.',
          'timestamp': DateTime.now().subtract(const Duration(days: 2)),
          'completed': true,
          'icon': Icons.find_in_page,
        },
        {
          'step': 3,
          'title': 'Under Investigation',
          'description':
              'Field agents have been assigned to investigate the reported issue.',
          'timestamp': DateTime.now().subtract(const Duration(days: 1)),
          'completed': true,
          'icon': Icons.search,
        },
        {
          'step': 4,
          'title': 'Evidence Collection',
          'description':
              'Our team is collecting evidence and documenting findings.',
          'timestamp': null,
          'completed': false,
          'icon': Icons.photo_camera,
        },
      ],
    },
    {
      'id': 3,
      'title': 'Illegal Products',
      'description': 'Report of counterfeit products being sold',
      'timestamp': DateTime.now().subtract(const Duration(days: 3)),
      'status': 'Resolved',
      'location': 'Central Market, West Street',
      'reporter': 'Jane Smith',
      'tracking': [
        {
          'step': 1,
          'title': 'Report Submitted',
          'description':
              'Your report has been successfully submitted to our system.',
          'timestamp': DateTime.now().subtract(const Duration(days: 10)),
          'completed': true,
          'icon': Icons.assignment_turned_in,
        },
        {
          'step': 2,
          'title': 'Initial Review',
          'description':
              'Our team has reviewed your report and determined it requires further investigation.',
          'timestamp': DateTime.now().subtract(const Duration(days: 9)),
          'completed': true,
          'icon': Icons.find_in_page,
        },
        {
          'step': 3,
          'title': 'Under Investigation',
          'description':
              'Field agents have been assigned to investigate the reported issue.',
          'timestamp': DateTime.now().subtract(const Duration(days: 7)),
          'completed': true,
          'icon': Icons.search,
        },
        {
          'step': 4,
          'title': 'Evidence Collection',
          'description':
              'Our team is collecting evidence and documenting findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 5)),
          'completed': true,
          'icon': Icons.photo_camera,
        },
        {
          'step': 5,
          'title': 'Legal Assessment',
          'description':
              'Legal team is reviewing the evidence and determining appropriate actions.',
          'timestamp': DateTime.now().subtract(const Duration(days: 4)),
          'completed': true,
          'icon': Icons.gavel,
        },
        {
          'step': 6,
          'title': 'Action Taken',
          'description':
              'Enforcement actions have been taken based on investigation findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 3)),
          'completed': true,
          'icon': Icons.policy,
        },
        {
          'step': 7,
          'title': 'Case Closed',
          'description':
              'The case has been resolved and appropriate measures have been implemented.',
          'timestamp': DateTime.now().subtract(const Duration(days: 3)),
          'completed': true,
          'icon': Icons.task_alt,
        },
      ],
    },
    {
      'id': 4,
      'title': 'Hygiene Violation',
      'description': 'Restaurant with poor sanitation conditions',
      'timestamp': DateTime.now().subtract(const Duration(days: 5)),
      'status': 'Closed',
      'location': 'Seafood Restaurant, Harbor Road',
      'reporter': 'Health Inspector',
      'tracking': [
        {
          'step': 1,
          'title': 'Report Submitted',
          'description': 'Your report has been successfully submitted to our system.',
          'timestamp': DateTime.now().subtract(const Duration(days: 15)),
          'completed': true,
          'icon': Icons.assignment_turned_in,
        },
        {
          'step': 2,
          'title': 'Initial Review',
          'description': 'Our team has reviewed your report and determined it requires further investigation.',
          'timestamp': DateTime.now().subtract(const Duration(days: 14)),
          'completed': true,
          'icon': Icons.find_in_page,
        },
        {
          'step': 3,
          'title': 'Under Investigation',
          'description': 'Field agents have been assigned to investigate the reported issue.',
          'timestamp': DateTime.now().subtract(const Duration(days: 12)),
          'completed': true,
          'icon': Icons.search,
        },
        {
          'step': 4,
          'title': 'Evidence Collection',
          'description': 'Our team is collecting evidence and documenting findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 10)),
          'completed': true,
          'icon': Icons.photo_camera,
        },
        {
          'step': 5,
          'title': 'Legal Assessment',
          'description': 'Legal team is reviewing the evidence and determining appropriate actions.',
          'timestamp': DateTime.now().subtract(const Duration(days: 8)),
          'completed': true,
          'icon': Icons.gavel,
        },
        {
          'step': 6,
          'title': 'Action Taken',
          'description': 'Enforcement actions have been taken based on investigation findings.',
          'timestamp': DateTime.now().subtract(const Duration(days: 6)),
          'completed': true,
          'icon': Icons.policy,
        },
        {
          'step': 7,
          'title': 'Case Closed',
          'description': 'The case has been closed due to severe violations. Business operations suspended.',
          'timestamp': DateTime.now().subtract(const Duration(days: 5)),
          'completed': true,
          'icon': Icons.task_alt,
        },
      ],
    },
  ];

  // Method to get a report by ID
  static Map<String, dynamic>? getReportById(int id) {
    try {
      return reports.firstWhere((report) => report['id'] == id);
    } catch (e) {
      return null; // Return null if report not found
    }
  }

  // Method to get all reports sorted by timestamp (newest first)
  static List<Map<String, dynamic>> getAllReportsSorted() {
    final sortedReports = List<Map<String, dynamic>>.from(reports);
    sortedReports.sort(
      (a, b) =>
          (b['timestamp'] as DateTime).compareTo(a['timestamp'] as DateTime),
    );
    return sortedReports;
  }
}
