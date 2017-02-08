public class Ghost{

	Square sq[];
	int min;
  color c;
	Ghost() {
		min=600;
		c = new color(128, 128, 128, 128);
    
	}

	void draw() {
		min = 600;
		for (int i : b.underY) { //GET LOWEST GAP TO BOTTOM BEETWEEN EACH SQUARE OF THE BRICK
			if (i < min)
				min = i;
		}

		for (int i=0; i < 4; i++)
			sq[i].pos.y += min

	}
}