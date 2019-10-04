#Toy Robot Simulator - with multiple robots
### Run application

```bash
git clone https://github.com/saheb222/toy_robot.git
cd toy_robot_version2
ruby main.rb
```
### Exit from the application
give "q" (command) while asking for the input to exit anytime from the application
## Description

* The application is a simulation of toy robots moving on a square tabletop, of dimensions 5 units x 5 units.

* There might be other robots on the table surface.

* any robot is free to roam around the surface of the table, but must be prevented from falling to destruction or landing on top of another robot. Any movement that would result in the robot falling from the table or collide with another robot must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form:
```
ROBOT_NAME PLACE X, Y, F
ROBOT_NAME MOVE
ROBOT_NAME LEFT
ROBOT_NAME RIGHT
ROBOT_NAME REPORT
```
