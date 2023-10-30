import 'package:auth/commen/service/storage_service.dart';
import 'package:auth/feature/auth/infrastructure/model/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../application/facade.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade authFaced;
  bool isChecked = false;

  AuthBloc(this.authFaced) : super(AuthInitial()) {
    on<LoginAuth>(loginEvent);
    on<RegisterAuth>(registerEvent);
    on<GetUser>(getUserEvent);
    on<DeleteUser>(deleteUserEvent);
    on<ChangeCheckBox>(ChangeIsCheckedEvent);
  }

  void ChangeIsCheckedEvent(ChangeCheckBox event, Emitter emit) {
    isChecked = event.isChecked;
    StorageService.setIsChecked(isChecked);
    emit(CheckBox());
  }

  Future loginEvent(LoginAuth event, Emitter emit) async {
    if (login.valid) {
      emit(LoginLoading());
      final result = await authFaced.login(data: login.rawValue).then((value) {
        emit(LoginSuccess(user: value));
        print(state.toString());
      }).catchError((error) {
        emit(LoginFailure("Failed to log in"));
        print(error.toString());
      });
    } else
      login.markAllAsTouched();
  }

  Future registerEvent(RegisterAuth event, Emitter emit) async {
    if (register.valid) {
      emit(RegisterLoading());
      final result = await authFaced.register(data: {
        'id': 102,
        "username": "${register.control('username').value}",
        "email": '${register.control('email').value}',
        "password": '${register.control('password').value}',
        'gender': Gender.male.name,
        "birthDate": '2000-12-25',
        "eyeColor": EyeColor.Green.name,
        "hair": {"color": Color.Auburn.name, "type": Type.Straight.name},
      }).then((value) {
        StorageService.setId(value.id!);
        emit(RegisterSuccess(user: value));
        print(state.toString());
      }).catchError((error) {
        emit(RegisterFailure("Failed register"));
        print(error.toString());
      });
    } else {
      login.markAllAsTouched();
    }
  }

  Future getUserEvent(GetUser event, Emitter emit) async {
    emit(GetUserLoading());
    await authFaced.GetUser(id: StorageService.getId()!).then((value) {
      emit(GetUserSuccess(user: value));
      print(state.toString());
    }).catchError((error) {
      emit(GetUserFailure(error.toString()));
      print(error.toString());
    });
  }
  Future deleteUserEvent(DeleteUser event, Emitter emit) async {
    emit(DeleteUserLoading());
    await authFaced.deleteUser(id: StorageService.getId()!).then((value) {
      emit(DeleteUserSuccess(user: value));
      print(state.toString());
    }).catchError((error) {
      emit(DeleteUserFailure(error.toString()));
      print(error.toString());
    });
  }

  final register = FormGroup({
    'password': FormControl<String>(
      validators: [Validators.minLength(8), Validators.required],
      value: "12345678",
    ),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
        value: 'ahmed0saber33@gmail.com'),
    'username': FormControl<String>(
        validators: [Validators.required], value: 'ahmed0saber'),
  });

  final login = FormGroup({
    'password': FormControl<String>(
      validators: [Validators.minLength(7), Validators.required],
      value: "9uQFF1Lh",
    ),
    'username':
        FormControl<String>(validators: [Validators.required], value: "atuny0")
  });

}
