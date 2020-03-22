class Chat {
  final String chatID;
  final List<String> owners;
  final List<String> ownerNames;
  final String requester;
  final String chatIcon;
  final bool accepted;
  final bool done;
  final DateTime timestamp;

  Chat(
      {this.chatID,
      this.owners,
      this.ownerNames,
      this.requester,
      this.chatIcon,
      this.accepted,
      this.done,
      this.timestamp});
}
