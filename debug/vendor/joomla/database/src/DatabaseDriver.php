<?php
/**
 * Part of the Joomla Framework Database Package
 *
 * @copyright  Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

namespace Joomla\Database;

use Psr\Log;

/**
 * Joomla Framework Database Driver Class
 *
 * @since  1.0
 *
 * @method  string  q($text, $escape = true)  Alias for quote method
 * @method  string  qn($name, $as = null)     Alias for quoteName method
 */
abstract class DatabaseDriver implements DatabaseInterface, Log\LoggerAwareInterface
{
	/**
	 * The name of the database.
	 *
	 * @var    string
	 * @since  1.0
	 */
	private $database;

	/**
	 * The name of the database driver.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected $name;

	/**
	 * The type of the database server family supported by this driver.
	 *
	 * @var    string
	 * @since  1.4.0
	 */
	public $serverType;

	/**
	 * The database connection resource.
	 *
	 * @var    resource
	 * @since  1.0
	 */
	protected $connection;

	/**
	 * Holds the list of available db connectors.
	 *
	 * @var    array
	 * @since  1.0
	 */
	protected static $connectors;

	/**
	 * The number of SQL statements executed by the database driver.
	 *
	 * @var    integer
	 * @since  1.0
	 */
	protected $count = 0;

	/**
	 * The database connection cursor from the last query.
	 *
	 * @var    resource
	 * @since  1.0
	 */
	protected $cursor;

	/**
	 * The database driver debugging state.
	 *
	 * @var    boolean
	 * @since  1.0
	 */
	protected $debug = false;

	/**
	 * The affected row limit for the current SQL statement.
	 *
	 * @var    integer
	 * @since  1.0
	 */
	protected $limit = 0;

	/**
	 * The character(s) used to quote SQL statement names such as table names or field names,
	 * etc.
	 *
	 * The child classes should define this as necessary.  If a single character string the
	 * same character is used for both sides of the quoted name, else the first character will be
	 * used for the opening quote and the second for the closing quote.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected $nameQuote;

	/**
	 * The null or zero representation of a timestamp for the database driver.
	 *
	 * This should be defined in child classes to hold the appropriate value for the engine.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected $nullDate;

	/**
	 * The affected row offset to apply for the current SQL statement.
	 *
	 * @var    integer
	 * @since  1.0
	 */
	protected $offset = 0;

	/**
	 * Passed in upon instantiation and saved.
	 *
	 * @var    array
	 * @since  1.0
	 */
	protected $options;

	/**
	 * The current SQL statement to execute.
	 *
	 * @var    mixed
	 * @since  1.0
	 */
	protected $sql;

	/**
	 * The common database table prefix.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected $tablePrefix;

	/**
	 * True if the database engine supports UTF-8 character encoding.
	 *
	 * @var    boolean
	 * @since  1.0
	 */
	protected $utf = true;

	/**
	 * The database error number.
	 *
	 * @var    integer
	 * @since  1.0
	 */
	protected $errorNum = 0;

	/**
	 * The database error message.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected $errorMsg;

	/**
	 * DatabaseDriver instances container.
	 *
	 * @var    array
	 * @since  1.0
	 */
	protected static $instances = array();

	/**
	 * The minimum supported database version.
	 *
	 * @var    string
	 * @since  1.0
	 */
	protected static $dbMinimum;

	/**
	 * The depth of the current transaction.
	 *
	 * @var    integer
	 * @since  1.0
	 */
	protected $transactionDepth = 0;

	/**
	 * A logger.
	 *
	 * @var    Log\LoggerInterface
	 * @since  1.0
	 */
	private $logger;

	/**
	 * Get a list of available database connectors.  The list will only be populated with connectors that both
	 * the class exists and the static test method returns true.  This gives us the ability to have a multitude
	 * of connector classes that are self-aware as to whether or not they are able to be used on a given system.
	 *
	 * @return  array  An array of available database connectors.
	 *
	 * @since   1.0
	 */
	public static function getConnectors()
	{
		if (!isset(self::$connectors))
		{
			self::$connectors = array();

			// Get an iterator and loop trough the driver classes.
			$dir = __DIR__;
			$iterator = new \DirectoryIterator($dir);

			/** @var $file \DirectoryIterator */
			foreach ($iterator as $file)
			{
				// Only load for php files.
				if (!$file->isDir())
				{
					continue;
				}

				$baseName = $file->getBasename();

				// Derive the class name from the type.
				/** @var $class DatabaseDriver */
				$class = '\\Joomla\\Database\\' . ucfirst(strtolower($baseName)) . '\\' . ucfirst(strtolower($baseName)) . 'Driver';

				// If the class doesn't exist, or if it's not supported on this system, move on to the next type.
				if (!class_exists($class) || !$class::isSupported())
				{
					continue;
				}

				// Everything looks good, add it to the list.
				self::$connectors[] = $baseName;
			}
		}

		return self::$connectors;
	}

