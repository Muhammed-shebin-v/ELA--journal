class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}
List<Quote> quotes = [
    Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
    Quote(text: "Don't let yesterday take up too much of today.", author: "Will Rogers"),
    Quote(text: "It's not whether you get knocked down, it's whether you get up.", author: "Vince Lombardi"),
    Quote(text: "The only way to do great work is to love what you do.", author: 'Steve Jobs'),
    Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: 'Confucius'),
    Quote(text: "Success is not final, failure is not fatal: It is the courage to continue that counts.", author: 'Winston Churchill')
  ];

   String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }