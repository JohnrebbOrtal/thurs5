
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity : SEEntity
{

	SESprite monster;
	int w;
	int h;

	int mx;
	int my;
	int pX;
	int py;
	
	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();

		rsc.prepare_image("mymonster", "monster", 0.1*w);
		monster = add_sprite_for_image(SEImage.for_resource("mymonster"));
		
		monster.move(Math.random(0,w), Math.random(0,h));
	}

	public void tick(TimeVal now, double delta)
	{
		pX = MainScene.x;
		py = MainScene.y;

		mx = monster.get_x();
		my = monster.get_y();
		base.tick(now,delta);
		
		monster.move(mx+(pX-mx)/Math.random(100,500), my+(py-my)/Math.random(100,500));
	}

	public void cleanup()
	{
		base.cleanup();
	}
}
