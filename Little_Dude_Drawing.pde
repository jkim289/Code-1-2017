size(500, 500);

//face and head
ellipse(250, 125, 80, 100);
//eyes
fill(#000000);
ellipse(235, 110, 7, 12);
ellipse(265, 110, 7, 12);
//nose thing
strokeWeight(3);
point(250, 130);
//mouth
strokeWeight(1);
fill(#FC8CA6);
arc(250, 150, 20, 20, 0, PI, CHORD);

//body
fill(#0C5667);
strokeWeight(2);
quad(235, 175, 265, 175, 280, 300, 220, 300);
//arms
line(232, 190, 200, 250);
line(268, 190, 300, 220);
line(300, 220, 332, 190);
//legs
line(241, 300, 241, 380);
line(259, 300, 259, 380);