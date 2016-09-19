import ddf.minim.*;
import java.io.*;

String slogan_1 = "The ";
String slogan_2 = "answer ";
String slogan_3 = "to the Ultimate question of life,";
String slogan_4 = "the universe and everything is ";
String slogan_5 = "42.";
String movieName = "The Hitchhiker's Guide to the Galaxy";
String btnText = "Why Ultimately";

int from;
int showSt;

PImage bgImg;
PImage disLogo;
PFont mainPage_1;
PFont mainPage_2;

boolean isState_1;
boolean isState_2;
boolean isState_3;
boolean isState_4;

int Period;
int timer;

String ans = "";
String email = "";

ArrayList<FactsOfAPeriod> factbase = new ArrayList<FactsOfAPeriod>();
ArrayList<String> probSt = new ArrayList<String>();

FactsOfAPeriod fsNow;

PrintWriter output;

Minim minim;
AudioPlayer player;

int now;

Runtime rt;
Process p;

void setup() {
  size(1366, 768);

  String sTmp = "we are always lack of money";
  probSt.add(sTmp);
  sTmp = "people hate wars";
  probSt.add(sTmp);
  sTmp = "we should be good";
  probSt.add(sTmp);
  sTmp = "we are afraid of death";
  probSt.add(sTmp);
  sTmp = "human rights are important";
  probSt.add(sTmp);
  sTmp = "human research on clone";
  probSt.add(sTmp);
  sTmp = "human are complex organisms";
  probSt.add(sTmp);
  sTmp = "we study history";
  probSt.add(sTmp);
  sTmp = "we need planning";
  probSt.add(sTmp);
  sTmp = "we study history";
  probSt.add(sTmp);
  sTmp = "cat is so cute";
  probSt.add(sTmp);
  sTmp = "we go to school";
  probSt.add(sTmp);
  sTmp = "we tell lies";
  probSt.add(sTmp);
  sTmp = "we can hear";
  probSt.add(sTmp);
  sTmp = "people get married";
  probSt.add(sTmp);
  sTmp = "you play this game with me";
  probSt.add(sTmp);
  sTmp = "people have nationality";
  probSt.add(sTmp);
  sTmp = "we should read books";
  probSt.add(sTmp);
  sTmp = "we dream while sleeping";
  probSt.add(sTmp);
  sTmp = "we have different religions";
  probSt.add(sTmp);

  minim = new Minim(this);
  player = minim.loadFile("bg.mp3");
  player.loop();

  bgImg = loadImage("bgimg.jpg");
  disLogo = loadImage("disLogo.png");

  mainPage_1 = loadFont("Georgia-48.vlw");
  mainPage_2 = loadFont("Georgia-Bold-48.vlw");

  isState_1 = true;
  isState_2 = false;
  isState_3 = false;

  output = createWriter("factbase.txt");

  int biu = probSt.size();
  int piu = int(random(0, biu));
  FactsOfAPeriod fstmp = new FactsOfAPeriod();
  fstmp.addAns(probSt.get(piu));

  factbase.add(fstmp);

  Period = 1;
  fsNow = new FactsOfAPeriod();

  output.println("Period is " + Period);
  output.println("Answers of this Period are");
  int i = 1;
  for (String s : fstmp.sl) {
    output.println(i + ". " + s);
    i++;
  }
  output.println();
  output.flush();

  showSt = 1;
}

void draw() {
  if (isState_1 == true) {
    displayState_1();
  } else if (isState_2 == true) {
    displayState_2();
  } else if (isState_3 == true) {
    displayState_3();
  } else if (isState_4 == true) {
    displayState_4();
  }
} 

void displayState_1() {
  //bg
  image(bgImg, 0, 0, width, height);

  //Text
  fill(255);
  textFont(mainPage_1);
  textSize(38);
  text(slogan_1, 220, 280);
  textFont(mainPage_2);
  text(slogan_2, 302, 280);
  textFont(mainPage_1);
  text(slogan_3, 500, 280);
  text(slogan_4, 341, 344);
  textFont(mainPage_2);
  text(slogan_5, 1000, 344);
  textSize(28);
  text(movieName, 400, 400);
  stroke(255);

  //btn
  stroke(255);
  strokeWeight(2);
  color textColor = color(80);
  if (mouseHovering(568, 782, 450, 502) == true) {
    fill(255);
  } else {
    textColor = color(255);
    noFill();
  }
  rect(568, 450, 214, 52);
  textSize(24);
  fill(textColor);
  text(btnText, 580, 485);

  //dis
  //DisDis();

  //time
  TimeDis();
}

