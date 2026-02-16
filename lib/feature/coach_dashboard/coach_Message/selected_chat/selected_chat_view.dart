import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_constant.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/selected_chat/selected_chat_controller.dart';
import 'package:intl/intl.dart';

class SelectedChatView extends StatefulWidget {
  const SelectedChatView({super.key});

  @override
  State<SelectedChatView> createState() => _SelectedChatViewState();
}

class _SelectedChatViewState extends State<SelectedChatView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final data =
          context.read<FlowDataProvider>().getFlowData(customerOnboarding);
      if (data != null && data["id"] != null) {
        context.read<SelectedChatController>().setConversationId(data["id"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data =
        context.read<FlowDataProvider>().getFlowData(customerOnboarding);
    final controller = context.watch<SelectedChatController>();

    if (data == null) return const Scaffold();

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        leading: IconButton(
          highlightColor: AppColor.transparent,
          focusColor: AppColor.transparent,
          splashColor: AppColor.transparent,
          icon: SvgPicture.asset(AssetUtils.backArrow),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: cw(18),
              backgroundImage: NetworkImage(data["image"] ??
                  "https://ui-avatars.com/api/?name=${data["name"]}"),
            ),
            SizedBox(width: cw(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: data["name"].toString(),
                  fontSize: AppFontSize.f18,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: controller.otherUserIsTyping ||
                                (data["isOnline"] ?? false)
                            ? Colors.green
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: cw(5)),
                    AppText(
                      txt: controller.otherUserIsTyping
                          ? "Sta scrivendo..."
                          : (data["isOnline"] ?? false ? "Online" : "Offline"),
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: AppFontSize.f13,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            highlightColor: AppColor.transparent,
            focusColor: AppColor.transparent,
            splashColor: AppColor.transparent,
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Encryption info
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(10)),
              padding:
                  EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(15)),
              decoration: BoxDecoration(
                color: AppColor.c171717,
                border: Border.all(color: AppColor.c1E1E1E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AppText(
                txt:
                    "Le tue conversazioni e i tuoi file sono criptati end-to-end. Solo tu e il tuo coach potete leggerli, ascoltarli o condividerli.",
                color: AppColor.c00C8B3,
                textAlign: TextAlign.center,
                fontSize: AppFontSize.f14,
                height: 1.4,
              ),
            ),

            Expanded(
              child: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColor.red))
                  : ListView.builder(
                      controller: controller.scrollController,
                      padding: EdgeInsets.symmetric(horizontal: cw(15)),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final message = controller.messages[index];
                        final isMe =
                            message.senderId == controller.currentUserId;

                        return _buildMessageBubble(message, isMe);
                      },
                    ),
            ),

            // 🔹 Message input area
            Padding(
              padding: EdgeInsets.only(
                  bottom: ch(10), left: cw(5), right: cw(5), top: ch(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: cw(12)),
                      decoration: BoxDecoration(
                        color: AppColor.c1E1E1E,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetUtils.smileIcon),
                          SizedBox(width: cw(8)),
                          Expanded(
                            child: TextField(
                              controller: controller.textController,
                              style: const TextStyle(color: AppColor.white),
                              onChanged: controller.onTypingChanged,
                              onSubmitted: (_) => controller.sendMessage(),
                              decoration: InputDecoration(
                                hintText: "Scrivi qualcosa",
                                hintStyle: TextStyle(
                                    color: AppColor.white.withOpacity(0.3)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(AssetUtils.addIcon),
                            onPressed: () {
                              // Handle file attachment
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: cw(12)),
                  GestureDetector(
                    onLongPress: () => controller.startRecording(),
                    onLongPressEnd: (details) async {
                      final path = await controller.stopRecording();
                      if (path != null) {
                        controller.sendVoiceMessage(path);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(cw(12)),
                      decoration: const BoxDecoration(
                        color: AppColor.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.mic, color: Colors.white),
                    ),
                  ),
                  if (controller.textController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.send, color: AppColor.red),
                      onPressed: () => controller.sendMessage(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(dynamic message, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            margin: EdgeInsets.symmetric(vertical: ch(5)),
            padding: EdgeInsets.symmetric(horizontal: cw(15), vertical: ch(10)),
            decoration: BoxDecoration(
              color: isMe ? AppColor.red : AppColor.c1E1E1E,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: Radius.circular(isMe ? 15 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.type == 'text')
                  AppText(
                    txt: message.text ?? "",
                    color: AppColor.white,
                    fontSize: AppFontSize.f16,
                  ),
                if (message.type == 'voice')
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow, color: AppColor.white),
                      SizedBox(width: 8),
                      // Add a progress bar here
                      Text("Messaggio vocale",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                if (message.type == 'image')
                  Image.network(message.attachment.url),
                SizedBox(height: ch(5)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      txt: DateFormat('HH:mm').format(message.createdAt),
                      fontSize: AppFontSize.f10,
                      color: AppColor.white.withOpacity(0.6),
                    ),
                    if (isMe) ...[
                      const SizedBox(width: 5),
                      Icon(
                        Icons.done_all,
                        size: 14,
                        color: message.isRead
                            ? Colors.blue
                            : Colors.white.withOpacity(0.6),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
