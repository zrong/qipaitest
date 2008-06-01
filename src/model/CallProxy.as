package model
{
	import flash.external.ExternalInterface;
	
	import model.vo.CallFunctionVO;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class CallProxy extends Proxy
	{
		public static const NAME:String = 'CInvokerProxy';
		
		public function CallProxy()
		{
			super(NAME, new ArrayCollection());
			addItem(new CallFunctionVO('cReturnNull'));
			addItem(new CallFunctionVO('cReturnString', 'flash', 'String'));
			addItem(new CallFunctionVO('cReturnNumber', 9.0115, 'Number'));
			addItem(new CallFunctionVO('cReturnInt', 9, 'Int'));
			addItem(new CallFunctionVO('cReturnBollean', true, 'Boolean'));
			addItem(new CallFunctionVO('cReturnArray', ['Flash', 'Flex', 'AIR'], 'Array'));
			addItem(new CallFunctionVO('cReturnObject', {design:'Photoshop', develop:'Flex Builder'}, 'Object'));			
		}
		
		public function get funs():ArrayCollection
		{
			return data as ArrayCollection;
		}
		
		private function addItem($item:CallFunctionVO):void
		{
			funs.addItem($item);
		}
		
		public function call($fun:CallFunctionVO):*
		{
			return ExternalInterface.call($fun.name, $fun.param);
		}
		
	}
}