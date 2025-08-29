import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel3_app/Features/chats/data/models/message_model.dart';
import 'package:sel3_app/Features/chats/logic/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepo chatRepo;
  StreamSubscription<List<MessageModel>>? _messagesSub;

  void loadMessages(String conversationId) async {
    emit(ChatLoading());
    try {
      // أول حاجة هات الرسائل القديمة
      final initialMessages = await chatRepo.getMessages(conversationId);
      emit(ChatLoaded(initialMessages));

      // لو في subscription قديم يوقف
      await _messagesSub?.cancel();

      // اسمع الرسائل الجديدة realtime
      _messagesSub = chatRepo.listenMessages(conversationId).listen((messages) {
        emit(ChatLoaded(messages));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(
    String conversationId,
    String senderId,
    String content,
  ) async {
    try {
      await chatRepo.sendMessage(conversationId, senderId, content);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _messagesSub?.cancel();
    return super.close();
  }
}
