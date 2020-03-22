class Chat {
  final String chatID;
  final List<String> owners;
  final List<String> ownerNames;
  final String requester;
  final String chatIcon;

  Chat(
      {this.chatID,
      this.owners,
      this.ownerNames,
      this.requester,
      this.chatIcon});
}
