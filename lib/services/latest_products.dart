class LatestProducts {
  String title;
  String price;
  String imageURL;

  LatestProducts({this.title, this.price, this.imageURL});

  static List<LatestProducts> productList = [
    LatestProducts(
        title: 'کفش مردانه', price: '45,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115231994.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    LatestProducts(
        title: 'کفش مردانه', price: '95,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115306826.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    LatestProducts(
        title: 'کفش زنانه', price: '140,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115510373.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    LatestProducts(
        title: 'کفش زنانه', price: '235,700', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115600003.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    LatestProducts(
        title: 'کفش پسرانه', price: '75,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/119131242.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    LatestProducts(
        title: 'کفش دخترانه', price: '88,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/116820827.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
  ];
}
