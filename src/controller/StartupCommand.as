package controller
{
	import model.CallProxy;
	import model.CallbackProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.ApplicationMediator;

	public class StartupCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var __app:* = notification.getBody();
			
			facade.registerProxy(new CallProxy());
			facade.registerProxy(new CallbackProxy());
			
			facade.registerMediator(new ApplicationMediator(__app));
			
			sendNotification(ApplicationFacade.ADD_CALLBACK);
		}
	}
}