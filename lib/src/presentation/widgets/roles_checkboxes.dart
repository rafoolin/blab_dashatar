import 'package:flutter/material.dart';

import '../../logic/logic.dart';
import '../../constants/constants.dart';

class RolesCheckboxes extends StatelessWidget {
  const RolesCheckboxes();
  @override
  Widget build(BuildContext context) {
    FilterBloc filterBloc = BlocProvider.of<FilterBloc>(context);
    List<Role> roles;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<Role>>(
        stream: filterBloc.roleStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) return Container();

          roles = snapshot.data;
          return Column(
            children: Role.values
                .map(
                  (role) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(role.name),
                    value: roles.contains(role),
                    onChanged: (isChecked) {
                      if (isChecked)
                        roles.add(role);
                      else
                        roles.remove(role);

                      filterBloc.addRoles(roles);
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
