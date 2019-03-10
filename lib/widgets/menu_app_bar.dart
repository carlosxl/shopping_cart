import 'package:flutter/material.dart';

import 'package:shopping_cart/framework/widgets.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';

class MenuAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarContent(),
      ),
      color: Theme.of(context).dialogBackgroundColor,
      notchMargin: 6.0,
      shape: CircularNotchedRectangle(),
    );
  }
}

class BarContent extends StatefulWidget {
  const BarContent({
    Key key,
  }) : super(key: key);

  @override
  BarContentState createState() {
    return new BarContentState();
  }
}

class BarContentState extends State<BarContent> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        TextStyle(fontSize: 24.0, color: Theme.of(context).primaryColorDark);

    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text('Total: ', style: style),
        BlocEventStateBuilder<CartEvent, CartState>(
          bloc: cartBloc,
          builder: (BuildContext context, CartState state) {
            _controller
              ..reset()
              ..forward();

            return FadeTransition(
              opacity: _controller,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    '${state.totalPrice} ',
                    style: style,
                  ),
                  Text(
                    '(${state.totalItems} ${state.totalItems == 1 ? 'item' : 'items'})',
                    style: style.copyWith(fontSize: 12.0),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
