class Finance {
  final String financerName;
  final String financerUrl;
  final int totalPaymentCycle;
  final int paidCycle;
  final int nextPaymentDateEpoch;

  Finance(this.financerName, this.totalPaymentCycle, this.paidCycle,
      this.financerUrl, this.nextPaymentDateEpoch);
}

Finance dummyFinance = Finance('Knoma', 18, 17,
    'https://cdn.knoma.io/assets/website/navigation-logo_blue.png', 1610692133000);
