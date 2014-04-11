package  {
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.engine.EastAsianJustifier;
	import flash.geom.*;

	public class Joint extends Sprite {
		public function Joint(xpos:Number = 0, ypos:Number = 0, father:Joint=null) 
		{
			xPos=xpos;
			yPos=ypos;
			Father=father;
			img = new Loader();
			img.load(new URLRequest("Joint.png"));
			img.contentLoaderInfo.addEventListener(Event.COMPLETE,onImashcha);
			Rotation=0;
			

		}
		function onImashcha(e:Event):void
		{
			img.content.scaleX=0.2;
			img.content.scaleY=0.2;
			img.content.x=xPos;
			img.content.y=yPos;
			var dist:Number = Math.sqrt((xPos-Father.xPos)^2+(yPos-Father.yPos)^2);
			img.addEventListener(MouseEvent.MOUSE_DOWN,Move);
			img.addEventListener(MouseEvent.MOUSE_UP,StopMove);
			if(stage) stage.addChild(img);
			else addEventListener(Event.ADDED_TO_STAGE,onStage);
			
			
		}
		function onStage(e:Event):void
		{
			stage.addChild(img);
		}
		function Move(e:MouseEvent)
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE,ChangePos);
			
		}
		function StopMove(e:MouseEvent)
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,ChangePos);
		}
		function ChangePos(e:MouseEvent=null):void
		{
				xPos=img.mouseX
				img.content.x=xPos;
			
				yPos=img.mouseY;
				img.content.y=yPos;
				if(Father!=null)Father.ik(xPos,yPos, dist);
			
		}
		function ik(x1:Number,y1:Number, distance:Number):void
		{
				var a:Number = x1;
				var b:Number = y1;
				var c:Number = distance;
				var d:Number = Father.xPos;
				var e:Number = Father.yPos;
				var f:Number = dist;
				var newX:Number = 1 / (2 * (4 * a ^ 2 + 4 * b ^ 2 - 8 * a * d + 4 * d ^ 2 - 8 * b * e + 4 * e ^ 2)) * (4 * a ^ 3 + 4 * a * b ^ 2 - 4 * a * c ^ 2 - 4 * a ^ 2 * d + 4 * b ^ 2 * d + 4 * c ^ 2 * d - 4 * a * d ^ 2 + 4 * d ^ 3 - 8 * a * b * e - 8 * b * d * e + 4 * a * e ^ 2 + 4 * d * e ^ 2 + 4 * a * f ^ 2 - 4 * d * f ^ 2 /Math.sqrt((-4 * a ^ 3 - 4 * a * b ^ 2 + 4 * a * c ^ 2 + 4 * a ^ 2 * d - 4 * b ^ 2 * d - 4 * c ^ 2 * d + 4 * a * d ^ 2 - 4 * d ^ 3 + 8 * a * b * e + 8 * b * d * e - 4 * a * e ^ 2 - 4 * d * e ^ 2 - 4 * a * f ^ 2 + 4 * d * f ^ 2) ^ 2 - 4 * (4 * a ^ 2 + 4 * b ^ 2 - 8 * a * d + 4 * d ^ 2 - 8 * b * e + 4 * e ^ 2) * (a ^ 4 + 2 * a ^ 2 * b ^ 2 + b ^ 4 - 2 * a ^ 2 * c ^ 2 - 2 * b ^ 2 * c ^ 2 + c ^ 4 - 2 * a ^ 2 * d ^ 2 + 2 * b ^ 2 * d ^ 2 + 2 * c ^ 2 * d ^ 2 + d ^ 4 - 4 * a ^ 2 * b * e - 4 * b ^ 3 * e + 4 * b * c ^ 2 * e - 4 * b * d ^ 2 * e + 2 * a ^ 2 * e ^ 2 + 6 * b ^ 2 * e ^ 2 - 2 * c ^ 2 * e ^ 2 + 2 * d ^ 2 * e ^ 2 - 4 * b * e ^ 3 + e ^ 4 + 2 * a ^ 2 * f ^ 2 - 2 * b ^ 2 * f ^ 2 - 2 * c ^ 2 * f ^ 2 - 2 * d ^ 2 * f ^ 2 + 4 * b * e * f ^ 2 - 2 * e ^ 2 * f ^ 2 + f ^ 4)));
				var newy:Number = (1/(2*b-2*e))*(a^2+b^2-c^2-d^2-e^2-(4*a^4)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(4*a^2*b^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(4*a^2*c^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(8*a^3*d)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(8*a*c^2*d)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(4*b^2*d^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(4*c^2*d^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(8*a*d^3)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(4*d^4)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(8*a^2*b*e)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(8*b*d^2*e)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(4*a^2*e^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(4*d^2*e^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+f^2-(4*a^2*f^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+(8*a*d*f^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)-(4*d^2*f^2)/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)+1/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)*a/Math.Sqrt((-4*a^3-4*a*b^2+4*a*c^2+4*a^2*d-4*b^2*d-4*c^2*d+4*a*d^2-4*d^3+8*a*b*e+8*b*d*e-4*a*e^2-4*d*e^2-4*a*f^2+4*d*f^2)^2-4*(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)*(a^4+2*a^2*b^2+b^4-2*a^2*c^2-2*b^2*c^2+c^4-2*a^2*d^2+2b^2*d^2+2*c^2*d^2+d^4-4*a^2*b*e-4*b^3*e+4*b*c^2*e-4*b*d^2*e+2*a^2*e^2+6*b^2*e^2-2*c^2*e^2+2*d^2*e^2-4*b*e^3+e^4+2*a^2*f^2-2*b^2*f^2-2*c^2*f^2-2*d^2*f^2+4*b*e*f^2-2*e^2*f^2+f^4))-1/(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)*d/Math.Sqrt((-1*4*a^3-4*a*b^2+4*a*c^2+4*a^2*d-4*b^2*d-4*c^2*d+4*a*d^2-4*d^3+8*a*b*e+8*b*d*e-4*a*e^2-4*d*e^2-4*a*f^2+4*d*f^2)^2-4*(4*a^2+4*b^2-8*a*d+4*d^2-8*b*e+4*e^2)*(a^4+2*a^2*b^2+b^4-2*a^2*c^2-2*b^2*c^2+c^4-2*a^2*d^2+2*b^2*d^2+2*c^2*d^2+d^4-4*a^2*b*e-4*b^3*e+4*b*c^2*e-4*b*d^2*e+2*a^2*e^2+6*b^2*e^2-2*c^2*e^2+2*d^2*e^2-4*b*e^3+e^4+2*a^2*f^2-2*b^2*f^2-2*c^2*f^2-2*d^2*f^2+4*b*e*f^2-2*e^2*f^2+f^4)));

			trace(newX);
			     xPos = newX;
				img.content.x = xPos;
			    var angle:Number = (Math.atan2(y1 - img.content.y,  x1 - img.content.x) - Math.PI * 0.5) * 180 / Math.PI;
				if (angle < 180) angle += 360;
				if (angle > 180) angle -= 360;
				img.content.rotation = angle;
			
		}

		
		var Father:Joint;
		var xPos:Number;
		var yPos:Number;
		var Rotation:Number;
		var img:Loader;
		var dist:Number;
		

	}
	
}
