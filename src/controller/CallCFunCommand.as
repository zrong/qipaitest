package controller
{
	import model.CallProxy;
	import model.vo.CallFunctionVO;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CallCFunCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var __fun:CallFunctionVO = notification.getBody() as CallFunctionVO;
			var __cInvoker:CallProxy = facade.retrieveProxy(CallProxy.NAME) as CallProxy;
			try
			{
				var __result:* = __cInvoker.call(__fun);
				sendNotification(ApplicationFacade.CALL_C_RESULT, __result);
			}
			catch(err:Error)
			{
				sendNotification(ApplicationFacade.CALL_C_ERROR, err);
			}
		}
	}
}