import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parolla_game_mvvm/core/constants/enums/locale_keys_enum.dart';
import 'package:parolla_game_mvvm/core/extension/context_extension.dart';
import 'package:parolla_game_mvvm/core/init/cache/locale_manager.dart';
import 'package:parolla_game_mvvm/view/home/model/comment_model.dart';
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
            backgroundColor: Colors.grey.shade400,
            appBar: myAppBar(),
            body: Observer(builder: (_) {
              return viewmodel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: context.paddingMediumHorizontal,
                          child: Center(
                            child: Text(
                              "Welcome ${userId}",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        dropdown(viewmodel),
                        postCards(viewmodel)
                      ],
                    );
            }));
      },
    );
  }

  Widget postCards(HomeViewModel viewmodel) {
    return Observer(builder: (_) {
      return Expanded(
        child: ListView.builder(
            itemCount: viewmodel.filteredPostList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 600,
                width: context.width,
                child: Card(
                  color: Colors.amber.shade200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      postCardTop(index, viewmodel),
                      divider(),
                      postCardBottom(viewmodel, context, index),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }

  Widget postCardBottom(
      HomeViewModel viewModel, BuildContext context, int idx) {
    List<CommentModel> cList = viewModel.commentList
        .where(
            (element) => element.postId == viewModel.filteredPostList[idx].id)
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Comments",
          style: TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 400,
              height: 230,
              child: ListView.builder(
                  itemCount: cList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 350,
                      height: 150,
                      child: Card(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(cList[index].email.toString()),
                          subtitle: Text(
                            cList[index].body.toString(),
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    );
                  })),
        )
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

  Widget postCardTop(int index, HomeViewModel viewmodel) {
    return Observer(builder: (_) {
      return ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 50,
          child: Text(viewmodel.filteredPostList[index].userId.toString()),
        ),
        title: Text(viewmodel.filteredPostList[index].title.toString()),
        subtitle: Text(viewmodel.filteredPostList[index].body.toString()),
      );
    });
  }

  Row dropdown(HomeViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Posts:"),
        Observer(builder: (_) {
          return DropdownButton<int>(
              value: viewmodel.dropDownIndex,
              items: //<int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  viewmodel.dropDownItems
                      .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                viewmodel.changeDropdown(value);
                viewmodel.filterComments();
              });
        })
      ],
    );
  }

  // Widget myListTile(BuildContext context, HomeViewModel viewmodel, int index) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       ListTile(
  //         leading: CircleAvatar(
  //           backgroundColor: Colors.blue,
  //         ),
  //         title: Text(viewmodel.postList[index].userId.toString()),
  //         subtitle: Text("body"),
  //       ),
  //       Divider(
  //         thickness: 5,
  //         color: Colors.blue,
  //         indent: 15,
  //         endIndent: 15,
  //       ),
  //       Text("Comments"),
  //     ],
  //   );
  // }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                userId,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () async {
              await LocaleManager.instance
                  .setStringValue(PreferencesKeys.TOKEN, '');
            },
            icon: Icon(Icons.list))
      ],
    );
  }

  // Future<void> showAllComments(
  //   HomeViewModel viewmodel,
  //   BuildContext context,
  //   int i,
  // ) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: true, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         titlePadding: EdgeInsets.zero,
  //         title: Container(
  //           padding: context.paddingMediumVertical,
  //           width: context.width,
  //           color: Colors.white,
  //           child: Text("All Comments"),
  //         ),
  //         content: SafeArea(
  //           child: SizedBox(
  //             width: context.width,
  //             height: context.height,
  //             child: ListView.separated(
  //                 separatorBuilder: (context, index) {
  //                   return Divider(
  //                     thickness: 4,
  //                   );
  //                 },
  //                 itemCount: viewmodel.filteredCommentList.length,
  //                 itemBuilder: (context, index) {
  //                   return commentList(index, viewmodel);
  //                 }),
  //           ),
  //         ),
  //         actions: <Widget>[],
  //       );
  //     },
  //   );
  // }

  // SizedBox commentList(int index, HomeViewModel viewmodel) {
  //   return SizedBox(
  //       width: 100,
  //       height: 200,
  //       child: ListTile(
  //         tileColor: Colors.blue,
  //         subtitle: Text((index + 1).toString()),
  //         title: Observer(builder: (_) {
  //           return Text(viewmodel.filteredCommentList[index].body.toString());
  //         }),
  //       ));
  // }
}
