package
{
	import controller.AddCallbackCommand;
	import controller.CallCFunCommand;
	import controller.StartupCommand;
	
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends Facade
	{
		public static const STARTUP:String = 'startup';
		
		public static const CALL_C_FUNCTION:String = 'callCFun';
		public static const CALL_C_RESULT:String = 'callCResult';
		public static const CALL_C_ERROR:String = 'callCError';
		
		public static const NO_AVAILABLE:String = 'noAvailable';
		public static const ADD_CALLBACK_ERROR:String = 'addCallbackError';
		public static const CALLBACK_RESULT:String = 'callbackResult';
		
		public static const ADD_CALLBACK:String = 'addCallback';
		
		public static function getInstance():ApplicationFacade
		{
			if(instance == null) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			registerCommand(CALL_C_FUNCTION, CallCFunCommand);
			registerCommand(ADD_CALLBACK, AddCallbackCommand);
		}
		
		public function startup($app:*):void
		{
			sendNotification(STARTUP, $app);
		}
	}
}