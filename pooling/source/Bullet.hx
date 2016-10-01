import flixel.FlxSprite;

class Bullet extends FlxSprite{
    public function new(){
        super();
        loadGraphic("assets/images/i_are_spaceship.png", true, 8, 8);
        animation.frameIndex = 20;
    }

    public override function update(elapsed: Float)
    {
    	super.update(elapsed);
        if(!isOnScreen())
            kill();
    }
}
