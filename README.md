# Rover

## Design

I chose to create a robot composed of parts and a plateau.

### Plateau

Object representing the plateau that should be passed to the robot to get know about the area.

### Robot

The robot itself consists of several some parts and the plateau.
It can receive commands like L, R and M and tells you where it are.

### Gear

These gear enables the robot to turn to left or right.

### Leg

It makes the robot walk towards.

### Brain

It gives intelligence to the robot so it knows if can move foward or not based on Plateau limit.

### Exceptions

We have two:

UnknowDirection: tells that the given direction to turn is not valid.
OutOfLimit: tells that the robot cannot move foward because there is no more plate to go inside the Plateau limit.

### Controller

Just Map Controller to receive the data and process all steps the robot needs to do.
This steps are just `x` and `y` positive or negative.
The parameter `side` is just to help the front-end know which icon render.
The steps result is returned via ajax for a better vizualization.

### View

A side menu with robot data:

Name: Robot name
Speed: Exchange rate between the current axis and the next one
Interval: Interval waiting before change between axis
Position x: where is the robot on X axis
Position y: where is the robot on Y axis
Side: Where the robot is looking
Area x: The X axis length
Area y: The Y axis length
Commands: Commands to be executed

### Commander

A class prepared to receive the input example of this test and print the given output.

# TODO

- Avoid more than one robot into the same point;
- Finish some JS specs;
- Finish some Ruby specs;
- Increase the coverage;
- Kill all Mutants;
- Separate JS Rover class into more than one object;
- Setup Istanbul for coverage;
- Configure Jenkins like:
-- [http://wbotelhos.com/instalando-o-jenkins-no-tomcat](http://wbotelhos.com/instalando-o-jenkins-no-tomcat);
-- [http://wbotelhos.com/acertando-o-warning-de-decode-do-jenkins](http://wbotelhos.com/acertando-o-warning-de-decode-do-jenkins);
-- [http://wbotelhos.com/protegendo-o-jenkins-com-senha](http://wbotelhos.com/protegendo-o-jenkins-com-senha).

# What we can do?

Run specs and check coverage too:

```bash
rspec spec
```

Run mutant to know what we can do better on specs:

```bash
bundle exec mutant -r ./config/environment --use rspec Brain
```

Run rubocop to check the code style:

```bash
rubocop
```

Run app and see a visual usage:

```bash
rails s
```

And then access [http://localhost:3000](http://localhost:3000)

Run a console version:

```bash
ruby commander.rb
```

Inside the 'commander.rb' class you can choose how many robots you will deploy changing the `robot_size`.

Enter the input:

```bash
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

And see the output:

```bash
1 3 N
5 1 E
```

You choose how many robots you will deploy and the commands are queued to be processed later one after another.

# Deploy

I used Capistrano, you can see the tasks at `config/deploy.rb`

# Server Stack

- Ruby 2.2.2
- Rails 4.2.3
- Nginx 1.8.0
- Unicorn 4.9.0
- Upstart

# Server

Amazon EC2 on IP [54.94.222.207](54.94.222.207) or just as a facilitator [http://estacione.com](http://estacione.com)

## Credentials

user: rover
password: rover

# Repository

It is keeped on Github on a private repository [https://github.com/wbotelhos/rover](https://github.com/wbotelhos/rover)
