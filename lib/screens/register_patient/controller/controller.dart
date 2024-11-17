import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/model/model.dart';

final paymentOptionController = StateProvider.autoDispose<PaymentOption?>((ref) => null,);