	/**
	 * Method to return a DatabaseDriver instance based on the given options.
	 *
	 * There are three global options and then the rest are specific to the database driver.  The 'driver' option defines which
	 * DatabaseDriver class is used for the connection -- the default is 'mysqli'.  The 'database' option determines which database is to
	 * be used for the connection.  The 'select' option determines whether the connector should automatically select the chosen database.
	 *
	 * Instances are unique to the given options and new objects are only created when a unique options array is
	 * passed into the method.  This ensures that we don't end up with unnecessary database connection resources.
	 *
	 * @param   array  $options  Parameters to be passed to the database driver.
	 *
	 * @return  DatabaseDriver  A database object.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public static function getInstance($options = array())
	{
		// Sanitize the database connector options.
		$options['driver']   = isset($options['driver']) ? preg_replace('/[^A-Z0-9_\.-]/i', '', $options['driver']) : 'mysqli';
		$options['database'] = isset($options['database']) ? $options['database'] : null;
		$options['select']   = isset($options['select']) ? $options['select'] : true;

		// Get the options signature for the database connector.
		$signature = md5(serialize($options));

		// If we already have a database connector instance for these options then just use that.
		if (empty(self::$instances[$signature]))
		{
			// Derive the class name from the driver.
			$class = '\\Joomla\\Database\\' . ucfirst(strtolower($options['driver'])) . '\\' . ucfirst(strtolower($options['driver'])) . 'Driver';

			// If the class still doesn't exist we have nothing left to do but throw an exception.  We did our best.
			if (!class_exists($class))
			{
				throw new Exception\UnsupportedAdapterException(sprintf('Unable to load Database Driver: %s', $options['driver']));
			}

			// Create our new DatabaseDriver connector based on the options given.
			try
			{
				$instance = new $class($options);
			}
			catch (\RuntimeException $e)
			{
				throw new Exception\ConnectionFailureException(sprintf('Unable to connect to the Database: %s', $e->getMessage()));
			}

			// Set the new connector to the global instances based on signature.
			self::$instances[$signature] = $instance;
		}

		return self::$instances[$signature];
	}

	/**
	 * Splits a string of multiple queries into an array of individual queries.
	 *
	 * @param   string  $sql  Input SQL string with which to split into individual queries.
	 *
	 * @return  array  The queries from the input string separated into an array.
	 *
	 * @since   1.0
	 */
	public static function splitSql($sql)
	{
		$start     = 0;
		$open      = false;
		$comment   = false;
		$endString = '';
		$end       = \strlen($sql);
		$queries   = array();
		$query     = '';

		for ($i = 0; $i < $end; $i++)
		{
			$current      = substr($sql, $i, 1);
			$current2     = substr($sql, $i, 2);
			$current3     = substr($sql, $i, 3);
			$lenEndString = \strlen($endString);
			$testEnd      = substr($sql, $i, $lenEndString);

			if ($current === '"' || $current === "'" || $current2 === '--'
				|| ($current2 === '/*' && $current3 !== '/*!' && $current3 !== '/*+')
				|| ($current === '#' && $current3 !== '#__')
				|| ($comment && $testEnd === $endString))
			{
				// Check if quoted with previous backslash
				$n = 2;

				while (substr($sql, $i - $n + 1, 1) === '\\' && $n < $i)
				{
					$n++;
				}

				// Not quoted
				if ($n % 2 === 0)
				{
					if ($open)
					{
						if ($testEnd === $endString)
						{
							if ($comment)
							{
								$comment = false;

								if ($lenEndString > 1)
								{
									$i += ($lenEndString - 1);
									$current = substr($sql, $i, 1);
								}

								$start = $i + 1;
							}

							$open      = false;
							$endString = '';
						}
					}
					else
					{
						$open = true;

						if ($current2 === '--')
						{
							$endString = "\n";
							$comment   = true;
						}
						elseif ($current2 === '/*')
						{
							$endString = '*/';
							$comment   = true;
						}
						elseif ($current === '#')
						{
							$endString = "\n";
							$comment   = true;
						}
						else
						{
							$endString = $current;
						}

						if ($comment && $start < $i)
						{
							$query .= substr($sql, $start, $i - $start);
						}
					}
				}
			}

			if ($comment)
			{
				$start = $i + 1;
			}

			if (($current === ';' && !$open) || $i === $end - 1)
			{
				if ($start <= $i)
				{
					$query .= substr($sql, $start, $i - $start + 1);
				}

				$query = trim($query);

				if ($query)
				{
					if (($i === $end - 1) && ($current !== ';'))
					{
						$query .= ';';
					}

					$queries[] = $query;
				}

				$query = '';
				$start = $i + 1;
			}

			$endComment = false;
		}

		return $queries;
	}

