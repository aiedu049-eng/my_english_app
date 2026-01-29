import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String title;

  // 홈 화면에서 선택한 주제 이름을 받아옵니다.
  ChatScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildChatBubble("AI", "안녕하세요! '$title' 상황입니다. 대화를 시작해볼까요?", false),
                _buildChatBubble("나", "네, 준비됐어요!", true),
                // 여기에 나중에 AI가 만든 15~20문장이 들어갈 거예요.
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Text("여기에 마이크 버튼과 입력창이 들어갈 예정입니다."),
          ),
        ],
      ),
    );
  }

  // 대화 말풍선을 만드는 예쁜 도구
  Widget _buildChatBubble(String sender, String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender, style: TextStyle(fontSize: 12)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}