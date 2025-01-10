
class FriendRequest {
  final String fromUserId;
  final String toUserId;
  final String status; // pending, accepted, declined

  FriendRequest({
    required this.fromUserId,
    required this.toUserId,
    this.status = 'pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'status': status,
    };
  }
}