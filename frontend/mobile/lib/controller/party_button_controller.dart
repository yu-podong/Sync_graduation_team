import 'package:get/get.dart';
import 'package:mobile/components/personInfoWidget.dart';

//getx update 및 obx함수로 관찰하여 버튼클릭시 위젯이 생성되어야됨
class PartyButtonController extends GetxController{
  RxInt index = 0.obs; //관찰값
  List<PersonInfoWidget> partyList = [];

  void addParty(){
    partyList.add(new PersonInfoWidget());
  }

}