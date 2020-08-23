import 'dart:io';

import 'package:SewerBaghdad/models/ProjectModel.dart';
import 'package:SewerBaghdad/repository/posts_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class ProjectsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllProjects extends ProjectsEvent {
  final int p;
  final bool flage;

  FetchAllProjects({this.p, this.flage});

  @override
  List<Object> get props => [p, flage];
}

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class ProjectsUninitialized extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsError extends ProjectsState {
  final string;

  ProjectsError(this.string);
}

class ProjectsNetworkError extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<ProjectData> allPosts;

  final bool hasReachedMax;

  ProjectsLoaded({this.allPosts, this.hasReachedMax});

  ProjectsLoaded copyWith({List<ProjectModel> allPosts, bool hasReachedMax}) {
    return ProjectsLoaded(
        allPosts: allPosts ?? this.allPosts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [allPosts, hasReachedMax];
}

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final PostsRepository repo;

  ProjectsBloc({@required this.repo}) : super(ProjectsUninitialized());

  @override
  Stream<Transition<ProjectsEvent, ProjectsState>> transformEvents(
    Stream<ProjectsEvent> events,
    TransitionFunction<ProjectsEvent, ProjectsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ProjectsState> mapEventToState(ProjectsEvent event) async* {
    final currentState = state;

    if (event is FetchAllProjects && !_hasReachedMax(currentState)) {
      print("bloc pressed");
      try {
        if (currentState is ProjectsUninitialized) {
          final posts = await repo.getAllProjects(event.p);
          yield ProjectsLoaded(
            allPosts: posts.data,
            hasReachedMax: false,
          );
          return;
        }

        if (currentState is ProjectsLoaded) {
          print("p  " + event.p.toString());
          final posts = await repo.getAllProjects(event.p);
          yield posts.data.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : ProjectsLoaded(
                  allPosts: currentState.allPosts + posts.data,
                  hasReachedMax: false,
                );
        }
      } on SocketException catch (_) {
        yield ProjectsNetworkError();
      } catch (_) {
        yield ProjectsError(_.toString());
      }
    }
    if (event is FetchAllProjects && event.flage) {
      try {
        print("bloc pressed");
        yield ProjectsUninitialized();
        final posts = await repo.getAllProjects(event.p);
        yield ProjectsLoaded(
          allPosts: posts.data,
          hasReachedMax: false,
        );
        return;
      } on SocketException catch (_) {
        yield ProjectsNetworkError();
      } catch (_) {
        yield ProjectsError(_.toString());
      }
    }
  }

  bool _hasReachedMax(ProjectsState state) =>
      state is ProjectsLoaded && state.hasReachedMax;
}