	/**
	 * Magic method to provide method alias support for quote() and quoteName().
	 *
	 * @param   string  $method  The called method.
	 * @param   array   $args    The array of arguments passed to the method.
	 *
	 * @return  mixed  The aliased method's return value or null.
	 *
	 * @since   1.0
	 */
	public function __call($method, $args)
	{
		if (empty($args))
		{
			return;
		}

		switch ($method)
		{
			case 'q':
				return $this->quote($args[0], isset($args[1]) ? $args[1] : true);
				break;

			case 'qn':
				return $this->quoteName($args[0], isset($args[1]) ? $args[1] : null);
				break;
		}
	}

	/**
	 * Magic method to access properties of the database driver.
	 *
	 * @param   string  $name  The name of the property.
	 *
	 * @return  mixed   A value if the property name is valid, null otherwise.
	 *
	 * @since       1.4.0
	 * @deprecated  1.4.0  This is a B/C proxy since $this->name was previously public
	 */
	public function __get($name)
	{
		switch ($name)
		{
			case 'name':
				return $this->getName();

			default:
				$trace = debug_backtrace();
				trigger_error(
					'Undefined property via __get(): ' . $name . ' in ' . $trace[0]['file'] . ' on line ' . $trace[0]['line'],
					E_USER_NOTICE
				);
		}
	}

	/**
	 * Constructor.
	 *
	 * @param   array  $options  List of options used to configure the connection
	 *
	 * @since   1.0
	 */
	public function __construct($options)
	{
		// Initialise object variables.
		$this->database = isset($options['database']) ? $options['database'] : '';

		$this->tablePrefix = isset($options['prefix']) ? $options['prefix'] : 'jos_';
		$this->count = 0;
		$this->errorNum = 0;

		// Set class options.
		$this->options = $options;
	}

	/**
	 * Connects to the database if needed.
	 *
	 * @return  void  Returns void if the database connected successfully.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function connect();

	/**
	 * Determines if the connection to the server is active.
	 *
	 * @return  boolean  True if connected to the database engine.
	 *
	 * @since   1.0
	 */
	abstract public function connected();

	/**
	 * Disconnects the database.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 */
	abstract public function disconnect();

	/**
	 * Drops a table from the database.
	 *
	 * @param   string   $table     The name of the database table to drop.
	 * @param   boolean  $ifExists  Optionally specify that the table must exist before it is dropped.
	 *
	 * @return  DatabaseDriver  Returns this object to support chaining.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function dropTable($table, $ifExists = true);

	/**
	 * Escapes a string for usage in an SQL statement.
	 *
	 * @param   string   $text   The string to be escaped.
	 * @param   boolean  $extra  Optional parameter to provide extra escaping.
	 *
	 * @return  string   The escaped string.
	 *
	 * @since   1.0
	 */
	abstract public function escape($text, $extra = false);

	/**
	 * Method to fetch a row from the result set cursor as an array.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  mixed  Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   1.0
	 */
	abstract protected function fetchArray($cursor = null);

	/**
	 * Method to fetch a row from the result set cursor as an associative array.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  mixed  Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   1.0
	 */
	abstract protected function fetchAssoc($cursor = null);

	/**
	 * Method to fetch a row from the result set cursor as an object.
	 *
	 * @param   mixed   $cursor  The optional result set cursor from which to fetch the row.
	 * @param   string  $class   The class name to use for the returned row object.
	 *
	 * @return  mixed   Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   1.0
	 */
	abstract protected function fetchObject($cursor = null, $class = 'stdClass');

	/**
	 * Method to free up the memory used for the result set.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 */
	abstract protected function freeResult($cursor = null);

	/**
	 * Get the number of affected rows for the previous executed SQL statement.
	 *
	 * @return  integer  The number of affected rows.
	 *
	 * @since   1.0
	 */
	abstract public function getAffectedRows();

	/**
	 * Method to get the database collation in use by sampling a text field of a table in the database.
	 *
	 * @return  mixed  The collation in use by the database or boolean false if not supported.
	 *
	 * @since   1.0
	 */
	abstract public function getCollation();

	/**
	 * Method that provides access to the underlying database connection. Useful for when you need to call a
	 * proprietary method such as PostgreSQL's lo_* methods.
	 *
	 * @return  resource  The underlying database connection resource.
	 *
	 * @since   1.0
	 */
	public function getConnection()
	{
		return $this->connection;
	}

	/**
	 * Method to get the database connection collation, as reported by the driver.
	 *
	 * If the connector doesn't support reporting this value please return an empty string.
	 *
	 * @return  string
	 *
	 * @since   1.6.0
	 */
	public function getConnectionCollation()
	{
		return '';
	}

	/**
	 * Get the total number of SQL statements executed by the database driver.
	 *
	 * @return  integer
	 *
	 * @since   1.0
	 */
	public function getCount()
	{
		return $this->count;
	}

	/**
	 * Gets the name of the database used by this conneciton.
	 *
	 * @return  string
	 *
	 * @since   1.0
	 */
	protected function getDatabase()
	{
		return $this->database;
	}

