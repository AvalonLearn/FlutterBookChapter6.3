import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        'SingleChildScrollView': (context) => const SingleChildScrollViewPage(),
        'ListView': (context) => const ListViewPage(),
        'ListView.builder': ((context) => const ListViewBuilderPage()),
        'ListView.separated': ((context) => const ListViewSeparated()),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              child: Text(
                'SingleChildScrollView',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'SingleChildScrollView');
              },
            ),
            TextButton(
              child: Text(
                'ListView',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'ListView');
              },
            ),
            TextButton(
              child: Text(
                'ListView.builder',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'ListView.builder');
              },
            ),
            TextButton(
              child: Text(
                'ListView.separated',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'ListView.separated');
              },
            ),
            TextButton(
              child: Text(
                'FixedExtentList',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('FixedExtentList'),
                        ),
                        body: ListView.builder(
                          prototypeItem: ListTile(
                            title: Text('1'),
                          ), //原型组件
                          itemBuilder: (context, index) {
                            return Container(
                              child: ListTile(
                                title: Text('$index'),
                                subtitle: Divider(color: Colors.white),
                              ),
                              color: Colors.blue.shade200,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text(
                'InfiniteListView',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfiniteListView();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    List<Widget> list = str
        .split("")
        //每一个字母都用一个Text显示,字体为原来的两倍
        .map((e) => Text(
              e,
              style: Theme.of(context).textTheme.bodyText1,
            ))
        .toList();
    List<Widget> newList = [];
    newList.addAll(list);
    newList.add(TextButton(
      child: Text(
        'back',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onPressed: () {
        Navigator.pop(context);
        //Navigator.pushNamed(context, 'home');
      },
    ));
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView')),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: newList,
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListViewPage')),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            'I\'m dedicating every day to you',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Domestic life was never quite my style',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'When you smile, you knock me out, I fall apart',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'And I thought I was so smart',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'back',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.builder')),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'back',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }
          return ListTile(
            title: Text(
              '$index',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
          //return Text('$index');
        },
      ),
    );
  }
}

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return Scaffold(
      appBar: AppBar(title: Text('ListView.separated')),
      body: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext context, index) => ListTile(
                title: Text("$index"),
              ),
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          }),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({Key? key}) : super(key: key);

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('100个单词')),
      body: Column(
        children: [
          ListTile(
              title: Text('Word List',
                  style: Theme.of(context).textTheme.bodyText1)),
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (context, index) {
                if (_words[index] == loadingTag) {
                  if (_words.length - 1 < 100) {
                    _retrieveData();
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0),
                      ),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "No more words",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                }
                return ListTile(
                  title: Text(_words[index]),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
