import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

class Ship extends FlxSprite
{
    public var bullets(default, null): FlxTypedGroup<Bullet>;

    public function new()
    {
        super();
        loadGraphic("assets/images/i_are_spaceship.png", true, 16, 24);
        animation.add("idle", [0, 1], 8);
        x = (FlxG.width - width) / 2.0;
        y = 220;
        bullets = new FlxTypedGroup<Bullet>();
        shootTimer = new FlxTimer();
        shootTimer.start(0, function (t: FlxTimer){canShoot = true;});
        canShoot = true;
        animation.play("idle");
    }

    public override function update(elapsed: Float): Void
    {
        super.update(elapsed);

        if (FlxG.keys.pressed.A)
        {
            velocity.x = -SHIP_SPEED;
        }
        else if(FlxG.keys.pressed.D)
        {
            velocity.x = SHIP_SPEED;
        }
        else
        {
            velocity.x = 0;
        }

        FlxSpriteUtil.bound(this, 0, FlxG.width);

        if (FlxG.keys.pressed.G && canShoot)
        {
            shoot();
        }
    }

    private function shoot()
    {
        var newBullet = bullets.recycle(Bullet);
        newBullet.reset(x+width/2.0-newBullet.width/2.0, y);
        newBullet.velocity.y = -BULLET_SPEED;
        canShoot = false;
        shootTimer.reset(1.0/SHOTS_PER_SECOND);
    }

    private var shootTimer: FlxTimer;
    private var canShoot: Bool;
    private static inline var SHOTS_PER_SECOND = 7;
    private static inline var SHIP_SPEED = 150;
    private static inline var BULLET_SPEED = 200;
}
