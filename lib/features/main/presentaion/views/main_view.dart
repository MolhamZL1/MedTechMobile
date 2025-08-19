import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/repos/ai_chat_repo.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/cubit/nav_bar_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/CustomNavigationBar.dart';

import '../../../ai chat/domain/entities/message_entity.dart';
import '../../../ai chat/presentation/cubits/get ai messages cubit/get_ai_messages_cubit.dart';
import '../../../ai chat/presentation/cubits/send ai message/send_ai_message_cubit.dart';
import 'widgets/MainViewBody.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NavBarCubit())],
      child: Scaffold(
        bottomNavigationBar: const CustomNavigationBar(),
        body: const SafeArea(child: MainViewBody()),
        floatingActionButton: AiFab(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create:
                              (_) =>
                                  SendAiMessageCubit(getIt.get<AiChatRepo>()),
                        ),
                        BlocProvider(
                          create:
                              (_) =>
                                  GetAiMessagesCubit(getIt.get<AiChatRepo>()),
                        ),
                      ],
                      child: const AiAssistantPage(heroTag: 'ai-fab'),
                    ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

/// ========== زر AI FAB (مع Hero) ==========
class AiFab extends StatefulWidget {
  const AiFab({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  State<AiFab> createState() => _AiFabState();
}

class _AiFabState extends State<AiFab> with TickerProviderStateMixin {
  late final AnimationController _pulseC = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);
  late final Animation<double> _pulse = CurvedAnimation(
    parent: _pulseC,
    curve: Curves.easeInOut,
  );

  late final AnimationController _nudgeC = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _pulseC.dispose();
    _nudgeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final primary = scheme.primary;

    return Hero(
      tag: 'ai-fab',
      child: AnimatedBuilder(
        animation: Listenable.merge([_pulse, _nudgeC]),
        builder: (context, _) {
          // نافذة الحركة الدورية
          final cycle = _nudgeC.value; // 0..1
          final isActive = cycle < 0.20;
          final localT = isActive ? (cycle / 0.20) : 0.0;

          double dx = 0.0;
          double rot = 0.0;
          if (isActive) {
            final envelope = Curves.easeInOut.transform(
              (localT <= 0.5) ? (localT * 2) : (1 - (localT - 0.5) * 2),
            );
            final wobble = math.sin(localT * 6.28 * 3);
            dx = wobble * 4.0 * envelope;
            rot = wobble * 0.04 * envelope;
          }

          final scale = 0.98 + (_pulse.value * 0.02);
          final glow = 10 + (_pulse.value * 8);

          return Transform.translate(
            offset: Offset(dx, 0),
            child: Transform.rotate(
              angle: rot,
              child: Transform.scale(
                scale: scale,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primary,
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.35),
                        blurRadius: glow,
                        spreadRadius: _pulse.value * 1.5,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        widget.onPressed?.call();
                      },
                      child: SizedBox(
                        height: 64,
                        width: 64,
                        child: Center(
                          child: Icon(
                            Icons.smart_toy_outlined,
                            color: scheme.onPrimary,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ========== واجهة AI Assistant (واتساب ستايل) ==========
class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key, this.heroTag});
  final String? heroTag;

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  final ScrollController _scroll = ScrollController();
  final List<MessageEntity> _messages = [];
  bool _typing = false; // مؤشر "الذكاء عم يكتب"

  @override
  void initState() {
    super.initState();
    // اطلب الرسائل بعد أول فريم لضمان تسجيل الـ listeners
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAiMessagesCubit>().getMessages();
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  // مع reverse:true، الصفر يعني أسفل اللستة (آخر الرسائل)
  void _scrollToBottom({bool animated = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      if (animated) {
        _scroll.animateTo(
          0.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      } else {
        _scroll.jumpTo(0.0);
      }
    });
  }

  void _onSendPressed(String text) {
    // 1) ضيف رسالة المستخدم فوراً
    _messages.add(MessageEntity(id: '', message: text, isUser: true));
    setState(() {});
    _scrollToBottom();

    // 2) فعّل مؤشر الكتابة وابعث الطلب عبر الكيوبِت
    setState(() => _typing = true);
    context.read<SendAiMessageCubit>().sendMessage(content: text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            // رسائل البداية من السيرفر
            BlocListener<GetAiMessagesCubit, GetAiMessagesState>(
              listener: (context, state) {
                if (state is GetAiMessagesSuccess) {
                  _messages
                    ..clear()
                    ..addAll(state.messages);
                  setState(() {});
                  _scrollToBottom(animated: false);
                }
              },
            ),
            // إرسال الرسالة واستقبال الرد
            BlocListener<SendAiMessageCubit, SendAiMessageState>(
              listener: (context, state) {
                if (state is SendAiMessageLoading) {
                  setState(() => _typing = true);
                } else if (state is SendAiMessageSuccess) {
                  _messages.add(
                    state.messageEntity,
                  ); // ردّ الـ AI (isUser=false)
                  setState(() => _typing = false);
                  _scrollToBottom();
                } else if (state is SendAiMessageError) {
                  setState(() => _typing = false);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
              },
            ),
          ],
          child: Column(
            children: [
              AiHeader(
                heroTag: widget.heroTag, // لربط الـ Hero إذا موجود
                title: "AI Assistant",
                subtitle: "كيف فيني ساعدك اليوم؟",
                onBack: () => Navigator.of(context).maybePop(),
              ),
              Divider(
                height: 1,
                color: theme.dividerTheme.color,
                thickness: theme.dividerTheme.thickness ?? .1,
              ),

              // اللائحة: reverse:true تبقيك أسفل الرسائل
              Expanded(
                child: _MessagesViewport(
                  controller: _scroll,
                  messages: _messages,
                  typing: _typing,
                ),
              ),

              // المُرسِل
              BlocBuilder<SendAiMessageCubit, SendAiMessageState>(
                builder: (context, state) {
                  final loading = state is SendAiMessageLoading;
                  return AiComposer(loading: loading, onSend: _onSendPressed);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Viewport للرسائل مع reverse:true + typing bubble
class _MessagesViewport extends StatelessWidget {
  const _MessagesViewport({
    required this.controller,
    required this.messages,
    required this.typing,
  });

  final ScrollController controller;
  final List<MessageEntity> messages;
  final bool typing;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty && !typing) {
      return Center(
        child: Text(
          'ابدأ المحادثة الآن…',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    final total = messages.length + (typing ? 1 : 0);

    return ListView.builder(
      controller: controller,
      reverse: true, // 👈 سر الواتساب
      padding: const EdgeInsets.all(12),
      itemCount: total,
      itemBuilder: (_, i) {
        // مع reverse:true، i=0 هو أسفل القائمة
        if (typing && i == 0) {
          return const _TypingBubble();
        }
        final offset = typing ? i - 1 : i;
        final msgIndex = messages.length - 1 - offset;
        final m = messages[msgIndex];
        return AiMessageBubble(text: m.message, isUser: m.isUser);
      },
    );
  }
}

/// ========== الهيدر (مع Hero في الوجهة) ==========
class AiHeader extends StatelessWidget {
  const AiHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBack,
    this.heroTag,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onBack;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = CircleAvatar(
      radius: 21,
      backgroundColor: theme.colorScheme.primary,
      child: Icon(Icons.smart_toy_outlined, color: theme.colorScheme.onPrimary),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 4),
          // لو heroTag موجود، لفّ الـ avatar بـ Hero بنفس التاغ
          heroTag != null ? Hero(tag: heroTag!, child: avatar) : avatar,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(subtitle, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ========== لستة الرسائل (Bubble) ==========
class AiMessageBubble extends StatelessWidget {
  const AiMessageBubble({super.key, required this.text, required this.isUser});
  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final userBg = scheme.primary.withOpacity(isDark ? 0.25 : 0.15);
    final aiBg = theme.cardColor.withOpacity(isDark ? 0.35 : 0.9);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 360),
        decoration: BoxDecoration(
          color: isUser ? userBg : aiBg,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isUser ? 12 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 12),
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(height: 1.35),
        ),
      ),
    );
  }
}

/// ========== فقاعة "يكتب…" ==========
class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = theme.cardColor.withOpacity(
      theme.brightness == Brightness.dark ? 0.35 : 0.9,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 200),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Dot(),
            SizedBox(width: 4),
            _Dot(),
            SizedBox(width: 4),
            _Dot(),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatefulWidget {
  const _Dot();
  @override
  State<_Dot> createState() => _DotState();
}

class _DotState extends State<_Dot> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();
  late final Animation<double> _a = CurvedAnimation(
    parent: _c,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _a,
      builder: (_, __) {
        final v = 0.4 + (_a.value * 0.6); // 0.4..1.0
        return Opacity(
          opacity: v,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

/// ========== كومبوزر ==========
class AiComposer extends StatefulWidget {
  const AiComposer({super.key, this.onSend, this.loading = false});
  final ValueChanged<String>? onSend;
  final bool loading;

  @override
  State<AiComposer> createState() => _AiComposerState();
}

class _AiComposerState extends State<AiComposer> {
  final _textCtrl = TextEditingController();

  void _handleSend() {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;
    widget.onSend?.call(text);
    _textCtrl.clear();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textCtrl,
                style: theme.textTheme.bodyMedium,
                onSubmitted: (_) => _handleSend(),
                decoration: const InputDecoration(hintText: "اكتب سؤالك…"),
              ),
            ),
            const SizedBox(width: 8),
            widget.loading
                ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
                : ElevatedButton.icon(
                  onPressed: _handleSend,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text("إرسال"),
                ),
          ],
        ),
      ),
    );
  }
}
