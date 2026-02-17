import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/data/models/chat_models.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/athelet_chat/athelet_chat_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AtheletChatView extends StatefulWidget {
  const AtheletChatView({super.key});

  @override
  State<AtheletChatView> createState() => _AtheletChatViewState();
}

class _AtheletChatViewState extends State<AtheletChatView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // model.delegate = S.of(context);

    final model = context.watch<AtheletChatController>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  //txt: model.delegate.chats,
                  txt: "Chats",
                  fontSize: AppFontSize.f24,
                  isItalic: true,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AssetUtils.addIcon,
                    height: ch(30),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: cw(20)),
            child: primaryTextField(
                hintText: "Ricerca",
                prefixIcon: SvgPicture.asset(AssetUtils.searchIcon),
                controller: _searchController,
                onChanged: model.filterConversations,
                border: InputBorder.none,
                borderRadius: cw(50)),
          ),
          Expanded(
            child: model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: cw(10)),
                    itemCount: model.chats.length,
                    itemBuilder: (context, index) {
                      final chat = model.chats[index];
                      return InkWell(
                        onTap: () {
                          final selectedConv =
                              chat["conversation"] as Conversation;
                          context.read<FlowDataProvider>().addOrUpdateFlow(
                              flowTag: customerOnboarding,
                              data: {
                                "id": selectedConv.id,
                                "name": chat["name"],
                                "image": chat["image"],
                                "isOnline": chat["isOnline"]
                              });

                          Navigator.pushNamed(
                              context, RoutePaths.selectedChatScreen);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: ch(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// Avatar
                              CircleAvatar(
                                radius: cw(25),
                                backgroundImage:
                                    NetworkImage(chat["image"].toString()),
                              ),
                              SizedBox(width: cw(12)),

                              /// Chat Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: chat["name"].toString(),
                                      fontSize: AppFontSize.f18 + 1,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.white,
                                    ),
                                    SizedBox(height: ch(3)),
                                    AppText(
                                      txt: chat["message"].toString(),
                                      color: AppColor.white.withOpacity(0.7),
                                      fontSize: AppFontSize.f15,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),

                              /// Time + Unread badge
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText(
                                    txt: chat["time"].toString(),
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.white.withOpacity(0.6),
                                    fontSize: AppFontSize.f15 + 1,
                                  ),
                                  SizedBox(height: ch(8)),
                                  if (chat["unread"]! as int > 0)
                                    Container(
                                      padding: EdgeInsets.all(cw(6)),
                                      decoration: const BoxDecoration(
                                        color: AppColor.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: AppText(
                                        txt: chat["unread"].toString(),
                                        fontSize: AppFontSize.f14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      )),
    );
  }
}
