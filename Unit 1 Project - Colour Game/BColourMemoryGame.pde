void colourWordIndex() {
  //colour index:
  colour = new color[7];

  colour[0] = color(255, 0, 0); //red
  colour[1] = color(255, 165, 0); //orange
  colour[2] = color(255, 255, 0); //yellow
  colour[3] = color(0, 128, 0); //green
  colour[4] = color(0, 0, 255); //blue
  colour[5] = color(103, 95, 106); //grey
  colour[6] = color(127, 0, 255); //violet

  //word index:
  words = new String[7];

  words[0] = "red";
  words[1] = "orange";
  words[2] = "yellow";
  words[3] = "green";
  words[4] = "blue";
  words[5] = "grey";
  words[6] = "violet";
}

void wordAndColour(int s) {
  textAlign(CENTER, CENTER);
  textSize(70);
  textFont(SuperTrend);

  pushMatrix();
  translate(width / 2, height - 550);
  scale(s);

  fill(colour[currentColourIndex]);
  rotate(rotationMovements); //rotate the text

  text(words[currentWordIndex], 0, 0);

  popMatrix();

  rotationMovements += radians(5);
}

void match(int matchX, int matchY) {
  textAlign(CENTER, CENTER);
  textSize(70);
  textFont(SuperTrend);
  fill(255);

  text("MATCH", matchX, matchY);
}

void doesNotMatch(int doesNotMatchX, int doesNotMatchY) {
  textAlign(CENTER, CENTER);
  textSize(70);
  textFont(SuperTrend);
  fill(0);

  text("DOESN'T MATCH", doesNotMatchX, doesNotMatchY);
}


void pickNewSelection() {
  int differentiateIndex = int(random(2));

  if (differentiateIndex == 0) {
    //50/50 equal chance of MATCHING
    currentColourIndex = int(random(0, 7));
    currentWordIndex = currentColourIndex;

    //if matches
    matches = true;
  } else {
    //half equal chance of getting WORD not equal COLOUR
    currentColourIndex = int(random(0, 7));
    currentWordIndex = currentColourIndex;

    //if it doesn't equal then re-generate the int
    while (currentWordIndex == currentColourIndex) {
      currentWordIndex = int(random(0, 7));
      
    }

    //doesn't match
    matches = false;
  }
}

void difficultySystem() {
  //level 1:
  if (points <= 10) {
    countDown -= 1;

    //level 2:
  } else if (points >= 10 && points < 20) {
    countDown -= 2;

    //level 3:
  } else if (points >= 20 && points < 30) {
    countDown -= 4;

    //level 4:
  } else if (points >= 30 && points < 40) {
    countDown -= 5;

    //final level:
  } else {
    countDown -= 6;
  }
}




void backgroundSplit() {
  fill(0);
  rect(0, 0, width / 2, height);
}

void countDownSystem(int x, int y) {
  textAlign(CENTER, CENTER);
  textSize(30);
  textFont(SuperTrend);
  //fill(255);

  if (countDown > 0) {
    text(countDown / 60, x, y);
    countDown -= 1;
  } else {
    text("0", x, y);
    mode = GAMEOVER;
  }
}

void pointSystem() {
  textAlign(CENTER, CENTER);
  textSize(70);
  textFont(SuperTrend);
  fill(#5874FA);
  text("points:", width - 450, 40);
  text(points, width - 330, 40);
}

void highestScorePlayed() {
  if ( points > highScore ) {
    highScore = points;
  }

  pushMatrix();
  translate(width / 2 - 30, height / 2 + 100);
  textAlign(CENTER, CENTER);
  textSize(70);
  textFont(SuperTrend);
  fill(#A2D7FF);
  text("HIGHEST SCORE:", 0, 0);
  
  translate(210, 0);
  text(highScore, 0, 0);
  popMatrix();
  
}
