# Fall Detection
IoT-based fall detection using a NodeMCU, MPU6050 sensor, Websockets

| Date | 10th October 2023|
| - | - |
## Setup:
```bash
git clone https://github.com/frostedCupcake/Fall-Detection.git
cd Fall-Detection
flutter pub get
flutter run 
```

## Hardware Components:
- NodeMCU  ESP8266 12E board,
- MPU6050 6-axis gyroscope/accelerometer sensor,
- Jumper wires, ESP Cable

we compare the acceleration magnitude with a threshold value, if crossed the ESP notifies the Flutter app

![image](https://github.com/frostedCupcake/Fall-Detection/assets/99611801/5204cbe7-1d88-4359-ad0d-7196c46454c4)

