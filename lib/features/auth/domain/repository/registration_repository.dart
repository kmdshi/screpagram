import 'package:screpagram/features/auth/domain/entities/person_entity.dart';

abstract class RegistrationRepository {
  Future<void> createPesron(PersonEntity personEntity);
}
