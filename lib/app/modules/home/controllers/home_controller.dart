import 'package:get/get.dart';
import 'package:wallet_online/app/data/data_sources/data_sources.dart';
import 'package:wallet_online/app/data/models/transactions.dart';

class HomeController extends GetxController {
  final DataSources _dataSources = Get.put(DataSources());
  var transactions = <Transactions>[].obs;
  var state = false.obs;

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

  addTransaction(Transactions transaction) async {
    var data = _dataSources.insertTransaction(transaction);
    return data;
  }

  deleteTransaction(int id) async {
    var data = await _dataSources.deleteTransaction(id);
    return data;
  }
}
