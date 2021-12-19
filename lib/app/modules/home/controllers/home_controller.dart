import 'package:get/get.dart';
import 'package:wallet_online/app/config/responses/app_response.dart';
import 'package:wallet_online/app/data/data_sources/data_sources.dart';
import 'package:wallet_online/app/data/models/transactions.dart';

class HomeController extends GetxController {
  final DataSources _dataSources = Get.put(DataSources());
  var transactions = <Transactions>[].obs;
  var state = false.obs;
  var loadState = false.obs;
  var appResponse = AppResponse().obs;

  @override
  void onInit() {
    super.onInit();
    loadData;
  }

  get loadData async {
    state.value = true;
    transactions.value = await _dataSources.getAllTransactions;
    state.value = false;
  }

  loadCount(int state) {
    //return transactions.where((transaction) => transaction.state == state).toList().fold(0, (a, b) => a + b.amount!).toDouble();
  }

  // addTransaction(Transactions transaction) async {
  //   var data = DataHelper.insertTransaction(transaction);
  //   notifyListeners();
  //   return data;
  // }
  //
  // deleteTransaction(int id) async {
  //   var data = DataHelper.deleteTransaction(id);
  //   notifyListeners();
  //   return data;
  // }
}
