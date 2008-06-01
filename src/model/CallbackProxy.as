package model
{
	import flash.external.ExternalInterface;
	
	import model.vo.CallbackFunctionVO;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class CallbackProxy extends Proxy
	{
		public static const NAME:String = 'CallbackProxy';
		public function CallbackProxy()
		{
			super(NAME, new ArrayCollection());			
		}
		
		public function checkAvailable():void
		{
			if(!ExternalInterface.available)
			{
				sendNotification(ApplicationFacade.NO_AVAILABLE);
				trace('容器不可用');
			}
		}
		
		public function addCallback():void
		{
			addItem(new CallbackFunctionVO('fReturnNull', fReturnNull));
			addItem(new CallbackFunctionVO('fReturnString', fReturnString));
			addItem(new CallbackFunctionVO('fReturnNumber', fReturnNumber));
			addItem(new CallbackFunctionVO('fReturnInt', fReturnInt));
			addItem(new CallbackFunctionVO('fReturnBollean', fReturnBoolean));
			addItem(new CallbackFunctionVO('fReturnArray', fReturnArray));
			addItem(new CallbackFunctionVO('fReturnObject', fReturnObject));
			
			addItem(new CallbackFunctionVO('fReturnStringMore', fReturnStringMore));
			addItem(new CallbackFunctionVO('fReturnStringNoArgs', fReturnStringNoArgs));
		}
		
		public function addItem($callback:CallbackFunctionVO):void
		{
			try
			{
				ExternalInterface.addCallback($callback.name, $callback.fun);
				funs.addItem($callback);
			}
			catch(err:Error)
			{
				trace('error');
				sendNotification(ApplicationFacade.ADD_CALLBACK_ERROR, err);
			}
		}
		
		private function get funs():ArrayCollection
		{
			return data as ArrayCollection;
		}
		
		//定义被C++调用的函数
		public function fReturnNull($null:*):void
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $null, 'fReturnNull');
		}
		
		public function fReturnString($string:String):String
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $string, 'fReturnString');
			return $string;
		}
		
		public function fReturnNumber($num:Number):Number
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $num, 'fReturnNumber');
			return $num;
		}
		
		public function fReturnInt($int:int):int
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $int, 'fReturnInt');
			return $int;
		}
		
		public function fReturnBoolean($boll:Boolean):Boolean
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $boll, 'fReturnBoolean');
			return $boll;
		}
		
		public function fReturnArray($arr:Array):Array
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $arr, 'fReturnArray');
			return $arr;
		}
		
		public function fReturnObject($obj:Object):Object
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, $obj, 'fReturnObject');
			return $obj;
		}
		
		public function fReturnStringMore(...args):String
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, args, 'fReturnStringMore');
			return args.toString();
		}
		
		public function fReturnStringNoArgs():String
		{
			sendNotification(ApplicationFacade.CALLBACK_RESULT, '', 'fReturnStringNoArgs');
			return '这是一个不带参数的函数返回值';
		}
	}
}