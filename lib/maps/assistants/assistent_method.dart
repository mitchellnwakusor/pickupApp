import 'package:geolocator/geolocator.dart';
import 'package:pickup/global/map_key.dart';
import 'package:pickup/maps/assistants/request_method.dart';
import 'package:pickup/maps/infoHandler/app_info.dart';
import 'package:pickup/maps/models/direction.dart';
import 'package:provider/provider.dart';

import '';

class AssistantMethod {

  static Future<String> searchAddressForGeographicCoOrdinates (Position position, context) async {
    String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";


    String humanReadableAddress ="";

    var requestResponse = await RequestMethod.receiveRequest(apiUrl);


    if (requestResponse != "Error Occurred, Failed. No Response."){

     humanReadableAddress = requestResponse["results"][0]["formatted_address"];

     Directions userPickUpAddress= Directions();
     userPickUpAddress.locationLongitude=position.longitude;
     userPickUpAddress.locationLatitude=position.latitude;
     userPickUpAddress.locationName=humanReadableAddress;

     Provider.of<AppInfo>(context, listen: false).upDatePickupLocationAddress(userPickUpAddress);

    }

    return humanReadableAddress;

  }

}