	/**
	 * Returns a PHP date() function compliant date format for the database driver.
	 *
	 * @return  string  The format string.
	 *
	 * @since   1.0
	 */
	public function getDateFormat()
	{
		return 'Y-m-d H:i:s';
	}

	/**
	 * Get the minimum supported database version.
	 *
	 * @return  string  The minimum version number for the database driver.
	 *
	 * @since   1.0
	 */
	public function getMinimum()
	{
		return static::$dbMinimum;
	}

	/**
	 * Get the name of the database driver.
	 *
	 * If $this->name is not set it will try guessing the driver name from the class name.
	 *
	 * @return  string
	 *
	 * @since   1.4.0
	 */
	public function getName()
	{
		if (empty($this->name))
		{
			$reflect = new \ReflectionClass($this);

			$this->name = strtolower(str_replace('Driver', '', $reflect->getShortName()));
		}

		return $this->name;
	}

	/**
	 * Get the server family type.
	 *
	 * If $this->serverType is not set it will attempt guessing the server family type from the driver name. If this is not possible the driver
	 * name will be returned instead.
	 *
	 * @return  string
	 *
	 * @since   1.4.0
	 */
	public function getServerType()
	{
		if (empty($this->serverType))
		{
			$name = $this->getName();

			if (stristr($name, 'mysql') !== false)
			{
				$this->serverType = 'mysql';
			}
			elseif (stristr($name, 'postgre') !== false)
			{
				$this->serverType = 'postgresql';
			}
			elseif (stristr($name, 'pgsql') !== false)
			{
				$this->serverType = 'postgresql';
			}
			elseif (stristr($name, 'oracle') !== false)
			{
				$this->serverType = 'oracle';
			}
			elseif (stristr($name, 'sqlite') !== false)
			{
				$this->serverType = 'sqlite';
			}
			elseif (stristr($name, 'sqlsrv') !== false)
			{
				$this->serverType = 'mssql';
			}
			elseif (stristr($name, 'sqlazure') !== false)
			{
				$this->serverType = 'mssql';
			}
			elseif (stristr($name, 'mssql') !== false)
			{
				$this->serverType = 'mssql';
			}
			else
			{
				$this->serverType = $name;
			}
		}

		return $this->serverType;
	}

	/**
	 * Get the null or zero representation of a timestamp for the database driver.
	 *
	 * @return  string  Null or zero representation of a timestamp.
	 *
	 * @since   1.0
	 */
	public function getNullDate()
	{
		return $this->nullDate;
	}

	/**
	 * Get the number of returned rows for the previous executed SQL statement.
	 *
	 * @param   resource  $cursor  An optional database cursor resource to extract the row count from.
	 *
	 * @return  integer   The number of returned rows.
	 *
	 * @since   1.0
	 */
	abstract public function getNumRows($cursor = null);

	/**
	 * Get the common table prefix for the database driver.
	 *
	 * @return  string  The common database table prefix.
	 *
	 * @since   1.0
	 */
	public function getPrefix()
	{
		return $this->tablePrefix;
	}

	/**
	 * Gets an exporter class object.
	 *
	 * @return  DatabaseExporter  An exporter object.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function getExporter()
	{
		// Derive the class name from the driver.
		$class = '\\Joomla\\Database\\' . ucfirst($this->name) . '\\' . ucfirst($this->name) . 'Exporter';

		// Make sure we have an exporter class for this driver.
		if (!class_exists($class))
		{
			// If it doesn't exist we are at an impasse so throw an exception.
			throw new Exception\UnsupportedAdapterException('Database Exporter not found.');
		}

		/** @var $o DatabaseExporter */
		$o = new $class;
		$o->setDbo($this);

