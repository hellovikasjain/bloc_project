import '../../../../../Features/Home/Data/dog_modal.dart';
import 'detail_repo_definition.dart';


class AdoptDogUseCase {
  final DetailRepoDefinition repo;

  AdoptDogUseCase(this.repo);

  Future<void> call(DogListModal modal) async {
    await repo.adoptDog(modal);
  }
}
