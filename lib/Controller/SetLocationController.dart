import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SetLocationController extends GetxController {
  Rx<LatLng> currentLocation = LatLng(24.920064, 67.059712).obs;
  GoogleMapController? mapController;

  void updateLocation(LocationData newLocation) {
    currentLocation.value =
        LatLng(newLocation.latitude!, newLocation.longitude!);
  }

  void updateMapController(GoogleMapController controller) {
    mapController = controller;
  }
}

class SetLocationView extends StatelessWidget {
  final SetLocationController controller = Get.put(SetLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Your Location')),
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController mapController) {
                controller.updateMapController(mapController);
              },
              initialCameraPosition: CameraPosition(
                target: controller.currentLocation.value,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("current_location"),
                  position: controller.currentLocation.value,
                ),
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lat: ${controller.currentLocation.value.latitude}, "
                      "Lng: ${controller.currentLocation.value.longitude}",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Save or set location
                        Get.snackbar(
                            "Location Set", "Your location has been saved!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Set Location"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
