class Waves {
  float x, y, time;
  float speed = 0.5;

  Waves(){
  
  }
  void display() {
    x += speed;
    y = height/2;
    
    //INSPIRATION AND ORIGINAL CODE MODIFIED
    //FROM BEN NORSKOV GITHUB "drawingSinOverTime"
    strokeWeight(2.5);
    //middle, unmodified sine and cosine waves
    stroke(#140EE8);
    point(x, y + sin(x*0.1)*10);
    stroke(#EA0C0C);
    point(x, y + cos(x*0.1)*10);
    
    //(y/2) second line
    stroke(#140EE8);
    point(x, y/2 + sin(x*0.05)*20);
    stroke(#EA0C0C);
    point(x, y/2 + sin(x*0.1)*10);
    
    //(y/2)*3 third line
    stroke(#140EE8);
    point(x, (y/2)*3 + sin(x*0.05)*10);
    stroke(#EA0C0C);
    point(x, (y/2)*3 + cos(x*0.1)*10);
    
    //(y/4) first line
    stroke(#CEFF0F);
    point(x, y/4 + sin(x*0.07)*10);
    stroke(#140EE8);
    point(x, y/4 + 4*sin(x*0.05)*20);
    
    stroke(#140EE8);
    point(x, y/4 + sin(x*0.06)*10);
    stroke(#CEFF0F);
    point(x, y/4 + 3*sin(x*0.06)*20);
    
    stroke(#CEFF0F);
    point(x, y/4 + sin(x*0.05)*10);
    stroke(#140EE8);
    point(x, y/4 + 2*sin(x*0.07)*20);
    
    stroke(#140EE8);
    point(x, y/4 + sin(x*0.04)*10);
    stroke(#CEFF0F);
    point(x, y/4 + sin(x*0.08)*20);
    
    //(y/4)*3) third line
    stroke(#74FF8A);
    point(x, (y/4)*3 + sin(x*0.1)*20);
    stroke(#AE5AD3);
    point(x, (y/4)*3 + cos(x*0.07)*10);
    
    stroke(#74FF8A);
    point(x, (y/4)*3 + sin(x*0.09)*20);
    stroke(#AE5AD3);
    point(x, (y/4)*3 + 2*cos(x*0.08)*10);
    
    stroke(#74FF8A);
    point(x, (y/4)*3 + sin(x*0.08)*20);
    stroke(#AE5AD3);
    point(x, (y/4)*3 + 3*cos(x*0.09)*10);
    
    stroke(#74FF8A);
    point(x, (y/4)*3 + sin(x*0.07)*20);
    stroke(#AE5AD3);
    point(x, (y/4)*3 + 4*cos(x*0.1)*10);
    
    //(y/4)*5 fifth line
    stroke(#0DFFB8);
    point(x, (y/4)*5 + sin(x*0.03)*30);
    stroke(#EA0C0C);
    point(x, (y/4)*5 + cos(x*0.01)*30);
    
    stroke(#0DFFB8);
    point(x, (y/4)*5 + sin(x*0.02)*30);
    stroke(#EA0C0C);
    point(x, (y/4)*5 + cos(x*0.02)*30);
    
    stroke(#0DFFB8);
    point(x, (y/4)*5 + sin(x*0.01)*30);
    stroke(#EA0C0C);
    point(x, (y/4)*5 + cos(x*0.03)*30);
    
    stroke(#0DFFB8);
    point(x, (y/4)*5 + sin(x*0.04)*30);
    stroke(#EA0C0C);
    point(x, (y/4)*5 + cos(x*0.04)*30);
    
    stroke(#0DFFB8);
    point(x, (y/4)*5 + sin(x*0.05)*30);
    stroke(#EA0C0C);
    point(x, (y/4)*5 + cos(x*0.05)*30);
    
    //(y/4)*7 seventh line
    stroke(#00C4AB);
    point(x, (y/4)*7 + sin(x*0.04)*15);
    stroke(#FAD4EC);
    point(x, (y/4)*7 + 2*sin(x*0.04)*15);
    
    stroke(#FAD4EC);
    point(x, (y/4)*7 + sin(x*0.06)*15);
    stroke(#00C4AB);
    point(x, (y/4)*7 + 3*sin(x*0.06)*15);
    
    stroke(#00C4AB);
    point(x, (y/4)*7 + sin(x*0.08)*15);
    stroke(#FAD4EC);
    point(x, (y/4)*7 + 4*sin(x*0.08)*15);
    
    stroke(#FAD4EC);
    point(x, (y/4)*7 + sin(x*0.1)*15);
    stroke(#00C4AB);
    point(x, (y/4)*7 + 5*sin(x*0.1)*15);
  }
}