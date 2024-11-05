import 'dart:developer';

import 'package:new_ela/model/bucket/bucket_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BucketModel>> bucketNotifier=ValueNotifier([]);

Future<void> addBucket({required BucketModel bucket}) async{
final bucketdb= await Hive.openBox<BucketModel>('bucket');
log('got in fn ${bucket.title}');
await bucketdb.add(bucket);
bucketNotifier.value=bucketdb.values.toList();
}
Future<void> updateBucket({required BucketModel bucket,required int index})async{
  final bucketdb=await Hive.openBox<BucketModel>('bucket');
  await bucketdb.putAt(index, bucket);
  log('updated bucket');
}
Future<List<BucketModel>> getBucket()  async{
  final bucketdb=await Hive.openBox<BucketModel>('bucket');
  return bucketdb.values.toList().cast<BucketModel>();
}

Future<void> deleteBucket({required int deleteindex}) async{
  final bucketdb= await Hive.openBox<BucketModel>('bucket');
  await bucketdb.deleteAt(deleteindex);
  log('delete completed');
  bucketNotifier.value=bucketdb.values.toList();
}
int calculateDaysLeft(DateTime finalDate) {
    final DateTime today = DateTime.now();
    return finalDate.difference(today).inDays;
  }