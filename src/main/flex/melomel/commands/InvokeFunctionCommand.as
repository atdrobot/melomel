/*
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @author Nikita Dudnik
 */
package melomel.commands
{
import melomel.commands.ICommand;

import flash.events.EventDispatcher;
import flash.errors.IllegalOperationError;

import flash.utils.getDefinitionByName;

/**
 *	This class represents an action of invoking a method on an object.
 *	
 *	@see melomel.commands.parsers.InvokeMethodCommandParser
 */
public class InvokeFunctionCommand implements ICommand
{
	//--------------------------------------------------------------------------
	//
	//	Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 *	Constructor.
	 *	
	 *	@param object      The object to retrieve from.
	 *	@param methodName  The name of the method to invoke.
	 *	@param methodArgs  A list of arguments to pass to the method.
	 */
	public function InvokeFunctionCommand(
										functionName:String=null,
										methodArgs:Array=null)
	{
		this.functionName = functionName;
		this.methodArgs = methodArgs;
	}
	

	//--------------------------------------------------------------------------
	//
	//	Properties
	//
	//--------------------------------------------------------------------------

	/**
	 *	The name of the package level function to invoke.
	 */
	public var functionName:String;

	/**
	 *	A list of arguments to pass to the method.
	 */
	public var methodArgs:Array;


	//--------------------------------------------------------------------------
	//
	//	Methods
	//
	//--------------------------------------------------------------------------

	/**
	 *	Invokes a method on a given object. The return value of the method is
	 *	returned from the command.
	 *	
	 *	@return  The return value of the method invocation.
	 */
	public function execute():Object
	{

		// Verify function name exists
		if(functionName == null || functionName == "") {
			throw new IllegalOperationError("Function name cannot be null or blank.");
		}
		// Verify method arguments exist
		if(methodArgs == null) {
			throw new IllegalOperationError("Function arguments cannot be null.");
		}

		// Invoke method
		return flash.utils.getDefinitionByName(functionName).apply(null, methodArgs);
	}
}
}