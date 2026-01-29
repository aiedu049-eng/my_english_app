// 이것이 일종의 '데이터 바구니'입니다.
final Map<String, List<Map<String, String>>> conversationData = {
  '공항에서 기념품 사기': [
    {'sender': 'AI', 'en': 'Hello, are you looking for anything special?', 'ko': '안녕하세요, 특별히 찾으시는 게 있나요?'},
    {'sender': '나', 'en': 'I am looking for some local souvenirs.', 'ko': '현지 기념품을 좀 찾고 있어요.'},
    {'sender': 'AI', 'en': 'We have some beautiful traditional fans here.', 'ko': '여기 아주 예쁜 전통 부채들이 있습니다.'},
    // ... 실제로는 20개까지 채울 수 있습니다.
  ],
  '호텔 체크인하기': [
    {'sender': 'AI', 'en': 'Welcome! Do you have a reservation?', 'ko': '환영합니다! 예약하셨나요?'},
    {'sender': '나', 'en': 'Yes, my name is Gildong Hong.', 'ko': '네, 제 이름은 홍길동입니다.'},
  ],
};