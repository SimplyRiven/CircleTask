package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author SimplyRiven
	 */
	public class Main extends Sprite 
	{
		
		private var circle:Sprite;
		private var circleD:Sprite;
		private var squareRight:Sprite = new Sprite;
		private var circleArray:Array = new Array();
		private var points:int;
		private var totalPoints:int;
		private var totalDeaths:int;
		private var circlesGenerated:int;
		private var xVelocity:int = 5;
		private var changeDirection:Boolean;
		private var changeDirectionY:Boolean;
		private var circleAmount:int = 0;
		private var facts:TextField = new TextField();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			createCircles();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, sceneCircle);
			stage.addEventListener(MouseEvent.CLICK, clickCircle);
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			facts.text = "Points: " + points + "\n" + "Total points: " + totalPoints + "\n" + "Times died: " + totalDeaths + "\n" + "Circles generated: " + circlesGenerated;
			facts.border = true;
			facts.width = 200;
			facts.x = 520;
			addChild(facts);
		}
		
		private function createCircles():void
		{
			while (circleArray.length > 0)
			{
				removeChild(circleArray[0]);
				circleArray.shift();
			}
			
			circleD = new Sprite();
			circleD.graphics.beginFill (Math.random() * 0xffffff);
			circleD.graphics.drawCircle(0, 0, 20);
			circleD.graphics.endFill();
			circleD.x = (Math.random() * 500);
			circleD.y = (Math.random() * 500);
			circleD.x += (Math.random() * 10);
			circleArray.push(circleD);
			addChild(circleD);
			
			
			for (circleAmount = 0; circleAmount < 19; circleAmount++)
			{
				points = 0;
				facts.text = "Points: " + points + "\n" + "Total points: " + totalPoints + "\n" + "Times died: " + totalDeaths + "\n" + "Circles generated: " + circlesGenerated;
				circle = new Sprite();
				circle.graphics.beginFill (Math.random() * 0xffffff);
				circle.graphics.drawCircle (0, 0, 20);
				circle.graphics.endFill();
				circle.x = 50 + (Math.random() * 450);
				circle.y = 50 + (Math.random() * 450);
				circleArray.push(circle);
				addChild(circle);
			}
			
		}
		
		private function clickCircle(e:MouseEvent):void
		{
			for (var i:int = 0; i < circleArray.length; i++) {
				if (e.target == circleArray[i])
				{
					removeChild(circleArray[i]);
					circleArray.splice(i, 1);
					points++;
					totalPoints++;
					facts.text = "Points: " + points + "\n" + "Total points: " + totalPoints + "\n" + "Times died: " + totalDeaths + "\n" + "Circles generated: " + circlesGenerated;
				}
			}
			
			if (e.target == circleD)
			{
				totalDeaths++;
				points--;
				totalPoints--;
				facts.text = "Points: " + points + "\n" + "Total points: " + totalPoints + "\n" + "Times died: " + totalDeaths + "\n" + "Circles generated: " + circlesGenerated;
				
				while (circleArray.length > 0)
				{
					removeChild(circleArray[0]);
					circleArray.shift();
				}
			}
		}
		
		private function sceneCircle(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				circlesGenerated += 20;
				facts.text = "Points: " + points + "\n" + "Total points: " + totalPoints + "\n" + "Times died: " + totalDeaths + "\n" + "Circles generated: " + circlesGenerated;
				createCircles();
			}
		}
		
		private function gameLoop(e:Event):void 
		{
			for (var i:int = 0; i < circleArray.length; i++) {
				circleArray[i].x += (Math.random() * 1);
				circleArray[i].x -= (Math.random() * 1);
				circleArray[i].y += (Math.random() * 1);
				circleArray[i].y -= (Math.random() * 1);
			}
			
			//Experiment om att byta positiv hastighet till negativ, aka: byta riktning.
			/*if (circleD.x > 500)
			{
				changeDirection = true;
			}
			else if (circleD.x < 20)
			{
				changeDirection = false;
			}
			
			if (changeDirection)
			{
				circleD.x -= 8;
			} 
			else if (!changeDirection) 
			{
				circleD.x += 7;
			}
			
			if (circleD.y > 500)
			{
				changeDirectionY = true;
			}
			else if (circleD.y < 20)
			{
				changeDirectionY = false;
			}
			
			if (changeDirectionY)
			{
				circleD.y -= 6;
			} 
			else if (!changeDirectionY) 
			{
				circleD.y += 9;
			}*/
		}
		
	}
	
}