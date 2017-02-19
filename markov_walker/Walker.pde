/* My Transition Matrix 
  U    D     L    R
U 0.5  0.3   0.1  0.1 
D 0.3  0.5   0.1  0.1
L 0.1  0.1   0.5  0.3 
R 0.1  0.1   0.3  0.5
*/

class Walker {
  int x; 
  int y;
  String step = "L"; 
  
  Walker() {
    x = width / 2; 
    y = height / 2;
  }
  
  void display() {
    int color_a = int(map(x - y, 0, (width + height) / 2, 0, 256)); 
    int color_b = int(map(y - x, 0, (width + height) / 2, 0, 256)); 
    stroke(color_a, color_b, 255); 
    point(x, y); 
  }
  
  void step() {
    decide();
    if (step == "U") {
      y--;
    } 
    else if (step == "D") { 
      y++;
    } 
    else if (step == "L") {
      x--; 
    } 
    else if (step == "R") {
      x++; 
    }
  }
  
  void decide() {
    float choice = random(10);
    if (step == "U") {
      if (choice <= 9.5) {
        step = "U"; 
      }
      else if (choice <= 9.8) {
        step = "D"; 
      } 
      else if (choice <= 9.9) {
        step = "L";
      } 
      else {
        step = "R";
      }
    }
    else if (step == "D") {
      if (choice <= 9.5) {
        step = "D"; 
      }
      else if (choice <= 9.8) {
        step = "U"; 
      } 
      else if (choice <= 9.9) {
        step = "L";
      } 
      else {
        step = "R";
      }
    }
    else if (step == "L") {
      if (choice <= 9.5) {
        step = "L"; 
      }
      else if (choice <= 9.8) {
        step = "R"; 
      } 
      else if (choice <= 9.9) {
        step = "U";
      } 
      else {
        step = "D";
      }
    }
    else if (step == "R") {
      if (choice <= 9.5) {
        step = "R"; 
      }
      else if (choice <= 9.8) {
        step = "L"; 
      } 
      else if (choice <= 9.9) {
        step = "U";
      } 
      else {
        step = "D";
      }
    } 
  }
}