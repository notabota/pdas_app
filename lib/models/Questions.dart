class Question {
  final int id, answer;
  final String question,fileName;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options, required this.fileName});
}

const List sampleData = [
  {
    "id": 0,
    "question": "Trong cuộc trò chuyện, con có thể sử dụng và hiểu các từ vựng xác định hành động, phương hướng, vị trí và trình tự",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "haychonbenphai.mp3",
    "answer_index": 1,
  },
  {
    "id": 1,
    "question": "Trong các cuộc trò chuyện trong lớp, con tích cực lắng nghe, đặt các câu hỏi liên quan để làm rõ thông tin và có thể trả lời các câu hỏi bằng cách sử dụng các cụm từ dài",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "haychonbentrai.mp3",
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Con có thể làm việc nhóm với những bạn khác bằng cách lắng nghe người khác, nói khi được cho phép và có những đóng góp thú vị cho cuộc thảo luận",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "haychonbenphai.mp3",
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Con có thể nhận diện được hết tên chữ cái",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "cow",
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Con có thể đọc liên tục những từ có vần với nhau",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "ball",
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Con có thể dễ dàng kết hợp các âm tiết để tạo thành một từ",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "plate",
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Con có thể nhận ra sự thay đổi trong từ khi một âm tiết được thêm vào",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Con có thể tách các từ gồm 3-5 âm tiết dễ dàng",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "Con có thể đọc chính xác các từ có sự pha trộn phụ âm và chữ ghép",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "Con có thể sử dụng kiến thức về các từ cơ bản để đọc từ ghép",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "47.mp3",
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "Con có thể đọc các từ có tần suất xuất hiện cao từ danh sách dựa trên nghiên cứu",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "36.mp3",
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Con có thể hỏi và trả lời câu hỏi trước, trong và sau khi đọc",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "52.mp3",
    "answer_index": 1,
  },
  {
    "id": 12,
    "question": "Con có thể đánh vần chính xác các từ có sự pha trộn phụ âm và chữ ghép",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "answer_index": 0,
  },
  {
    "id": 13,
    "question": "Con có thể đánh vần chính xác các từ có tần suất xuất hiện cao từ danh sách dựa trên nghiên cứu",
    "options": ['Không đạt yêu cầu', 'Gần đạt yêu cầu', 'Tốt hoặc xuất sắc'],
    "fileName": "concohayvietchubinguoc.mp3",
    "answer_index": 1,
  },

  {
    "id": 14,
    "question": "Con đọc vẫn chưa được trôi chảy (ví dụ: ngập ngừng, thường xuyên đoán từ,…)",
    "options": ["Gần như luôn luôn","Thường xuyên","Ít khi hoặc không bao giờ"],
    "fileName": "concogapkhokhantrongviecghinhotumoidoc.mp3",
    "answer_index": 1,
  },
  {
    "id": 15,
    "question": "Khi được giáo viên yêu cầu đọc một mình hoặc trong một nhóm nhỏ, con hay không tập trung vào việc được giao",
    "options": ["Gần như luôn luôn","Thường xuyên","Ít khi hoặc không bao giờ"],
    "fileName": "concogapkhokhankhihieunghiamottuvungsaukhidocxong.mp3",
    "answer_index": 1,
  },
  // {
  //   "id": 16,
  //   "question": "Phần dành cho người giám sát/phụ huynh",
  //   "options": ['Tôi đã sẵn sàng'],
  //   "fileName": "concogapkhokhankhighinhothoigianbieu.mp3",
  //   "answer_index": 1,
  // },
  {
    "id": 17,
    "question": "Nhận biết ngữ âm",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "concothichdocsachneunoquadai.mp3",
    "answer_index": 0,
  },
  {
    "id": 18,
    "question": "Nhận biết âm vị",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "contiepthuthongtindehonkhiduocnghehonladoc.mp3",
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "Nhận dạng kí hiệu âm thanh",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "lucdocsachthiconkhonthichdoctora.mp3",
    "answer_index": 1,
  },
  {
    "id": 20,
    "question": "Hiểu biết về chữ cái",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "concohayquenneuthongtinquadai.mp3",
    "answer_index": 1,
  },
  {
    "id": 21,
    "question": "Kĩ năng đọc",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "concogapkhokhankhilamtoanmakhongdunggiayhaydem.mp3",
    "answer_index": 1,
  },
  {
    "id": 22,
    "question": "Đánh vần",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "condanhvantukhakem.mp3",
    "answer_index": 1,
  },
  {
    "id": 23,
    "question": "Tốc độ đọc",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "condanhvantukhakem.mp3",
    "answer_index": 1,
  },
  {
    "id": 24,
    "question": "Đọc chuẩn xác",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "condanhvantukhakem.mp3",
    "answer_index": 1,
  },
  {
    "id": 25,
    "question": "Khả năng nghe hiểu",
    "options": ['Không tốt','Khá ổn','Tốt hoặc xuất sắc'],
    "fileName": "condanhvantukhakem.mp3",
    "answer_index": 1,
  },
];
