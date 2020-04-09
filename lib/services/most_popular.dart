class MostPopular {
  String title;
  String price;
  String imageURL;

  MostPopular({this.title, this.price, this.imageURL});

  static List<MostPopular> productList = [
    MostPopular(
        title: 'کفش مردانه', price: '11,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115032050.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    MostPopular(
        title: 'کفش مردانه', price: '63,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115329464.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    MostPopular(
        title: 'کفش مردانه', price: '96,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115347354.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    MostPopular(
        title: 'کفش زنانه', price: '84,700', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115597654.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    MostPopular(
        title: 'کفش زنانه', price: '105,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/115598596.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
    MostPopular(
        title: 'کفش دخترانه', price: '655,500', imageURL: 'https://dkstatics-public.digikala.com/digikala-products/116820068.jpg?x-oss-process=image/resize,m_lfit,h_200,w_200/quality,q_90'),
  ];
}
