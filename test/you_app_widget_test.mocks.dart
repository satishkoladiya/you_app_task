// Mocks generated by Mockito 5.4.2 from annotations
// in you_app_test/test/you_app_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bloc/bloc.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:you_app_task/Presentation/bloc/auth/auth_cubit.dart' as _i10;
import 'package:you_app_task/Presentation/bloc/auth/auth_state.dart' as _i6;
import 'package:you_app_task/Presentation/bloc/profile/profile_bloc.dart'
    as _i7;
import 'package:you_app_task/core/api/auth/model/user.dart' as _i11;
import 'package:you_app_task/core/repository/i_auth_repository.dart' as _i5;
import 'package:you_app_task/core/repository/i_profile_repository.dart' as _i2;
import 'package:you_app_task/presentation//bloc/profile/profile_event.dart'
    as _i8;
import 'package:you_app_task/presentation//bloc/profile/profile_state.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIProfileRepository_0 extends _i1.SmartFake
    implements _i2.IProfileRepository {
  _FakeIProfileRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileState_1 extends _i1.SmartFake implements _i3.ProfileState {
  _FakeProfileState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamSubscription_2<T> extends _i1.SmartFake
    implements _i4.StreamSubscription<T> {
  _FakeStreamSubscription_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIAuthRepository_3 extends _i1.SmartFake
    implements _i5.IAuthRepository {
  _FakeIAuthRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_4 extends _i1.SmartFake implements _i6.AuthState {
  _FakeAuthState_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProfileBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileBloc extends _i1.Mock implements _i7.ProfileBloc {
  MockProfileBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IProfileRepository get profileRepo => (super.noSuchMethod(
        Invocation.getter(#profileRepo),
        returnValue: _FakeIProfileRepository_0(
          this,
          Invocation.getter(#profileRepo),
        ),
      ) as _i2.IProfileRepository);

  @override
  _i3.ProfileState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeProfileState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.ProfileState);

  @override
  _i4.Stream<_i3.ProfileState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i3.ProfileState>.empty(),
      ) as _i4.Stream<_i3.ProfileState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i4.Stream<_i3.ProfileState> mapEventToState(_i8.ProfileEvent? event) =>
      (super.noSuchMethod(
        Invocation.method(
          #mapEventToState,
          [event],
        ),
        returnValue: _i4.Stream<_i3.ProfileState>.empty(),
      ) as _i4.Stream<_i3.ProfileState>);

  @override
  void add(_i8.ProfileEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i8.ProfileEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>
      transformEvents(
    _i4.Stream<_i8.ProfileEvent>? events,
    _i9.TransitionFunction<_i8.ProfileEvent, _i3.ProfileState>? transitionFn,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #transformEvents,
              [
                events,
                transitionFn,
              ],
            ),
            returnValue: _i4.Stream<
                _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>.empty(),
          ) as _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>);

  @override
  void emit(_i3.ProfileState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i8.ProfileEvent>(
    _i9.EventHandler<E, _i3.ProfileState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>
      transformTransitions(
              _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>?
                  transitions) =>
          (super.noSuchMethod(
            Invocation.method(
              #transformTransitions,
              [transitions],
            ),
            returnValue: _i4.Stream<
                _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>.empty(),
          ) as _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>);

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.StreamSubscription<_i3.ProfileState> listen(
    void Function(_i3.ProfileState)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_2<_i3.ProfileState>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i4.StreamSubscription<_i3.ProfileState>);

  @override
  void onChange(_i9.Change<_i3.ProfileState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ProfileBloc].
///
/// See the documentation for Mockito's code generation for more information.
class profileBloc extends _i1.Mock implements _i7.ProfileBloc {
  profileBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IProfileRepository get profileRepo => (super.noSuchMethod(
        Invocation.getter(#profileRepo),
        returnValue: _FakeIProfileRepository_0(
          this,
          Invocation.getter(#profileRepo),
        ),
      ) as _i2.IProfileRepository);

  @override
  _i3.ProfileState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeProfileState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.ProfileState);

  @override
  _i4.Stream<_i3.ProfileState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i3.ProfileState>.empty(),
      ) as _i4.Stream<_i3.ProfileState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i4.Stream<_i3.ProfileState> mapEventToState(_i8.ProfileEvent? event) =>
      (super.noSuchMethod(
        Invocation.method(
          #mapEventToState,
          [event],
        ),
        returnValue: _i4.Stream<_i3.ProfileState>.empty(),
      ) as _i4.Stream<_i3.ProfileState>);

  @override
  void add(_i8.ProfileEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i8.ProfileEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>
      transformEvents(
    _i4.Stream<_i8.ProfileEvent>? events,
    _i9.TransitionFunction<_i8.ProfileEvent, _i3.ProfileState>? transitionFn,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #transformEvents,
              [
                events,
                transitionFn,
              ],
            ),
            returnValue: _i4.Stream<
                _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>.empty(),
          ) as _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>);

  @override
  void emit(_i3.ProfileState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i8.ProfileEvent>(
    _i9.EventHandler<E, _i3.ProfileState>? handler, {
    _i9.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>
      transformTransitions(
              _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>?
                  transitions) =>
          (super.noSuchMethod(
            Invocation.method(
              #transformTransitions,
              [transitions],
            ),
            returnValue: _i4.Stream<
                _i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>.empty(),
          ) as _i4.Stream<_i9.Transition<_i8.ProfileEvent, _i3.ProfileState>>);

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.StreamSubscription<_i3.ProfileState> listen(
    void Function(_i3.ProfileState)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_2<_i3.ProfileState>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i4.StreamSubscription<_i3.ProfileState>);

  @override
  void onChange(_i9.Change<_i3.ProfileState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthCubit extends _i1.Mock implements _i10.AuthCubit {
  MockAuthCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.IAuthRepository get authRepo => (super.noSuchMethod(
        Invocation.getter(#authRepo),
        returnValue: _FakeIAuthRepository_3(
          this,
          Invocation.getter(#authRepo),
        ),
      ) as _i5.IAuthRepository);

  @override
  set authRepo(_i5.IAuthRepository? _authRepo) => super.noSuchMethod(
        Invocation.setter(
          #authRepo,
          _authRepo,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_4(
          this,
          Invocation.getter(#state),
        ),
      ) as _i6.AuthState);

  @override
  _i4.Stream<_i6.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i6.AuthState>.empty(),
      ) as _i4.Stream<_i6.AuthState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void login(_i11.User? user) => super.noSuchMethod(
        Invocation.method(
          #login,
          [user],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void register(_i11.User? user) => super.noSuchMethod(
        Invocation.method(
          #register,
          [user],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.StreamSubscription<_i6.AuthState> listen(
    void Function(_i6.AuthState)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_2<_i6.AuthState>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i4.StreamSubscription<_i6.AuthState>);

  @override
  void emit(_i6.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i9.Change<_i6.AuthState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [AuthCubit].
///
/// See the documentation for Mockito's code generation for more information.
class cubit extends _i1.Mock implements _i10.AuthCubit {
  cubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.IAuthRepository get authRepo => (super.noSuchMethod(
        Invocation.getter(#authRepo),
        returnValue: _FakeIAuthRepository_3(
          this,
          Invocation.getter(#authRepo),
        ),
      ) as _i5.IAuthRepository);

  @override
  set authRepo(_i5.IAuthRepository? _authRepo) => super.noSuchMethod(
        Invocation.setter(
          #authRepo,
          _authRepo,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_4(
          this,
          Invocation.getter(#state),
        ),
      ) as _i6.AuthState);

  @override
  _i4.Stream<_i6.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i6.AuthState>.empty(),
      ) as _i4.Stream<_i6.AuthState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void login(_i11.User? user) => super.noSuchMethod(
        Invocation.method(
          #login,
          [user],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void register(_i11.User? user) => super.noSuchMethod(
        Invocation.method(
          #register,
          [user],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.StreamSubscription<_i6.AuthState> listen(
    void Function(_i6.AuthState)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_2<_i6.AuthState>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i4.StreamSubscription<_i6.AuthState>);

  @override
  void emit(_i6.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i9.Change<_i6.AuthState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}