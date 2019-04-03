import 'package:flutter/material.dart';
import 'package:flutter_study/blocs/blocs/initialization_page/init_event_state_bloc.dart';
import 'package:flutter_study/blocs/blocs/initialization_page/init_event_bloc.dart';
import 'package:flutter_study/blocs/blocs/initialization_page/init_state_bloc.dart';
import 'package:flutter_study/blocs/bloc_widgets/bloc_state_builder.dart';
import 'package:flutter_study/routes/application.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {

  AppInitBloc appInitBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appInitBloc = new AppInitBloc();
    appInitBloc.emitEvent(AppInitEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    appInitBloc?.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      bottom: true,
      child: new Scaffold(
        body: new Container(
          child: new Center(
            child: BlocEventStateBuilder<AppInitEvent, AppInitState> (
              bloc: appInitBloc,
              builder: (BuildContext context, AppInitState state) {
                if (state.isInitialized) {
                  print(state.isInitialized);
                  WidgetsBinding.instance.addPostFrameCallback((_){
                    Application.router.navigateTo(context, '/frosted-glass',replace: true);
                  });
//
                }
                return Text('Initialization in progress... ${state.progress}%');
              },
            ),
          ),
        ),
      ),
    );
  }
}
