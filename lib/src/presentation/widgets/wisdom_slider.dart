import 'package:flutter/material.dart';

import '../../logic/logic.dart';

class WisdomSlider extends StatelessWidget {
  const WisdomSlider();

  @override
  Widget build(BuildContext context) {
    FilterBloc filterBloc = BlocProvider.of<FilterBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Wisdom: '),
          StreamBuilder<double>(
            stream: filterBloc.wisdomStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) return Container();
              return Slider.adaptive(
                label: '${snapshot.data}',
                divisions: 5,
                min: 0,
                max: 5,
                value: snapshot.data,
                onChanged: (wisdom) {
                  filterBloc.addWisdom(wisdom);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
