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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  if (value.categorizedProductList.keys.isNotEmpty) ...{
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  value.categorizedProductList.keys.length,
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
                            onPressed: () => filterDialog(ctx),
                            icon: const Icon(Icons.filter_alt_rounded),
                          ),
                        ],
                      ),
                    ),
                  } else ...{
                    const Center(
                      child: Text('No categories found!!'),
                    ),
                  },
                  if (value.productList.isNotEmpty) ...{
                    Expanded(
                      child: Container(
                        color: AppColors.bgColor,
                        child: GridView.builder(
                          itemCount: value.productList.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: ctx.width > 950 ? 4 : 3,
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
                  } else ...{
                    const Expanded(
                      child: Center(
                        child: Text('No products found!!'),
                      ),
                    ),
                  },
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

  void filterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return ChangeNotifierProvider<HomeProvider>.value(
          value: Provider.of<HomeProvider>(context, listen: false),
          child: Dialog(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    40.widthSizedBox,
                    const Text(
                      'Product Filter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer<HomeProvider>(builder: (ctx, value, child) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      itemCount: value.productTagList.keys.length,
                      itemBuilder: (_, index) {
                        String tag = value.productTagList.keys.toList()[index];
                        return SizedBox(
                          height: 25,
                          child: _checkBoxTile(
                            title: tag.toFirstCapital,
                            value: value.selectedProductTagList.contains(tag),
                            onChanged: (val) {},
                            onTap: () {
                              context
                                  .read<HomeProvider>()
                                  .updateTagSelection(tag: tag);
                            },
                          ),
                        );
                      },
                    );
                    // return Wrap(
                    //   direction: Axis.horizontal,
                    //   spacing: 10,
                    //   runSpacing: 10,
                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                    //   runAlignment: WrapAlignment.spaceEvenly,
                    //   children: value.productTagList.keys
                    //       .map(
                    //         (e) => SizedBox(
                    //           height: 25,
                    //           child: _checkBoxTile(
                    //             title: e.toFirstCapital,
                    //             value: value.selectedProductTagList
                    //                 .contains(e),
                    //             onChanged: (val) {},
                    //             onTap: () {
                    //               context
                    //                   .read<HomeProvider>()
                    //                   .updateTagSelection(tag: e);
                    //             },
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    // );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<HomeProvider>().applyTagFilter();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: AppColors.redColor.withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    20.widthSizedBox,
                    GestureDetector(
                      onTap: () {
                        context.read<HomeProvider>().clearTagSelection();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: AppColors.redColor.withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Clear',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.heightSizedBox,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _checkBoxTile({
    required String title,
    required bool value,
    Function(bool?)? onChanged,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AbsorbPointer(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.redColor,
              ),
            ),
          ),
          5.widthSizedBox,
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
