<?php 
	
use Joomla\Application\AbstractApplication;
use Joomla\Input\Input;
use Joomla\Registry\Registry;

class MyApplication extends AbstractApplication
{
	/**
	 * Customer constructor for my application class.
	 *
	 * @param   Input     $input
	 * @param   Registry  $config
	 *
	 * @since   1.0
	 */
	public function __construct(Input $input = null, Registry $config = null, $foo)
	{
		// Do some extra assignment.
		$this->foo = $foo;

		// Call the parent constructor last of all.
		parent::__construct($input, $config);
	}

	/**
	 * Method to run the application routines.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 */
	protected function doExecute()
	{
		try
		{
			// Do stuff.
		}
		catch(\Exception $e)
		{
			// Set status header of exception code and response body of exception message
			$this->setHeader('status', $e->getCode() ?: 500);
			$this->setBody($e->getMessage());
		}
	}

	/**
	 * Custom initialisation for my application.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 */
	protected function initialise()
	{
		// Do stuff.
		// Note that configuration has been loaded.
	}
	
	function enqueueMessage($msg,$error = ''){
		echo $msg.'<br>';
	}
}