import 'package:flutter/material.dart';

import '../../logic/logic.dart';

class StrengthSlider extends StatelessWidget {
  const StrengthSlider();

  @override
  Widget build(BuildContext context) {
    FilterBloc filterBloc = BlocProvider.of<FilterBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Strength: '),
          StreamBuilder<double>(
            stream: filterBloc.strengthStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) return Container();

              return Slider.adaptive(
                label: '${snapshot.data}',
                divisions: 5,
                min: 0,
                max: 5,
                value: snapshot.data,
                onChanged: (strength) {
                  filterBloc.addStrength(strength);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
