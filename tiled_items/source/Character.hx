import flixel.FlxSprite;
import flixel.FlxG;
import flixel.effects.FlxFlicker;

class Character extends FlxSprite
{
  private var walking_front: Bool = true;

  public function new (X: Float = 0, Y: Float = 0)
  {
    super(X, Y);
    loadGraphic("assets/images/sprites_alpha.png", true, 16, 16);
    animation.add("standing_front", [96], 1);
    animation.add("standing_back", [112], 1);
    animation.add("walking_front", [97, 98, 99], 5);
    animation.add("walking_back", [113, 114, 115], 5);
    animation.play("standing_front");
    maxVelocity.x = maxVelocity.y = CHAR_MAXVEL;
    drag.x = drag.y = CHAR_DRAG;
    width = 12;
    offset.x = 2;
    x += offset.x;
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);
    if(FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT){
      animation.play("walking_front");
      acceleration.x = -CHAR_ACCEL;
      walking_front = true;
    }else if(FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT){
      animation.play("walking_front");
      acceleration.x = CHAR_ACCEL;
      walking_front = true;
    }else{
      acceleration.x = 0;
    }

    if(FlxG.keys.pressed.W || FlxG.keys.pressed.UP){
      animation.play("walking_back");
      acceleration.y = -CHAR_ACCEL;
      walking_front = false;
    }else if(FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN){
      animation.play("walking_front");
      acceleration.y = CHAR_ACCEL;
      walking_front = true;
    }else{
      acceleration.y = 0;
    }

    if(Math.abs(velocity.x) < 5 && Math.abs(velocity.y) < 5){
      if(walking_front)
        animation.play("standing_front");
      else
        animation.play("standing_back");
    }
  }

  public function hit(){
    if(FlxFlicker.isFlickering(this)) return;
    FlxFlicker.flicker(this);
  }

  private inline static var CHAR_ACCEL: Float     = 120;
  private inline static var CHAR_MAXVEL: Float    = 70;
  private inline static var CHAR_DRAG: Float      = 150;
}