		return $o;
	}

	/**
	 * Gets an importer class object.
	 *
	 * @return  DatabaseImporter  An importer object.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function getImporter()
	{
		// Derive the class name from the driver.
		$class = '\\Joomla\\Database\\' . ucfirst($this->name) . '\\' . ucfirst($this->name) . 'Importer';

		// Make sure we have an importer class for this driver.
		if (!class_exists($class))
		{
			// If it doesn't exist we are at an impasse so throw an exception.
			throw new Exception\UnsupportedAdapterException('Database Importer not found');
		}

		/** @var $o DatabaseImporter */
		$o = new $class;
		$o->setDbo($this);

		return $o;
	}

	/**
	 * Get the current query object or a new DatabaseQuery object.
	 *
	 * @param   boolean  $new  False to return the current query object, True to return a new DatabaseQuery object.
	 *
	 * @return  DatabaseQuery  The current query object or a new object extending the DatabaseQuery class.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function getQuery($new = false)
	{
		if ($new)
		{
			// Derive the class name from the driver.
			$class = '\\Joomla\\Database\\' . ucfirst($this->name) . '\\' . ucfirst($this->name) . 'Query';

			// Make sure we have a query class for this driver.
			if (!class_exists($class))
			{
				// If it doesn't exist we are at an impasse so throw an exception.
				throw new Exception\UnsupportedAdapterException('Database Query Class not found.');
			}

			return new $class($this);
		}

		return $this->sql;
	}

	/**
	 * Get a new iterator on the current query.
	 *
	 * @param   string  $column  An option column to use as the iterator key.
	 * @param   string  $class   The class of object that is returned.
	 *
	 * @return  DatabaseIterator  A new database iterator.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function getIterator($column = null, $class = '\\stdClass')
	{
		// Derive the class name from the driver.
		$iteratorClass = '\\Joomla\\Database\\' . ucfirst($this->name) . '\\' . ucfirst($this->name) . 'Iterator';

		// Make sure we have an iterator class for this driver.
		if (!class_exists($iteratorClass))
		{
			// If it doesn't exist we are at an impasse so throw an exception.
			throw new Exception\UnsupportedAdapterException(sprintf('class *%s* is not defined', $iteratorClass));
		}

		// Return a new iterator
		return new $iteratorClass($this->execute(), $column, $class);
	}

	/**
	 * Retrieves field information about the given tables.
	 *
	 * @param   string   $table     The name of the database table.
	 * @param   boolean  $typeOnly  True (default) to only return field types.
	 *
	 * @return  array  An array of fields by table.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function getTableColumns($table, $typeOnly = true);

	/**
	 * Shows the table CREATE statement that creates the given tables.
	 *
	 * @param   mixed  $tables  A table name or a list of table names.
	 *
	 * @return  array  A list of the create SQL for the tables.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function getTableCreate($tables);

	/**
	 * Retrieves field information about the given tables.
	 *
	 * @param   mixed  $tables  A table name or a list of table names.
	 *
	 * @return  array  An array of keys for the table(s).
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function getTableKeys($tables);

	/**
	 * Method to get an array of all tables in the database.
	 *
	 * @return  array  An array of all the tables in the database.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function getTableList();

	/**
	 * Determine whether or not the database engine supports UTF-8 character encoding.
	 *
	 * @return  boolean  True if the database engine supports UTF-8 character encoding.
	 *
	 * @since   1.0
	 */
	public function hasUtfSupport()
	{
		return $this->utf;
	}

	/**
	 * Get the version of the database connector
	 *
	 * @return  string  The database connector version.
	 *
	 * @since   1.0
	 */
	abstract public function getVersion();

	/**
	 * Method to get the auto-incremented value from the last INSERT statement.
	 *
	 * @return  mixed  The value of the auto-increment field from the last inserted row.
	 *
	 * @since   1.0
	 */
	abstract public function insertid();

	/**
	 * Inserts a row into a table based on an object's properties.
	 *
	 * @param   string  $table   The name of the database table to insert into.
	 * @param   object  $object  A reference to an object whose public properties match the table fields.
	 * @param   string  $key     The name of the primary key. If provided the object property is updated.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function insertObject($table, &$object, $key = null)
	{
		$fields = array();
		$values = array();
		$tableColumns = $this->getTableColumns($table);

		// Iterate over the object variables to build the query fields and values.
		foreach (get_object_vars($object) as $k => $v)
		{
			// Skip columns that don't exist in the table.
			if (! array_key_exists($k, $tableColumns))
			{
				continue;
			}

			// Only process non-null scalars.
			if (\is_array($v) || \is_object($v) || $v === null)
			{
				continue;
			}

			// Ignore any internal fields.
			if ($k[0] === '_')
			{
				continue;
			}

			// Prepare and sanitize the fields and values for the database query.
			$fields[] = $this->quoteName($k);
			$values[] = $this->quote($v);
		}

		// Create the base insert statement.
		$query = $this->getQuery(true);
		$query->insert($this->quoteName($table))
			->columns($fields)
			->values(implode(',', $values));

		// Set the query and execute the insert.
		$this->setQuery($query);

		if (!$this->execute())
		{
			return false;
		}

		// Update the primary key if it exists.
		$id = $this->insertid();

		if ($key && $id && \is_string($key))
		{
			$object->$key = $id;
		}

		return true;
	}

	/**
	 * Method to check whether the installed database version is supported by the database driver
	 *
	 * @return  boolean  True if the database version is supported
	 *
	 * @since   1.0
	 */
	public function isMinimumVersion()
	{
		return version_compare($this->getVersion(), static::$dbMinimum) >= 0;
	}

	/**
	 * Method to get the first row of the result set from the database query as an associative array of ['field_name' => 'row_value'].
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadAssoc()
	{
		$this->connect();

		$ret = null;

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get the first row from the result set as an associative array.
		$array = $this->fetchAssoc($cursor);

		if ($array)
		{
			$ret = $array;
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $ret;
	}

	/**
	 * Method to get an array of the result set rows from the database query where each row is an associative array
	 * of ['field_name' => 'row_value'].  The array of rows can optionally be keyed by a field name, but defaults to
	 * a sequential numeric array.
	 *
	 * NOTE: Chosing to key the result array by a non-unique field name can result in unwanted
	 * behavior and should be avoided.
	 *
	 * @param   string  $key     The name of a field on which to key the result array.
	 * @param   string  $column  An optional column name. Instead of the whole row, only this column value will be in
	 *                           the result array.
	 *
	 * @return  mixed   The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadAssocList($key = null, $column = null)
	{
		$this->connect();

		$array = array();

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get all of the rows from the result set.
		while ($row = $this->fetchAssoc($cursor))
		{
			$value = $column ? (isset($row[$column]) ? $row[$column] : $row) : $row;

			if ($key)
			{
				$array[$row[$key]] = $value;
			}
			else
			{
				$array[] = $value;
			}
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $array;
	}

	/**
	 * Method to get an array of values from the <var>$offset</var> field in each row of the result set from
	 * the database query.
	 *
	 * @param   integer  $offset  The row offset to use to build the result array.
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadColumn($offset = 0)
	{
		$this->connect();

		$array = array();

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get all of the rows from the result set as arrays.
		while ($row = $this->fetchArray($cursor))
		{
			$array[] = $row[$offset];
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $array;
	}

	/**
	 * Method to get the first row of the result set from the database query as an object.
	 *
	 * @param   string  $class  The class name to use for the returned row object.
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadObject($class = 'stdClass')
	{
		$this->connect();

		$ret = null;

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get the first row from the result set as an object of type $class.
		$object = $this->fetchObject($cursor, $class);

		if ($object)
		{
			$ret = $object;
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $ret;
	}

	/**
	 * Method to get an array of the result set rows from the database query where each row is an object.  The array
	 * of objects can optionally be keyed by a field name, but defaults to a sequential numeric array.
	 *
	 * NOTE: Choosing to key the result array by a non-unique field name can result in unwanted
	 * behavior and should be avoided.
	 *
	 * @param   string  $key    The name of a field on which to key the result array.
	 * @param   string  $class  The class name to use for the returned row objects.
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadObjectList($key = '', $class = 'stdClass')
	{
		$this->connect();

		$array = array();

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get all of the rows from the result set as objects of type $class.
		while ($row = $this->fetchObject($cursor, $class))
		{
			if ($key)
			{
				$array[$row->$key] = $row;
			}
			else
			{
				$array[] = $row;
			}
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $array;
	}

	/**
	 * Method to get the first field of the first row of the result set from the database query.
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadResult()
	{
		$this->connect();

		$ret = null;

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get the first row from the result set as an array.
		$row = $this->fetchArray($cursor);

		if ($row)
		{
			$ret = $row[0];
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $ret;
	}

	/**
	 * Method to get the first row of the result set from the database query as an array.  Columns are indexed
	 * numerically so the first column in the result set would be accessible via <var>$row[0]</var>, etc.
	 *
	 * @return  mixed  The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadRow()
	{
		$this->connect();

		$ret = null;

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get the first row from the result set as an array.
		$row = $this->fetchArray($cursor);

		if ($row)
		{
			$ret = $row;
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $ret;
	}

	/**
	 * Method to get an array of the result set rows from the database query where each row is an array.  The array
	 * of objects can optionally be keyed by a field offset, but defaults to a sequential numeric array.
	 *
	 * NOTE: Choosing to key the result array by a non-unique field can result in unwanted
	 * behavior and should be avoided.
	 *
	 * @param   string  $key  The name of a field on which to key the result array.
	 *
	 * @return  mixed   The return value or null if the query failed.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function loadRowList($key = null)
	{
		$this->connect();

		$array = array();

		// Execute the query and get the result set cursor.
		if (!($cursor = $this->execute()))
		{
			return null;
		}

		// Get all of the rows from the result set as arrays.
		while ($row = $this->fetchArray($cursor))
		{
			if ($key !== null)
			{
				$array[$row[$key]] = $row;
			}
			else
			{
				$array[] = $row;
			}
		}

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $array;
	}

	/**
	 * Logs a message.
	 *
	 * @param   string  $level    The level for the log. Use constants belonging to Psr\Log\LogLevel.
	 * @param   string  $message  The message.
	 * @param   array   $context  Additional context.
	 *
	 * @return  DatabaseDriver  Returns itself to allow chaining.
	 *
	 * @since   1.0
	 */
	public function log($level, $message, array $context = array())
	{
		if ($this->logger)
		{
			$this->logger->log($level, $message, $context);
		}

		return $this;
	}

	/**
	 * Locks a table in the database.
	 *
	 * @param   string  $tableName  The name of the table to unlock.
	 *
	 * @return  DatabaseDriver  Returns this object to support chaining.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function lockTable($tableName);

	/**
	 * Quotes and optionally escapes a string to database requirements for use in database queries.
	 *
	 * @param   array|string  $text    A string or an array of strings to quote.
	 * @param   boolean       $escape  True (default) to escape the string, false to leave it unchanged.
	 *
	 * @return  string  The quoted input string.
	 *
	 * @note    Accepting an array of strings was added in Platform 12.3.
	 * @since   1.0
	 */
	public function quote($text, $escape = true)
	{
		if (\is_array($text))
		{
			foreach ($text as $k => $v)
			{
				$text[$k] = $this->quote($v, $escape);
			}

			return $text;
		}

		return '\'' . ($escape ? $this->escape($text) : $text) . '\'';
	}

	/**
	 * Wrap an SQL statement identifier name such as column, table or database names in quotes to prevent injection
	 * risks and reserved word conflicts.
	 *
	 * @param   array|string  $name  The identifier name to wrap in quotes, or an array of identifier names to wrap in quotes.
	 *                               Each type supports dot-notation name.
	 * @param   array|string  $as    The AS query part associated to $name. It can be string or array, in latter case it has to be
	 *                               same length of $name; if is null there will not be any AS part for string or array element.
	 *
	 * @return  array|string  The quote wrapped name, same type of $name.
	 *
	 * @since   1.0
	 */
	public function quoteName($name, $as = null)
	{
		if (\is_string($name))
		{
			$quotedName = $this->quoteNameStr(explode('.', $name));

			$quotedAs = '';

			if (!\is_null($as))
			{
				$as       = (array) $as;
				$quotedAs .= ' AS ' . $this->quoteNameStr($as);
			}

			return $quotedName . $quotedAs;
		}
		else
		{
			$fin = array();

			if (\is_null($as))
			{
				foreach ($name as $str)
				{
					$fin[] = $this->quoteName($str);
				}
			}
			elseif (\is_array($name) && (\count($name) === \count($as)))
			{
				$count = \count($name);

				for ($i = 0; $i < $count; $i++)
				{
					$fin[] = $this->quoteName($name[$i], $as[$i]);
				}
			}

			return $fin;
		}
	}

	/**
	 * Quote strings coming from quoteName call.
	 *
	 * @param   array  $strArr  Array of strings coming from quoteName dot-explosion.
	 *
	 * @return  string  Dot-imploded string of quoted parts.
	 *
	 * @since   1.0
	 */
	protected function quoteNameStr($strArr)
	{
		$parts = array();
		$q = $this->nameQuote;

		foreach ($strArr as $part)
		{
			if (\is_null($part))
			{
				continue;
			}

			if (\strlen($q) === 1)
			{
				$parts[] = $q . $part . $q;
			}
			else
			{
				$parts[] = $q{0} . $part . $q{1};
			}
		}

		return implode('.', $parts);
	}

	/**
	 * This function replaces a string identifier <var>$prefix</var> with the string held is the
	 * <var>tablePrefix</var> class variable.
	 *
	 * @param   string  $sql     The SQL statement to prepare.
	 * @param   string  $prefix  The common table prefix.
	 *
	 * @return  string  The processed SQL statement.
	 *
	 * @since   1.0
	 */
	public function replacePrefix($sql, $prefix = '#__')
	{
		$escaped = false;
		$startPos = 0;
		$quoteChar = '';
		$literal = '';

		$sql = trim($sql);
		$n = \strlen($sql);

		while ($startPos < $n)
		{
			$ip = strpos($sql, $prefix, $startPos);

			if ($ip === false)
			{
				break;
			}

			$j = strpos($sql, "'", $startPos);
			$k = strpos($sql, '"', $startPos);

			if (($k !== false) && (($k < $j) || ($j === false)))
			{
				$quoteChar = '"';
				$j = $k;
			}
			else
			{
				$quoteChar = "'";
			}

			if ($j === false)
			{
				$j = $n;
			}

			$literal .= str_replace($prefix, $this->tablePrefix, substr($sql, $startPos, $j - $startPos));
			$startPos = $j;

			$j = $startPos + 1;

			if ($j >= $n)
			{
				break;
			}

			// Quote comes first, find end of quote
			while (true)
			{
				$k = strpos($sql, $quoteChar, $j);
				$escaped = false;

				if ($k === false)
				{
					break;
				}

				$l = $k - 1;

				while ($l >= 0 && $sql{$l} === '\\')
				{
					$l--;
					$escaped = !$escaped;
				}

				if ($escaped)
				{
					$j = $k + 1;
					continue;
				}

				break;
			}

			if ($k === false)
			{
				// Error in the query - no end quote; ignore it
				break;
			}

			$literal .= substr($sql, $startPos, $k - $startPos + 1);
			$startPos = $k + 1;
		}

		if ($startPos < $n)
		{
			$literal .= substr($sql, $startPos, $n - $startPos);
		}

		return $literal;
	}

	/**
	 * Renames a table in the database.
	 *
	 * @param   string  $oldTable  The name of the table to be renamed
	 * @param   string  $newTable  The new name for the table.
	 * @param   string  $backup    Table prefix
	 * @param   string  $prefix    For the table - used to rename constraints in non-mysql databases
	 *
	 * @return  DatabaseDriver  Returns this object to support chaining.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function renameTable($oldTable, $newTable, $backup = null, $prefix = null);

	/**
	 * Select a database for use.
	 *
	 * @param   string  $database  The name of the database to select for use.
	 *
	 * @return  boolean  True if the database was successfully selected.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function select($database);

	/**
	 * Sets the database debugging state for the driver.
	 *
	 * @param   boolean  $level  True to enable debugging.
	 *
	 * @return  boolean  The old debugging level.
	 *
	 * @since   1.0
	 */
	public function setDebug($level)
	{
		$previous = $this->debug;
		$this->debug = (bool) $level;

		return $previous;
	}

	/**
	 * Sets the SQL statement string for later execution.
	 *
	 * @param   mixed    $query   The SQL statement to set either as a Query object or a string.
	 * @param   integer  $offset  The affected row offset to set.
	 * @param   integer  $limit   The maximum affected rows to set.
	 *
	 * @return  DatabaseDriver  This object to support method chaining.
	 *
	 * @since   1.0
	 */
	public function setQuery($query, $offset = 0, $limit = 0)
	{
		$this->sql = $query;
		$this->limit = (int) max(0, $limit);
		$this->offset = (int) max(0, $offset);

		return $this;
	}

	/**
	 * Sets a logger instance on the object
	 *
	 * @param   Log\LoggerInterface  $logger  A PSR-3 compliant logger.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 */
	public function setLogger(Log\LoggerInterface $logger)
	{
		$this->logger = $logger;
	}

	/**
	 * Set the connection to use UTF-8 character encoding.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   1.0
	 */
	abstract public function setUtf();

	/**
	 * Method to commit a transaction.
	 *
	 * @param   boolean  $toSavepoint  If true, commit to the last savepoint.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function transactionCommit($toSavepoint = false);

	/**
	 * Method to roll back a transaction.
	 *
	 * @param   boolean  $toSavepoint  If true, rollback to the last savepoint.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function transactionRollback($toSavepoint = false);

	/**
	 * Method to initialize a transaction.
	 *
	 * @param   boolean  $asSavepoint  If true and a transaction is already active, a savepoint will be created.
	 *
	 * @return  void
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function transactionStart($asSavepoint = false);

	/**
	 * Method to truncate a table.
	 *
	 * @param   string  $table  The table to truncate
	 *
	 * @return  void
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function truncateTable($table)
	{
		$this->setQuery('TRUNCATE TABLE ' . $this->quoteName($table));
		$this->execute();
	}

	/**
	 * Updates a row in a table based on an object's properties.
	 *
	 * @param   string   $table   The name of the database table to update.
	 * @param   object   $object  A reference to an object whose public properties match the table fields.
	 * @param   array    $key     The name of the primary key.
	 * @param   boolean  $nulls   True to update null fields or false to ignore them.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	public function updateObject($table, &$object, $key, $nulls = false)
	{
		$fields = array();
		$where = array();
		$tableColumns = $this->getTableColumns($table);

		if (\is_string($key))
		{
			$key = array($key);
		}

		if (\is_object($key))
		{
			$key = (array) $key;
		}

		// Create the base update statement.
		$statement = 'UPDATE ' . $this->quoteName($table) . ' SET %s WHERE %s';

		// Iterate over the object variables to build the query fields/value pairs.
		foreach (get_object_vars($object) as $k => $v)
		{
			// Skip columns that don't exist in the table.
			if (! array_key_exists($k, $tableColumns))
			{
				continue;
			}

			// Only process scalars that are not internal fields.
			if (\is_array($v) || \is_object($v) || $k[0] === '_')
			{
				continue;
			}

			// Set the primary key to the WHERE clause instead of a field to update.
			if (\in_array($k, $key, true))
			{
				$where[] = $this->quoteName($k) . ($v === null ? ' IS NULL' : ' = ' . $this->quote($v));
				continue;
			}

			// Prepare and sanitize the fields and values for the database query.
			if ($v === null)
			{
				// If the value is null and we want to update nulls then set it.
				if ($nulls)
				{
					$val = 'NULL';
				}
				else
				// If the value is null and we do not want to update nulls then ignore this field.
				{
					continue;
				}
			}
			else
			// The field is not null so we prep it for update.
			{
				$val = $this->quote($v);
			}

			// Add the field to be updated.
			$fields[] = $this->quoteName($k) . '=' . $val;
		}

		// We don't have any fields to update.
		if (empty($fields))
		{
			return true;
		}

		// Set the query and execute the update.
		$this->setQuery(sprintf($statement, implode(',', $fields), implode(' AND ', $where)));

		return $this->execute();
	}

	/**
	 * Execute the SQL statement.
	 *
	 * @return  mixed  A database cursor resource on success, boolean false on failure.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function execute();

	/**
	 * Unlocks tables in the database.
	 *
	 * @return  DatabaseDriver  Returns this object to support chaining.
	 *
	 * @since   1.0
	 * @throws  \RuntimeException
	 */
	abstract public function unlockTables();
}
