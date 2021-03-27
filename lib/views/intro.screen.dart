import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:redux/redux.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: 'Pick your deck...'.toUpperCase(),
        maxLineTitle: 2,
        description: 'Choose from a list of preconfigured decks: Standard, T-Shirt, Fibonacci or Risk Planning!',
        pathImage: 'assets/images/decks_row.png',
        backgroundColor: Colors.green,
      ),
    );
    slides.add(
      Slide(
        title: '...or create your own'.toUpperCase(),
        maxLineTitle: 2,
        description:
            'Pick from all the available cards. Mix, sort and put together a custom deck tailored for you and your team!',
        pathImage: 'assets/images/deck_back_black_slim.png',
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
    slides.add(
      Slide(
        title: 'Join your team!'.toUpperCase(),
        maxLineTitle: 2,
        description: 'Join an online room together with your team and play Planning Poker Online!',
        centerWidget: const Icon(
          Icons.people,
          size: 128,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => IntroSlider(
        slides: slides,
        onDonePress: () {
          vm.completeIntro();
          final routeName = ModalRoute.of(context).settings.name;
          if (routeName == Routes.settings_intro) {
            Navigator.of(context).maybePop();
          } else {
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
        },
      ),
    );
  }
}

class _ViewModel {
  final bool seenIntro;
  final Function() completeIntro;

  _ViewModel({
    required this.seenIntro,
    required this.completeIntro,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      seenIntro: settingsSelector(store.state).seenIntro,
      completeIntro: () {
        store.dispatch(SetSettingsAction(
          settings: settingsSelector(store.state).copyWith(seenIntro: true),
        ));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _ViewModel && runtimeType == other.runtimeType && seenIntro == other.seenIntro;

  @override
  int get hashCode => seenIntro.hashCode;
}
