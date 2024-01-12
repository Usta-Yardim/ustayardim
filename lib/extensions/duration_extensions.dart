extension DurationExtension on Duration {
  String toStringHours() {
    return "$inHours:${inMinutes % 60 < 10 ? "0${inMinutes % 60}" : inMinutes % 60}";
  }


  String toStringMinutes(){
    return "${inMinutes < 10 ? "0$inMinutes":inMinutes}:${inSeconds % 60 < 10 ? "0${inSeconds % 60}" : inSeconds % 60}";
  }
}