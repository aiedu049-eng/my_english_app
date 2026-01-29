import 'package:flutter/material.dart';
import 'data.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  ChatScreen({required this.title});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // 0: 모두 보기, 1: 한글만, 2: 숨기기
  int scriptMode = 0;

  @override
  Widget build(BuildContext context) {
    final dialogs = conversationData[widget.title] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // 스크립트 모드 변경 버튼
          TextButton(
            onPressed: () {
              setState(() {
                scriptMode = (scriptMode + 1) % 3;
              });
            },
            child: Text(
              ['모두보기', '한글만', '숨기기'][scriptMode],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: dialogs.length,
              itemBuilder: (context, index) {
                final chat = dialogs[index];
                return _buildChatBubble(chat, chat['sender'] == '나');
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(Map<String, String> chat, bool isMe) {
    // 모드에 따라 텍스트 결정
    String displayText = "";
    if (scriptMode == 0)
      displayText = "${chat['en']}\n${chat['ko']}";
    else if (scriptMode == 1)
      displayText = chat['ko']!;
    else
      displayText = "??? (탭하여 확인)";

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(displayText),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.mic, color: Colors.red, size: 30),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "말하거나 입력하세요..."),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      ),
    );
  }
}
