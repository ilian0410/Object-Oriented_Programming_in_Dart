class Notification {
  void send() => print('Sending generic notification');
}

class EmailNotification extends Notification {
  String email;

  EmailNotification(this.email);

  @override
  void send() => print('Email sent to $email');
}

class SmsNotification extends Notification {
  String phone;

  SmsNotification(this.phone);

  @override
  void send() => print('SMS sent to $phone');
}

void main() {
  // TODO: create EmailNotification stored as Notification
  Notification emailNotif = EmailNotification('alice@mail.com');
  // TODO: create SmsNotification stored as Notification
  Notification smsNotif = SmsNotification('+212600000000');
  // TODO: call send() on both
  emailNotif.send();
  smsNotif.send();
}
