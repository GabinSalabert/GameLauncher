public class Ghost{

	Square sq[];
	int min;

	Ghost() {
		min=600;

	}

	update(Brick b) {
		for (int i=0; i < 4; i++) {
			sq[i] = new Square(b.sq[i]);
		}
	}
	draw() {
		min = 600;
		for (int i=0; i < 4; i++) {
			if (maxY[sq[i].pos.x/15] - sq[i] < max)
				max = maxY[sq[i].pos.x/15] - sq[i];
		}

		for (int i=0; i < 4; i++) {
			sq[i].pos.y += min;;
		}

		for (int i=0; i < 4; i++) {
			sq[i].draw();
		}


	}
}