import 'package:new_ela/controllers/bucket_function.dart';
import 'package:flutter/material.dart';

void deleteBucketItem({required deleteIndex,required context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete BucketList'),
              content: const Text('Do you want to delete?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () async {
                      deleteBucket(deleteindex: deleteIndex);
                      Navigator.pop(context);
                    },
                    child: const Text('Delete',
                        style: TextStyle(color: Colors.black)))
              ],
              backgroundColor: const Color.fromRGBO(245, 255, 210, 1),
            ));
  }