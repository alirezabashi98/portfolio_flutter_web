class AppLink {
  static final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'alirezabashi98@gmail.com',
    queryParameters: {
      'subject': 'سلام',
      'body': 'متن ایمیل اینجا نوشته می‌شود',
    },
  );

  static final linkedin = Uri.parse(
    'https://www.linkedin.com/in/alirezabashi98',
  );
}
