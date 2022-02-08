import 'package:beamer/beamer.dart';
import 'package:example_proj/data/models/user/user.dart';
import 'package:example_proj/presentation/features/users/users_view_model.dart';
import 'package:example_proj/presentation/shared/custom_app_bar.dart';
import 'package:example_proj/services/project/user/user_service_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Users'),
      body: ViewModelBuilder<UsersViewModel>.reactive(
        viewModelBuilder: () => UsersViewModel(
          context.read<UserServiceInterface>(),
        ),
        onModelReady: (model) => model.onReady(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (model.hasError) {
            return const Center(child: Text('Error'));
          }

          return ListView.separated(
            itemCount: model.users!.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final User user = model.users![index];
              return ListTile(
                onTap: () {
                  Beamer.of(context).beamToNamed('/posts/${user.id}');
                },
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name!),
                      Wrap(
                        runSpacing: 16,
                        spacing: 16,
                        children: [
                          if (user.website != null) Text(user.website!),
                          if (user.phone != null) Text(user.phone!),
                          if (user.company != null) Text(user.company!.name!),
                        ],
                      ),
                    ],
                  ),
                ),
                isThreeLine: true,
                leading: const Icon(Icons.person),
                title: Text(
                  user.email!,
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
