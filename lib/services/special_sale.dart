class SpecialSale {
  String title;
  String price;
  String imageURL;

  SpecialSale({this.title, this.price, this.imageURL});

  static List<SpecialSale> productList = [
    SpecialSale(
        title: 'کفش زنانه', price: '85,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115595011.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    SpecialSale(
        title: 'کفش زنانه', price: '32,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115597895.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    SpecialSale(
        title: 'کفش پسرانه', price: '140,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/117586361.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    SpecialSale(
        title: 'کفش پسرانه', price: '65,700', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/116741353.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    SpecialSale(
        title: 'کفش دخترانه', price: '96,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/117621581.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
    SpecialSale(
        title: 'کفش دخترانه', price: '33,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115328701.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90'),
  ];
}
