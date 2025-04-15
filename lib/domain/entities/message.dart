enum FromWho { MINE, HER }

class Message {
  final String text;
  final String? imgUrl;
  final FromWho fromWho;

  Message({required this.text, this.imgUrl, required this.fromWho});
}
