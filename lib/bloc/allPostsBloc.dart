import 'dart:io';
import 'package:SewerBaghdad/models/PostModel.dart';
import 'package:SewerBaghdad/models/bannerModel.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rxdart/rxdart.dart';

abstract class AllPostsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllPosts extends AllPostsEvent {
  int p;
  bool flage;

  FetchAllPosts({this.p, this.flage});

  @override
  List<Object> get props => [p, flage];
}

abstract class AllPostsState extends Equatable {
  const AllPostsState();

  @override
  List<Object> get props => [];
}

class AllPostsUninitialized extends AllPostsState {}

class AllPostsLoading extends AllPostsState {}

class AllPostsError extends AllPostsState {
  final string;
  AllPostsError(this.string);
}

class AllPostsNetworkError extends AllPostsState {}

class AllPostsLoaded extends AllPostsState {
  final List<PostData> allPosts;

  final bool hasReachedMax;
  AllPostsLoaded({this.allPosts, this.hasReachedMax});

  AllPostsLoaded copyWith({List<Data> allPosts, bool hasReachedMax}) {
    return AllPostsLoaded(
        allPosts: allPosts ?? this.allPosts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [allPosts, hasReachedMax];
}

class AllPostsBloc extends Bloc<AllPostsEvent, AllPostsState> {
  final PostsRepository Repo;

  AllPostsBloc({@required this.Repo}) : super(AllPostsUninitialized());

  @override
  Stream<Transition<AllPostsEvent, AllPostsState>> transformEvents(
    Stream<AllPostsEvent> events,
    TransitionFunction<AllPostsEvent, AllPostsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<AllPostsState> mapEventToState(AllPostsEvent event) async* {
    final currentState = state;

    if (event is FetchAllPosts && !_hasReachedMax(currentState)) {
      print("bloc pressed");
      try {
        if (currentState is AllPostsUninitialized) {
          final posts = await Repo.getPosts(event.p);
          yield AllPostsLoaded(
            allPosts: posts.data,
            hasReachedMax: false,
          );
          return;
        }

        if (currentState is AllPostsLoaded) {
          //  // yield AllPostsUninitialized();
          //  final posts = await Repo.getPosts(event.p);
          //     yield AllPostsLoaded(
          //         allPosts: posts.data.rows,
          //         hasReachedMax: false,
          //         oldP: event.p
          //         );
          //     return;
          print("p  " + event.p.toString());
          final posts = await Repo.getPosts(event.p);
          yield posts.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : AllPostsLoaded(
                  allPosts: currentState.allPosts + posts.data,
                  hasReachedMax: false,
                );
        }
      } on SocketException catch (_) {
        yield AllPostsNetworkError();
      } catch (_) {
        yield AllPostsError(_.toString());
      }
    }
    if (event is FetchAllPosts && event.flage) {
      try {
        print("bloc pressed");
        yield AllPostsUninitialized();
        final posts = await Repo.getPosts(event.p);
        yield AllPostsLoaded(
          allPosts: posts.data,
          hasReachedMax: false,
        );
        return;
      } on SocketException catch (_) {
        yield AllPostsNetworkError();
      } catch (_) {
        yield AllPostsError(_.toString());
      }
    }
  }

  bool _hasReachedMax(AllPostsState state) =>
      state is AllPostsLoaded && state.hasReachedMax;
}
