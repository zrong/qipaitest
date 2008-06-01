package model.vo
{
	[Bindable]
	public class CallFunctionVO
	{
		public var name:String;
		public var param:*;
		public var type:String;
		
		public function CallFunctionVO($name:String, $param:*=null, $type:String='Null')
		{
			name = $name;
			param = $param;
			type = $type;
		}
	}
}