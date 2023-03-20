import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parolla_game_mvvm/core/extension/context_extension.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
            appBar: myAppBar(),
            body: Observer(builder: (_) {
              return viewmodel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome ${userId}",
                          style: TextStyle(fontSize: 24),
                        ),
                        dropdown(),
                        postCards(viewmodel)
                      ],
                    );
            }));
      },
    );
  }

  Expanded postCards(HomeViewModel viewmodel) {
    return Expanded(
      child: ListView.builder(
          itemCount: viewmodel.userList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 400,
              width: 100,
              child: Card(
                color: Colors.amber.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    postCardTop(index, viewmodel),
                    divider(),
                    postCardBottom(viewmodel, index),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget postCardBottom(HomeViewModel viewModel, int index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Comments"),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_outward))
          ],
        ),
        SizedBox(
            width: 400,
            height: 100,
            child: Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(viewModel.commentList[index].email.toString()),
                subtitle: Text(
                  viewModel.commentList[index].body.toString(),
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ))
      ],
    );
  }

  Divider divider() {
    return Divider(
      thickness: 3,
      color: Colors.blue,
      indent: 25,
      endIndent: 25,
    );
  }

  ListTile postCardTop(int index, HomeViewModel viewmodel) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 50,
        child: Text("${index + 1}"),
      ),
      title: Text(viewmodel.postList[index].title.toString()),
      subtitle: Text(viewmodel.postList[index].body.toString()),
    );
  }

  Row dropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Posts:"), DropdownButton(items: [], onChanged: null)],
    );
  }

  Widget myListTile(BuildContext context, HomeViewModel viewmodel, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text(""),
          subtitle: Text("body"),
        ),
        Divider(
          thickness: 5,
          color: Colors.blue,
          indent: 15,
          endIndent: 15,
        ),
        Text("Comments"),
      ],
    );
  }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userId,
                style: TextStyle(color: Colors.amber, fontSize: 18),
              ),
            ),
          );
        },
      ),
      actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.list))],
    );
  }
}