void displayState_2() {
  image(bgImg, 0, 0, width, height);

  //Problem
  FactsOfAPeriod lastPeriod = factbase.get(Period - 1);
  String prob = Period + ". " + "Why " + lastPeriod.getProb() + "?";
  textSize(40);
  fill(255);
  text(prob, width/2 - textWidth(prob)/2, 310);

  //ansArea
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(440, 350, 480, 53);
  textSize(36);
  text(ans, 449, 392);

  //submit
  stroke(255);
  strokeWeight(2);
  color textColor = color(80);
  if (mouseHovering(610, 760, 440, 480) == true) {
    fill(255);
  } else {
    textColor = color(255);
    noFill();
  }
  rect(610, 440, 150, 40);
  textSize(27);
  fill(textColor);
  text("Submit It", 620, 472);

  //dis
  DisDis();

  //finish
  FinishDis();

  //time
  TimeDis();
}

void displayState_3() {
  image(bgImg, 0, 0, width, height);

  //info
  String info = "Leave your email to receive your answers.";
  textSize(36);
  fill(255);
  text(info, width/2 - textWidth(info)/2, 310);

  //emailaddress
  stroke(255);
  strokeWeight(2);
  noFill();
  float tmp = width/2 - textWidth(info)/2;
  rect(tmp, 340, 730, 30);
  textSize(20);
  text(email, tmp + 9, 363);

  //finalbtn
  if (mouseHovering(1040, 1070, 337, 370) == true) {
    fill(255);
  } else {
    noFill();
  }
  ellipse(tmp + 760, 355, 30, 30);

  //dis
  DisDis();

  //back
  //backDis();

  //time
  TimeDis();
}

void displayState_4() {
  image(bgImg, 0, 0, width, height);

  int loc = 100;

  for (int i = showSt; i < Period; i++) {
    if (loc > height - 120) {
      break;
    }
    String prob = i + ". " + "Why " + factbase.get(i - 1).getProb() + "?";
    //textFont(mainPage_2);
    textSize(40);
    fill(255);
    text(prob, width/2 - textWidth(prob)/2, loc);

    String ans = factbase.get(i).getProb();
    //textFont(mainPage_1);
    textSize(36);
    fill(255);
    text(ans, width/2 - textWidth(ans)/2, loc + 60);

    loc += 120;

    text("...", width/2 - textWidth("...")/2, loc);

    loc += 80;
  }

  //back
  backDis();

  //time
  TimeDis();
}


boolean mouseHovering(int a, int b, int c, int d) {
  if ((mouseX > a) && (mouseX < b) && (mouseY > c) && (mouseY < d)) {
    return true;
  } else {
    return false;
  }
}


void TimeDis() {
  textSize(18);
  fill(255);
  text(year() + "." + month() + "." + day() + " " + hour() + ":" + minute() + ":" + second(), 1150, 750);
}

void DisDis() {
  noStroke();
  color bgColor = color(100);
  if (mouseHovering(width/2-25, width/2+45, 0, 70) ==true) {
    bgColor = color(130);
  }
  fill(bgColor);
  rect(width/2 - 35, 0, 70, 70);
  image(disLogo, width/2 - 25, 10, 50, 50);
}

void backDis() {
  if (mouseHovering(width/2 - int(textWidth("BACK")/2) - 4, width/2 + int(textWidth("BACK")/2) + 4, height - 60, height - 35)) {
    fill(255);
  } else {
    noFill();
    stroke(255);
  }
  rect(width/2 - textWidth("BACK")/2 -9, height - 60, textWidth("BACK") + 18, 25);

  if (mouseHovering(width/2 - int(textWidth("BACK")/2) - 4, width/2 + int(textWidth("BACK")/2) + 4, height - 60, height - 35)) {
    fill(27);
  } else {
    fill(255);
  }
  textSize(18);
  text("BACK", width/2 - textWidth("BACK")/2, height - 40);
}

