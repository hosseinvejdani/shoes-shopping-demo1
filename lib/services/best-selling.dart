class BestSelling {
  String title;
  String price;
  String imageURL;

  BestSelling({this.title, this.price, this.imageURL});

  static List<BestSelling> productList = [
    BestSelling(
        title: 'کفش مردانه', price: '12,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115236725.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    BestSelling(
        title: 'کفش مردانه', price: '25,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115164723.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    BestSelling(
        title: 'کفش مردانه', price: '14,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115362857.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    BestSelling(
        title: 'کفش مردانه', price: '12,700', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115290178.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    BestSelling(
        title: 'کفش مردانه', price: '19,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/119731290.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    BestSelling(
        title: 'کفش مردانه', price: '102,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115328701.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
  ];
}
