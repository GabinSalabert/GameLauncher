public class Ghost{

	Square sq[];
	int min;
  color c;
	Ghost() {
		min=600;
		c = color(128, 128, 128);
    sq = new Square[4];
	}

	void draw(Brick b) {
    
    for (int i=0; i < 4; i++) { //Update position
      sq[i] = new Square(b.sq[i], c);
    }
    
		min = 600;
		for (int i : b.underY) { //GET LOWEST GAP TO BOTTOM BEETWEEN EACH SQUARE OF THE BRICK
			if (i < min)
				min = i;
		}

		for (int i=0; i < 4; i++)
			sq[i].pos.y += min-15;
    
    for (int i=0; i < 4; i++)
      sq[i].draw();
	}
}