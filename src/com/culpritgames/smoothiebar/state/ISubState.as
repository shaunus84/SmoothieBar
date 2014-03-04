package com.culpritgames.smoothiebar.state
{
	import com.culpritgames.smoothiebar.state.IState;

	/**
	 * @author shaunmitchell
	 */
	public interface ISubState extends IState
	{
		function get pausesBaseState() : Boolean;
	}
}
