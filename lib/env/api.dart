//Local Host
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const emulatorIp = '10.0.2.2:3000';
const simulatorIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? simulatorIp : emulatorIp;

//storage
final storage = FlutterSecureStorage();
