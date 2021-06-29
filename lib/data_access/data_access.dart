library data_access;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_sample/core/app_exception.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

part 'request_service.dart';
part 'interceptors.dart';
part 'repositories/abstract_repository.dart';
part 'repositories/concrete_repository.dart';
part 'repositories/mock_repository.dart';