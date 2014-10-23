
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity : SEEntity
{

	SESprite monster;
	SESprite text;
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

		rsc.prepare_font("myfont","trebuchet ms bold color=black", 80);
        text = add_sprite_for_text(" ","myfont");
	}

	public void tick(TimeVal now, double delta)
	{
		base.tick(now,delta);
		
		pX = MainScene.x;
		py = MainScene.y;

		mx = monster.get_x();
		my = monster.get_y();
	
		monster.move(mx+(pX-mx)/Math.random(100,500), my+(py-my)/Math.random(100,500));

		if((mx/pX)==1 && (my/py)==1)
		{
            text.set_text("GAME OVER!");
            text.move(0.35*w, 0.45*h);
		}
	}

	public void cleanup()
	{
		base.cleanup();
	}
}