void FinishDis() {
  if (mouseHovering(width/2 - int(textWidth("DONE WITH THIS")/2) - 4, width/2 + int(textWidth("DONE WITH THIS")/2) + 4, height - 60, height - 35)) {
    fill(255);
  } else {
    noFill();
    stroke(255);
  }
  rect(width/2 - textWidth("DONE WITH THIS")/2 + 35, height - 60, textWidth("DONE WITH THIS") - 70, 25);

  if (mouseHovering(width/2 - int(textWidth("DONE WITH THIS")/2) - 4, width/2 + int(textWidth("DONE WITH THIS")/2) + 4, height - 60, height - 35)) {
    fill(27);
  } else {
    fill(255);
  }
  textSize(18);
  text("DONE WITH THIS", width/2 - textWidth("DONE WITH THIS")/2, height - 40);
}


void keyPressed() {
  if (isState_2 == true) {
    if ((keyCode >= 32) && (keyCode <= 126)) {
      ans = ans + key;
    } else 
      if ((keyCode == 8) && (ans.length() != 0)) {
      ans = ans.substring(0, ans.length()-1);
    }
  } else if (isState_3 == true) {
    if ((keyCode >= 32) && (keyCode <= 126)) {
      email = email + key;
    } else 
      if ((keyCode == 8) && (email.length() != 0)) {
      email = email.substring(0, email.length()-1);
    }
  }

  if (key == '+') {
    saveFrame("###.jpg");
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  if (isState_4 == true) {
    if (e < 0) {
      if (showSt > 1) {
        showSt --;
      }
    } else {
      if (e > 0) {
        if (showSt + 2 < Period) {
          showSt ++;
        }
      }
    }
  }
}

void mouseReleased() {
  if (isState_1 == true) {
    if (mouseHovering(568, 782, 450, 502) == true) {
      isState_1 = false;
      isState_2 = true;
      isState_3 = false;
      isState_4 = false;
      speak(factbase.get(Period - 1).getProb());
    }
  }
  if (isState_2 == true) {
    if (mouseHovering(610, 760, 440, 480) == true) {
      isState_1 = false;
      isState_2 = true;
      //isState_3 = true;
      isState_4 = false;

      if (ans != "") {
        speak(ans);

        fsNow.addAns(ans);
        ans = "";

        Period ++;
        factbase.add(fsNow);
        output.println("Period is " + Period);
        output.println("Answers of this Period are");
        int i = 1;
        for (String s : fsNow.sl) {
          output.println(i + ". " + s);
          i++;
        }

        output.println();
        output.flush();
        fsNow = new FactsOfAPeriod();
      }
    }
  }
  if (isState_3 == true) {
    if (mouseHovering(1040, 1070, 337, 370) == true) {
      isState_1 = true;
      isState_2 = false;
      isState_3 = false;
      isState_4 = false;

      factbase = new ArrayList<FactsOfAPeriod>();

      int biu = probSt.size();
      int piu = int(random(0, biu));
      FactsOfAPeriod fstmp = new FactsOfAPeriod();
      fstmp.addAns(probSt.get(piu));
      factbase.add(fstmp);
      Period = 1;

      fsNow = new FactsOfAPeriod();

      output.println(email);
      output.flush();
      email = "";
      
      output.println("---------------------------------------------------");
      output.println();
      output.println();
      output.println("Period is " + Period);
      output.println("Answers of this Period are");
      int i = 1;
      for (String s : fstmp.sl) {
        output.println(i + ". " + s);
        i++;
      }
      output.println();
      output.flush();
    }
  }
  if (mouseHovering(width/2-25, width/2+45, 0, 70) ==true) {
    if (isState_2 == true) {
      from = 2;
    } else {
      from = 3;
    }
    isState_1 = false;
    isState_2 = false;
    isState_3 = false;
    isState_4 = true;
  }
  if (isState_2 == true) {
    if (mouseHovering(590, 750, 710, 740) == true) {
      isState_1 = false;
      isState_2 = false;
      isState_3 = true;
      isState_4 = false;
    }
  }
  if (isState_4 == true) {
    if (mouseHovering(590, 750, 710, 740) == true) {
      if (from == 2) {
        isState_1 = false;
        isState_2 = true;
        isState_3 = false;
        isState_4 = false;
      } else {
        isState_1 = false;
        isState_2 = false;
        isState_3 = true;
        isState_4 = false;
      }
    }
  }
}

void speak(String s) {
  String ss = "say Why " + s + "? -v Samantha -f 100";
  try {
    rt = Runtime.getRuntime();
    p = rt.exec(ss);
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
}

