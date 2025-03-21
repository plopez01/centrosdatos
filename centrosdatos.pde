import java.io.*;
import java.util.*;

import ia.practica1.model.*;

int MAP_X = 100;
int MAP_Y = 100;

color SENSOR_TIER_ONE = color(255, 0, 0);
color SENSOR_TIER_TWO = color(255, 255, 0);
color SENSOR_TIER_FIVE = color(255, 0, 255);


int SCREEN_MIN;

List<Datacenter> datacenters = new ArrayList<>();
List<Sensor> sensors = new ArrayList<>();

void setup() {
  fullScreen(2);
  background(0);

  SCREEN_MIN = min(width, height);

  try {
    ObjectInputStream ios = new ObjectInputStream(new FileInputStream(dataPath("greedy.sol")));
    Solution s = (Solution) ios.readObject();
    ProblemInfo info = s.info;
    print(s.valid());
    print(s.getTarget(33));
    for (int i = 0; i < info.C; i++) {
      datacenters.add(new Datacenter(s.entity(i)));
    }

    for (int i = info.C; i < info.C + info.N; i++) {
      sensors.add(new Sensor(i, s.entity(i), s.entity(s.getTarget(i))));
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
  background(0);
  
  noFill();
  stroke(255);
  rectMode(CORNER);
  square(0, 0, SCREEN_MIN-1);

  textSize(64);
  textCenter("SIMULATION", SCREEN_MIN + (width-SCREEN_MIN)/2, 100);
  
  for (var sensor : sensors) {
    sensor.render();
  }

  for (var datacenter : datacenters) {
    datacenter.render();
  }
}
