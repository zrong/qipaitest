package view
{
	import flash.events.Event;
	
	import model.CallProxy;
	import model.CallbackProxy;
	import model.vo.CallFunctionVO;
	
	import mx.utils.ObjectUtil;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ApplicationMediator extends Mediator
	{
		public static const NAME:String = 'ApplicationMediator';
		
		private var _cInvoker:CallProxy;
		private var _callback:CallbackProxy;
		 
		public function ApplicationMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_cInvoker = facade.retrieveProxy(CallProxy.NAME) as CallProxy;
			app.cFunCB.dataProvider = _cInvoker.funs;
			app.addEventListener(QiPaiTest.CALL, callHandler);
			app.addEventListener(QiPaiTest.CHANGE, changeHandler);			
		}
		
		public function get app():QiPaiTest
		{
			return viewComponent as QiPaiTest;
		}
		
		private function callHandler(evt:Event):void
		{
			sendNotification(ApplicationFacade.CALL_C_FUNCTION, app.cFunCB.selectedItem as CallFunctionVO);
		}
		
		private function changeHandler(evt:Event):void
		{
		
		}
		
		private function showInfo($info:*):void
		{
			app.infoTA.text = ObjectUtil.toString($info);
		}
		
		private function setInfoColor($color:uint):void
		{
			app.infoTA.setStyle('color', $color);
		}
		
		override public function listNotificationInterests():Array
		{
			return [	ApplicationFacade.CALL_C_ERROR,
						ApplicationFacade.CALL_C_RESULT,
						ApplicationFacade.ADD_CALLBACK_ERROR,
						ApplicationFacade.NO_AVAILABLE,
						ApplicationFacade.CALLBACK_RESULT	];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case ApplicationFacade.CALL_C_ERROR:
					app.callbackLabel.text = '';
					setInfoColor(0xff0000);
					showInfo(notification.getBody());
					break;
				case ApplicationFacade.CALL_C_RESULT:
					app.callbackLabel.text = '';
					setInfoColor(0x000000);
					showInfo(notification.getBody());
					break;
				case ApplicationFacade.ADD_CALLBACK_ERROR:
					setInfoColor(0xb000000);
					showInfo(notification.getBody());
					break;
				case ApplicationFacade.NO_AVAILABLE:
					app.callbackLabel.text = 'swf不在正确的容器中，请在容器中运行本swf。';
					break;
				case ApplicationFacade.CALLBACK_RESULT:
					app.cFunCB.selectedIndex = -1;
					setInfoColor(0x0000000);
					app.callbackLabel.text = 'C++调用：' + notification.getType();
					showInfo(notification.getBody());
					break;
					
			}
		}	
	}
}