import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  /// Route name
  static const String routeName = "/AboutScreen";
  const AboutScreen();

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Blab Dashatar'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 8.0,
          right: 8.0,
        ),
        child: ListView(
          children: [
            Container(
              child: RichText(
                text: TextSpan(
                  style: theme.primaryTextTheme.bodyText1,
                  text:
                      "It must be confessed that I tried out different avatars"
                      " by playing with attributes, and I wanted to"
                      " know what avatar will be created :D"
                      "\nAs a result of that, this project has been made."
                      "\n\nThis application lets you retrieve all dashatars "
                      "by filtering them."
                      "\nIt is also possible to make a favourite list"
                      " out of them and download the desired"
                      " image for future use."
                      "\n\nThis project is for ",
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        child: Text(
                          '#30DaysOfFlutter',
                          style: theme.primaryTextTheme.bodyText2,
                        ),
                        onTap: _twitterHashtag,
                      ),
                    ),
                    const TextSpan(
                      text: '.\nYou can find the source on ',
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        child: Text(
                          'my github',
                          style: theme.primaryTextTheme.bodyText2,
                        ),
                        onTap: _myGithub,
                      ),
                    ),
                    const TextSpan(
                      text: '.\nHope You like it, '
                          'any contribution is greatly appreciated.',
                    ),
                    const TextSpan(
                        text: '\n\nYou can contact me:\n'
                            'Email: '),
                    WidgetSpan(
                      child: GestureDetector(
                        child: Text(
                          'niloo.jv@gmail.com',
                          style: theme.primaryTextTheme.bodyText2,
                        ),
                        onTap: _emailLauncher,
                      ),
                    ),
                    const TextSpan(
                      text: '\nTwitter: ',
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        child: Text(
                          '@rafo_olin',
                          style: theme.primaryTextTheme.bodyText2,
                        ),
                        onTap: _myTwitter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Licences"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const LicensePage(
                    applicationName: 'Blab Dashatar',
                    applicationVersion: 'V1.0.0',
                    applicationLegalese: 'MIT',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _twitterHashtag() async {
    const url = "https://twitter.com/hashtag/30daysofflutter";
    ThemeData theme = Theme.of(context);

    bool can = await canLaunch(url);
    if (can)
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black87),
                text: 'Could not launch',
                children: [
                  TextSpan(
                      style: theme.primaryTextTheme.bodyText2,
                      text: ' #30daysofflutter'),
                  TextSpan(text: ' hashtag!')
                ]),
          ),
        ),
      );
  }

  Future<void> _myTwitter() async {
    const url = "https://twitter.com/rafo_olin";
    ThemeData theme = Theme.of(context);

    bool can = await canLaunch(url);
    if (can)
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black87),
                text: 'Could not launch',
                children: [
                  TextSpan(
                      style: theme.primaryTextTheme.bodyText2,
                      text: ' @rafo_olin'),
                  TextSpan(text: ' twitter account!')
                ]),
          ),
        ),
      );
  }

  Future<void> _myGithub() async {
    const url = "http://gitub.com/rafoolin";
    ThemeData theme = Theme.of(context);

    bool can = await canLaunch(url);
    if (can)
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black87),
                text: 'Could not launch',
                children: [
                  TextSpan(
                      style: theme.primaryTextTheme.bodyText2,
                      text: ' rafoolin'),
                  TextSpan(text: ' Github account!')
                ]),
          ),
        ),
      );
  }

  Future<void> _emailLauncher() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'niloo.jv@gmail.com',
      queryParameters: {'subject': 'BlabDashatar'},
    );

    bool can = await canLaunch(email.toString());

    if (can)
      await launch(email.toString());
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch an Email app!',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      );
  }
}
