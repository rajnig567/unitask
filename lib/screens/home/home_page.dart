import 'package:unitask/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        right: false,
        child: Row(
          children: [
            _productView(),
            Container(
              width: 1,
              color: Colors.grey,
            ),
            _cartView(),
          ],
        ),
      ),
    );
  }

  Widget _productView() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: Consumer<HomeProvider>(builder: (ctx, value, child) {
              if (value.uiState == UIState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (value.uiState == UIState.error) {
                return Center(
                  child: Text(value.message.toString()),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.categorizedProductList.keys.length,
                            padding: const EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              String category = value
                                  .categorizedProductList.keys
                                  .toList()[index];
                              bool isSelected =
                                  value.selectedCategory == category;
                              return CategoryChip(
                                category: category,
                                isSelected: isSelected,
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_alt_rounded),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: AppColors.bgColor,
                      child: GridView.builder(
                        itemCount: value.productList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (_, index) {
                          ProductModelProducts product =
                              value.productList[index];
                          return ProductTile(product: product);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _cartView() {
    return Expanded(
      child: Consumer<HomeProvider>(builder: (ctx, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              height: 50,
              child: Text(
                'Cart Items (${value.cartList.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                color: AppColors.bgColor,
                child: value.cartList.isEmpty
                    ? const Center(
                        child: Text('Your cart is empty!'),
                      )
                    : ListView.builder(
                        itemCount: value.cartList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          ProductModelProducts product = value
                              .cartList[value.cartList.keys.toList()[index]]!
                              .first;
                          return CartTile(
                            product: product,
                            totalCount: value
                                    .cartList[
                                        value.cartList.keys.toList()[index]]
                                    ?.length ??
                                0,
                          );
                        },
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₹${value.cartTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
