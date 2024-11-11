import 'package:flashcard/constants/colors.dart';
import 'package:flashcard/view/components/card_frontback.dart';
import 'package:flashcard/view/components/clipper.dart';
import 'package:flashcard/view/components/common_button.dart';
import 'package:flashcard/view/pages/chat_screen.dart';
import 'package:flashcard/view_model/flash_cardvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FlashCardView extends StatelessWidget {
  const FlashCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FlashCardViewModel>(context);
    final controller = FlipCardController();
    final pageController = PageController(initialPage: viewModel.currentIndex);

    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: SemiCircleClipper(),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    purpleLight,
                    purpleDark,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: white),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Text(
                      'Flash Card',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen()));
                  },
                  child: const Text(
                    'Everyday Phrases',
                    style: TextStyle(
                        color: black, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Consumer<FlashCardViewModel>(
                  builder: (context, viewModel, child) {
                    return CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 8.0,
                      percent:
                          (viewModel.currentIndex + 1) / viewModel.cards.length,
                      center: Text(
                        '${viewModel.currentIndex + 1}/${viewModel.cards.length}',
                        style: const TextStyle(
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                      progressColor: indicatorColor,
                      backgroundColor: Colors.grey[200]!,
                      circularStrokeCap: CircularStrokeCap.round,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            height: 400,
            child: PageView.builder(
              itemCount: viewModel.cards.length,
              controller: pageController,
              onPageChanged: (index) {
                viewModel.currentIndex = index;
                viewModel.isFlipped = false;
              },
              itemBuilder: (context, index) {
                return Center(
                  child: FlipCard(
                    rotateSide: RotateSide.bottom,
                    controller: controller,
                    frontWidget: CardFront(
                      text: viewModel.cards[index].word,
                      onTap: controller.flipcard,
                    ),
                    backWidget: CardBack(
                      text: viewModel.cards[index].meaning,
                      onTap: controller.flipcard,
                    ),
                  ),
                );
              },
            ),
          ),

          ///Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommonButton(
                  name: 'Previous',
                  onTap: () {
                    if (viewModel.currentIndex > 0) {
                      viewModel.goToPreviousCard();
                      pageController.animateToPage(
                        viewModel.currentIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  }),
              CommonButton(
                  name: 'Next',
                  onTap: () {
                    if (viewModel.currentIndex < viewModel.cards.length - 1) {
                      viewModel.goToNextCard();
                      pageController.animateToPage(
                        viewModel.currentIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
