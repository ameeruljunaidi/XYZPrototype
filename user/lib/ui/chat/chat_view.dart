import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/ui/chat/chart_viewmodel.dart';
import 'package:xyz_prototype/ui/chat/chat_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'messageInput'),
  ],
)
class ChatView extends StatelessWidget with $ChatView {
  ChatView({Key? key}) : super(key: key);

  final _avatarHeightWidth = 48.0;

  static const _colorDebug = [
    // Colors.red,
    // Colors.blue,
    // Colors.green,
    // Colors.grey,
    null,
    null,
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  _appBarSliver(model),
                  _listingPreview(context, model),
                  _chatDate(context, model),
                  _listOfMessages(context, model),
                  _whiteSpace(),
                ],
              ),
              _messageBox(context, model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChatViewModel(),
    );
  }

  SliverAppBar _appBarSliver(ChatViewModel model) {
    return SliverAppBar(
      // pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
      leading: IconButton(
        onPressed: model.goBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: defaultPaddingValue),
          child: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        )
      ],
      title: Column(
        children: [
          Text(
            'Bill Gates',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          verticalSpaceTiny,
          Text(
            'Active Status',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  SliverToBoxAdapter _listingPreview(
      BuildContext context, ChatViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: _colorDebug[1],
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: defaultPaddingValue),
              decoration: defaultBoxDecoration(
                color: Colors.white,
                shadow: true,
              ),
              height: _avatarHeightWidth,
              width: _avatarHeightWidth,
              child: Placeholder(), // TODO: Change this later
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: defaultPaddingValue),
                padding: EdgeInsets.only(left: defaultPaddingValueSmall),
                color: _colorDebug[2],
                height: _avatarHeightWidth + 16.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BoxText.subheading('Listing Name'),
                    ),
                    verticalSpaceTiny,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Listing Details',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverList _listOfMessages(BuildContext context, ChatViewModel model) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _messageItem(
            context,
            senderName: 'Bill Gates',
            messageTime: 'Time',
            messageContent:
                'I\'m going to be in a new video tongight, make sure you come and watch me, okat?',
          ),
          _messageItem(
            context,
            senderName: 'David Dobrik',
            messageTime: 'Time',
            messageContent: LoremIpsum,
          ),
          _messageItem(
            context,
            senderName: 'Bill Gates',
            messageTime: 'Time',
            messageContent: 'Where were you?',
          ),
          _messageItem(
            context,
            senderName: 'David Dobrik',
            messageTime: 'Time',
            messageContent: LoremIpsum,
          ),
        ],
      ),
    );
  }

  Widget _messageItem(
    BuildContext context, {
    required String senderName,
    required String messageTime,
    required String messageContent,
  }) {
    return Container(
      width: screenWidth(context),
      color: _colorDebug[0],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _userAvatar(),
          _messageContents(
            senderName,
            messageTime,
            messageContent,
          ),
        ],
      ),
    );
  }

  Expanded _messageContents(
      String senderName, String messageTime, String messageContent) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: _avatarHeightWidth + 16.0,
        ),
        child: Container(
          margin: EdgeInsets.only(right: defaultPaddingValue),
          padding: EdgeInsets.only(
            left: defaultPaddingValueSmall,
            top: defaultPaddingValueSmall,
            bottom: defaultPaddingValueSmall,
          ),
          color: _colorDebug[3],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BoxText.subheading(senderName),
                  horizontalSpaceRegular,
                  Text(messageTime),
                ],
              ),
              verticalSpaceTiny,
              Container(
                color: _colorDebug[2],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(messageContent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _userAvatar() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultPaddingValue,
        top: defaultPaddingValueSmall,
      ),
      decoration: defaultBoxDecoration(
        color: Colors.white,
        shadow: true,
      ),
      height: _avatarHeightWidth,
      width: _avatarHeightWidth,
      child: Placeholder(), // TODO: Change this later
    );
  }

  SliverToBoxAdapter _chatDate(BuildContext context, ChatViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        width: screenWidth(context),
        height: 32.0,
        color: _colorDebug[2],
        child: Center(
          child: Text('Date'),
        ),
      ),
    );
  }

  Widget _messageBox(BuildContext context, ChatViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: defaultBoxDecoration(
          color: _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
          shadow: true,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: defaultPaddingValue,
                right: 8.0,
              ),
              child: Icon(
                Icons.image,
                color: Colors.black,
                size: 32.0,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: defaultPaddingValue,
                  top: 8.0,
                  bottom: 8.0,
                ),
                color: _colorDebug[0],
                child: BoxInputField(
                  controller: messageInputController,
                  placeholder: 'Write a message...',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _whiteSpace() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 64.0,
      ),
    );
  }
}
