import 'package:flutter/material.dart';



enum CustomStepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a text in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is displays nothing in its circle.
  unComplete,

  /// A step that is displays wrong icon in its circle and
  /// circle`s background color is red
  error,
}


const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);
final Color _kActive = Colors.deepOrange;
final Color _kInactive = Colors.black12;
final Color _kError = Colors.red.shade400;
const double _kStepSize = 24.0;


class CustomStep {
  /// Creates a step for a [Stepper].
  const CustomStep({
    this.title,
    this.subtitle,
    this.editingText,
    this.content,
    @required this.state,
    this.isActive = false,
  });

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final CustomStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;
  final Text editingText;
}

class CustomStepper extends StatelessWidget {

  CustomStepper({
    Key key,
    @required this.steps,
    this.physics,
  }): assert(steps != null),
      super(key: key);

  final List<CustomStep> steps;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return _buildVertical();
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return steps.length - 1 == index;
  }

  Color _circleColor(int index) {
    return steps[index].isActive ? _kActive : _kInactive;
  }

  Widget _buildLine(bool visible) {
    return Container(
      margin: EdgeInsets.only(left: _kStepSize / 2 - 1),
      width: visible ? 2.0 : 0.0,
      height: 16.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircleChild(int index) {
    final CustomStepState state = steps[index].state;
    assert(state != null);
    switch (state) {
      case CustomStepState.indexed:
        return Text(
          '${index + 1}',
        );
      case CustomStepState.editing:
        return steps[index].editingText;
      case CustomStepState.complete:
        return Icon(
          Icons.check,
          size: 18.0,
        );
      case CustomStepState.error:
        return Icon(
          Icons.close,
          size: 18.0,
        );
      case CustomStepState.unComplete:
        return null;
    }
    return null;
  }

  Widget _buildCircle(int index) {
    if (steps[index].state == CustomStepState.editing) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: steps[index].editingText,
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: _kStepSize,
        height: _kStepSize,
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: kThemeAnimationDuration,
          decoration: BoxDecoration(
            color: _circleColor(index),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: _buildCircleChild(index),
          ),
        ),
      );
    }
  }

  Widget _buildHeaderText(int index) {
    final List<Widget> children = <Widget>[];
    if (steps[index].title != null) {
      children.add(
        Expanded(
          flex: 3,
          child: steps[index].title,
        )
      );
    }
    if (steps[index].subtitle != null) {
      children.add(
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              steps[index].subtitle
            ],
          )
        )
      );
    }
    return Row(
      children: children,
    );
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Line parts are always added in order for the ink splash to
              // flood the tips of the connector lines.
              _buildLine(!_isFirst(index)),
              _buildCircle(index),
              _buildLine(!_isLast(index)),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(index),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildVerticalBody(int index) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: _kStepSize,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 2.0,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(
            start: 60.0,
            end: 24.0,
          ),
          child: Column(
            children: <Widget>[
              steps[index].content ?? Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVertical() {
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < steps.length; i += 1) {
      children.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildVerticalHeader(i),
              _buildVerticalBody(i),
            ],
          )
      );
    }
    return ListView(
      shrinkWrap: true,
      physics: physics,
      children: children,
    );
  }
}
