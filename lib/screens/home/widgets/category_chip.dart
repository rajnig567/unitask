import 'package:unitask/core.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
  });

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeProvider>().displayProductsByCategory(category: category);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.redColor : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.redColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 1,
              color: AppColors.redColor.withOpacity(0.4),
            ),
          ],
        ),
        child: Text(
          category.toFirstCapital,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
