package melomel.commands
{
import org.flexunit.Assert;
import org.flexunit.async.Async;

import flash.geom.Point;

public class CreateObjectCommandTest
{
	//---------------------------------------------------------------------
	//
	//  Setup
	//
	//---------------------------------------------------------------------

	private var command:CreateObjectCommand;
	private var object:Object;
	
	[Before]
	public function setUp():void
	{
		command = new CreateObjectCommand();
	}

	[After]
	public function tearDown():void
	{
		command = null;
		object = null;
	}


	//---------------------------------------------------------------------
	//
	//  Methods
	//
	//---------------------------------------------------------------------
	
	//-----------------------------
	//  Execute
	//-----------------------------

	[Test]
	public function execute():void
	{
		command.clazz = Point;
		object = command.execute();
		Assert.assertTrue(object is Point);
	}

	[Test(expects="melomel.errors.MelomelError")]
	public function shouldThrowErrorIfMissingClassAndThrowable():void
	{
		command.clazz = null;
		command.throwable = true;
		command.execute();
	}

	[Test]
	public function shouldReturnNullIfMissingClassAndNonThrowable():void
	{
		command.clazz = null;
		command.throwable = false;
		Assert.assertNull(command.execute());
	}
}
}