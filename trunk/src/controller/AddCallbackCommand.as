package controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import model.CallbackProxy;

	public class AddCallbackCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var _callback:CallbackProxy = facade.retrieveProxy(CallbackProxy.NAME) as CallbackProxy;
			_callback.checkAvailable();
			_callback.addCallback();
		}
	}
}