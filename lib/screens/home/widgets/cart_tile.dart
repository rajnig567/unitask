import 'package:unitask/core.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.product, required this.totalCount});

  final ProductModelProducts product;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.1)),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 50,
            width: 50,
            imageUrl: product.thumbnail ?? '',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          8.widthSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₹${(product.price ?? 0) * totalCount}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          8.widthSizedBox,
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (totalCount > 1) {
                        context
                            .read<HomeProvider>()
                            .removeSingleProductFromCart(product: product);
                      } else {
                        removeProduct(context);
                      }
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '$totalCount',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (totalCount < 10) {
                        context
                            .read<HomeProvider>()
                            .addToCart(product: product);
                      }
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => removeProduct(context),
                child: Text(
                  'Remove',
                  style: TextStyle(color: AppColors.redColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void removeProduct(BuildContext context){
    context.showAlertDialog(
      title: 'Alert!!',
      message: 'Are you sure you want to remove this product?',
      btn1Text: 'Remove',
      btn1Tap: () {
        context
            .read<HomeProvider>()
            .removeProductFromCart(product: product);
      },
    );
  }
}
