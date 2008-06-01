package model.vo
{
	public class CallbackFunctionVO
	{
		public var name:String;
		public var fun:Function;
		public function CallbackFunctionVO($name:String, $fun:Function)
		{
			name = $name;
			fun = $fun;
		}

	}
}