import java.io.*;
import java.util.*;

import ia.practica1.model.*;

Solution s;

int MAP_X = 100;
int MAP_Y = 100;

color SENSOR_TIER_ONE = color(255, 0, 0);
color SENSOR_TIER_TWO = color(255, 255, 0);
color SENSOR_TIER_FIVE = color(255, 0, 255);


int SCREEN_MIN;

int initAnim = 0;

List<Datacenter> datacenters = new ArrayList<>();
List<Sensor> sensors = new ArrayList<>();

void setup() {
  fullScreen(2);
  background(0);

  SCREEN_MIN = min(width, height);

  try {
    ObjectInputStream ios = new ObjectInputStream(new FileInputStream(dataPath("greedy.sol")));
    s = (Solution) ios.readObject();
    ProblemInfo info = s.info;

    int[] sentData = s.getSentDataArray();

    print(s.valid());
    print(s.getTarget(31));
    for (int i = 0; i < info.C; i++) {
      datacenters.add(new Datacenter(s.entity(i)));
    }

    for (int i = info.C; i < info.C + info.N; i++) {
      sensors.add(new Sensor(i, sentData[i], s.entity(i), s.entity(s.getTarget(i))));
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
  strokeWeight(1);
  rectMode(CORNER);
  square(0, 0, SCREEN_MIN-1);

  textSize(64);
  textCenter("SIMULATION", SCREEN_MIN + (width-SCREEN_MIN)/2, 100);

  textSize(40);
  textCenter("Program seed: " + s.info.programSeed, SCREEN_MIN + (width-SCREEN_MIN)/2, 200);
  textCenter("Datacenter seed: " + s.info.seedC, SCREEN_MIN + (width-SCREEN_MIN)/2, 250);
  textCenter("Sensor seed: " + s.info.seedS, SCREEN_MIN + (width-SCREEN_MIN)/2, 300);


  noStroke();
  fill(SENSOR_TIER_ONE);
  square(SCREEN_MIN + 100, 400, 50);
  text("1 Mbps", SCREEN_MIN + 180, 445);

  fill(SENSOR_TIER_TWO);
  square(SCREEN_MIN + 100, 500, 50);
  text("2 Mbps", SCREEN_MIN + 180, 545);


  fill(SENSOR_TIER_FIVE);
  square(SCREEN_MIN + 100, 600, 50);
  text("5 Mbps", SCREEN_MIN + 180, 645);


  for (int i = 0; i < initAnim; i++) {
    sensors.get(i).render();
  }
  initAnim += 5;
  if (initAnim >= sensors.size()) initAnim = sensors.size();
  
  /*for (var sensor : sensors) {
    sensor.render();
  }*/

  for (var datacenter : datacenters) {
    datacenter.render();
  }
}
