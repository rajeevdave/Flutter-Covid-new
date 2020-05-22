import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:covid/helpers/user.dart';
import 'package:covid/models/user.dart';
import 'dart:math';


class BlueToothProvider with ChangeNotifier{
  FlutterBlue flutterBlue = FlutterBlue.instance;
  UserServices _userServicse = UserServices();
  bool isOn;
  UserModel _userModel;
 // String _data = 'Nobody found yet!';
 List<String> _data = ["Nobody found yet!"];
  // bool _scanning = false;
  FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();
  
void onChange() {
 
 print("Raaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  notifyListeners();
}
  //String get data => _data;

  List<String> get data => _data;

  BlueToothProvider.initialize(){
    searchForDevices();
  }

  void turnOn()async{
    isOn = await flutterBlue.isOn;
    notifyListeners();
  }

  Future<void> searchForDevices()async{
    print("Rajeev bluetooth: serchForDevices");
    isOn = await flutterBlue.isOn;
    notifyListeners();
    if(!isOn){
      return;
    }else{
      //await _bluetooth.startScan(pairedDevices: false);
      
      print("Rajeev bluetooth: serchForDevices1");

     // _bluetooth.devices.toList().then((v){
       // print("number of devices: ${ v.length}");
      //});
print("Rajeev bluetooth: serchForDevices2");
flutterBlue.startScan(timeout: Duration(seconds: 10));
      //  flutterBlue.startScan();
        print("Rajeev bluetooth: serchForDevices2");
       flutterBlue.scanResults.listen((List<ScanResult>devicelist)
        {
          _data = [];
            for(ScanResult r in devicelist){
             // if (devicelist !=null)
             // {
             //   _data = [];
             // }
            double distance= pow(10, ((-69-(r.rssi))/(10*2)));
            distance = double.parse((distance).toStringAsFixed(2));
             print('Rajeev FlutterBlue ${r.device.name}: $distance :  ${r.device.id}  : ${r.rssi}'); 

             _data.add('${r.device.name} : ${r.device.id} : ${r.rssi} : $distance Mtr ');
            }
        });
    
     // _bluetooth.devices.listen((device) {
       //print("Rajeev bluetooth: serchForDevices3");
         // if(device != null){
            //_data. = ""\\;
            //_data = [];
          //}
         //check(device.address);
        // check("4C:A5:6D:82:6F:FA");
      //  print("Rajeev bluetooth: serchForDevices4:"+device.address);
       // if(_userModel != null)
       // {
          print("Rajeev bluetooth: serchForDevices6");
         //_data += device.name+' (${device.address})\n';
         //_data.add(device.name+' (${device.address})');
       // }
       // else
       // {
         // print("Rajeev bluetooth: serchForDevices5");
       // }
          notifyListeners();
      //});
    }
 
  }

  //Future check(String deviceAdd) async{
 //       _userModel =  await _userServicse.getUserByBId((deviceAdd));
    //      }

}