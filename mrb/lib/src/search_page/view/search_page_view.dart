import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/bloc/search_page_event.dart';
import 'package:mrb/src/search_page/bloc/search_page_state.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: _searchBarController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (String value) => context
                      .read<SearchPageBloc>()
                      .add(SearchPageSearchEvent(searchQuery: value)),
                ),
                if (state is SearchPageSuccessState)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.queryResult!.length,
                      itemBuilder: (context, index) => Container(
                        height: 100,
                        child: Column(children: [
                          Text(state.queryResult![index].name ?? "No name"),
                          Text(state.queryResult![index].email),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<ProfilePageBloc>(context)
                                        .add(ProfilePageLoadingEvent(
                                            associateEmail: FirebaseAuth
                                                .instance.currentUser!.email!,
                                            userEmail: state
                                                .queryResult![index].email));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()));
                                  },
                                  child: Text('Visit Profile'))
                            ],
                          )
                        ]),
                      ),
                    ),
                  )
                else
                  Text('No data'),
              ],
            ),
          );
        },
      ),
    );
  }
}
