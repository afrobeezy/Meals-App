import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _english = true;
    bool _notenglish = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Language',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Akan',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Bimoba',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Bisa',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Dagbani',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Éwé',
                ),
                Divider(color: Colors.grey[200]),
                Builder(
                  builder: (context) => SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _english,
                    onChanged: (bool value) {
                      // setState(() {
                      //   _english = value;
                      // });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'English is the only supported language',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Theme.of(context).focusColor),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.red,
                    title: Text(
                      'English',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Theme.of(context).focusColor),
                    ),
                  ),
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Farefare',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Ga',
                ),
                Divider(color: Colors.grey[200]),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Ghanaian Pidgin English',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Gonja',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Hausa',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Konkomba',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Kplang',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Kusaal',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Mampruli',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Nyangbo',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Safaliba',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Sisaala',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Tampulma',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Tuwuli',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Vagla',
                ),
                OtherLaguages(
                  notenglish: _notenglish,
                  name: 'Wasa',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtherLaguages extends StatelessWidget {
  final String name;
  const OtherLaguages({
    Key key,
    this.name,
    @required bool notenglish,
  })  : _notenglish = notenglish,
        super(key: key);

  final bool _notenglish;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        value: _notenglish,
        onChanged: (bool value) {
          // setState(() {
          //   _english = value;
          // });
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Support for other languages will be available soon.',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).focusColor),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        },
        activeColor: Colors.white,
        activeTrackColor: Colors.red,
        title: Text(
          name,
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Theme.of(context).focusColor),
        ),
      ),
    );
  }
}
