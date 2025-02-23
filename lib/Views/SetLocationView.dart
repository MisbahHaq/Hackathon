import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/SetLocationController.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class SetLocationScreen extends StatelessWidget {
  final SetLocationController controller = Get.put(SetLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.currentLocation.value == null
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (mapController) =>
                        controller.updateMapController(mapController),
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation.value!,
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("currentLocation"),
                        position: controller.currentLocation.value!,
                        draggable: true,
                        onDragEnd: (newPosition) {
                          controller
                              .updateLocation(newPosition as LocationData);
                        },
                      ),
                    },
                    circles: {
                      Circle(
                        circleId: CircleId("locationCircle"),
                        center: controller.currentLocation.value!,
                        radius: 300,
                        fillColor: Colors.red.withOpacity(0.1),
                        strokeColor: Colors.red,
                        strokeWidth: 2,
                      )
                    },
                  ),

                  // Search Bar
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Where is your location",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  // Bottom Panel
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Lat: ${controller.currentLocation.value!.latitude.toStringAsFixed(4)}, "
                            "Lng: ${controller.currentLocation.value!.longitude.toStringAsFixed(4)}",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Location set logic
                              print(
                                  "Location Set: ${controller.currentLocation.value}");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
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
