package remoting
{
	[RemoteClass(alias="remoting.Login")]
	[Bindable]
	public class Login
	{
		public var Error:Boolean;
		public var ErrorInfo:String;
		
		public function toString():String
		{
			return '[remoting.Login: Error='+Error.toString()+',ErrorInfo='+ErrorInfo+']';
		}

	}
}