import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/core/errors/custom_errors.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';
import 'package:flutter_bootcamp/src/login_feature/data/repository/login_repository.dart';
import 'package:flutter_bootcamp/src/login_feature/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late final MockLoginRepository mockLoginRepository;
  late final LoginUsecase loginUsecase;
  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUsecase = LoginUsecase(repository: mockLoginRepository);
  });

  // Test data
  const String email = "raister21@gmail.com";
  const String password = "waduhek";

  // Successful Data
  Either<LoginError, UserModel> successfulResult = Right(UserModel(
    displayName: 'Mandip',
    email: email,
  ));

  Either<LoginError, UserModel> unsuccessfulResult = Left(
    LoginError(
      message: 'Login Error',
    ),
  );

  group('Login testing', () {
    test('Should return UserModel when login is executed', () async {
      // arrange
      when(
        mockLoginRepository.login(
          email: email,
          password: password,
        ),
      ).thenAnswer((realInvocation) async => successfulResult);
      // act
      final result =
          await loginUsecase.execute(email: email, password: password);
      // assert
      await expectLater(result, successfulResult);
      verify(
        mockLoginRepository.login(
          email: email,
          password: password,
        ),
      );
    });

    test('Should return LoginError when login is executed', () async {
      // arrange
      when(
        mockLoginRepository.login(
          email: email,
          password: password,
        ),
      ).thenAnswer((realInvocation) async => unsuccessfulResult);
      // act
      final result =
          await loginUsecase.execute(email: email, password: password);
      // assert
      await expectLater(result, unsuccessfulResult);
      verify(
        mockLoginRepository.login(
          email: email,
          password: password,
        ),
      );
    });
  });
}
