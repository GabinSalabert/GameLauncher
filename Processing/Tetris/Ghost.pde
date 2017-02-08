public class Ghost{

	Square sq[];
	int min;
  color c;
	Ghost() {
		min=600;
    
	}

	void update(Brick b) {
		for (int i=0; i < 4; i++) {
			sq[i] = new Square(b.sq[i], c);
		}
    	c = new color(red(b.c), green(b.c), blue(b.c), 100);
	}

	void draw() {
		min = 600;
		for (int i=0; i < 4; i++) {
			if ((int)maxY[sq[i].pos.y/15] - sq[i].pos.y < min)
				min = maxY[sq[i].pos.x/15].pos.y - sq[i].pos.y;
			else if ((int)maxY[sq[i].pos.y/15] > sq[i].pos.y) {
				min = 0;
				break;
			}
		}

		for (int i=0; i < 4; i++) {
			sq[i].pos.y += min;;
		}

		for (int i=0; i < 4; i++) {
			sq[i].draw();
		}


	}
}