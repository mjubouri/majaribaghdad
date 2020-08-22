import 'dart:io';

import 'package:SewerBaghdad/models/PostModel.dart';
import 'package:SewerBaghdad/models/createReportResponse.dart';
import 'package:SewerBaghdad/models/sendReportBody.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:SewerBaghdad/ui/ui_element/alertUi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toast/toast.dart';

abstract class ReportEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendReport extends ReportEvent {
  SendReportBody body;
  BuildContext context;
  SendReport(this.body, {this.context});

  @override
  List<Object> get props => [body, context];
}

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportUninitialized extends ReportState {}

class SendingReport extends ReportState {}

class SendingReportError extends ReportState {
  final string;
  SendingReportError(this.string);
}

class SendingReportNetworkError extends ReportState {}

class ReportSendSuccussful extends ReportState {
  final CreateReportResponse response;

  ReportSendSuccussful({this.response});

  ReportSendSuccussful copyWith({
    PostModel allPosts,
  }) {
    return ReportSendSuccussful(response: response ?? this.response);
  }

  @override
  List<Object> get props => [response];
}

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final PostsRepository Repo;

  ReportBloc({@required this.Repo}) : super(ReportUninitialized());

  @override
  Stream<ReportState> mapEventToState(ReportEvent event) async* {
    final currentState = state;
    if (event is SendReport) {
      try {
        yield SendingReport();

        final allPosts = await Repo.createFeedbck(event.body);

        yield ReportSendSuccussful(response: allPosts);
        yield ReportUninitialized();
        showAlert(event.context);
        return;
      } on SocketException catch (_) {
        Toast.show("لا يوجد أتصال بالشبكة", event.context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        yield ReportUninitialized();
      } catch (_) {
        print(_.toString());
        Toast.show(_.toString(), event.context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        yield ReportUninitialized();

        //print("error "+_);
      }
    }
  }
}
