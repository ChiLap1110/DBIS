package JDBC;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DBISUtils {

	// Debug flag: if set to true, the "debug info" methods print to standard
	// out
	private static boolean DEBUG = false;

	// Reference to the JDBC connection

	// User(name) and password used for connecting to the DBS instance
	private static final String DB_LOGIN = "dbs11";
	private static final String DB_PASSWORD = "chilapbasti";
	private static final String DB_URL = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c";
	private static Connection theConnection = null;

	public static void setDebugFlag(boolean theDebugFlag) {

		DEBUG = theDebugFlag;

	}

	public static Connection getConnection() throws SQLException {

		// Wenn keine Connection vorhanden ist, erstelle eine Neue
		if (theConnection == null) {
			// Treiber registrieren
			System.out.println("Treiber wird registriert...");
			DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			System.out.println("Treiber registriert");
			

			// Connection aufbauen anhand der LOGIN,PW und URL-Daten
			System.out.println("Verbindung wird hergestellt..");
			Connection aConnection = DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PASSWORD);

			System.out.println("Verbindung hergestellt");
			System.out.println("------------------------------------");
			
			
			 System.out.println(" - auto commit is     : " + aConnection.getAutoCommit());
	            aConnection.setAutoCommit(false);
	            System.out.println(" - auto commit is now : " + aConnection.getAutoCommit());

	            System.out.println("... transaction parameters for connection set!");

			theConnection = aConnection;

		}
		return theConnection;

	}

	public static String decodeTransactionIsolationLevel(int transactionIsolationLevel) {

		switch (transactionIsolationLevel) {

		case Connection.TRANSACTION_NONE:
			return "No transactions supported";
		case Connection.TRANSACTION_READ_COMMITTED:
			return "Read committed";
		case Connection.TRANSACTION_READ_UNCOMMITTED:
			return "Read uncommitted";
		case Connection.TRANSACTION_REPEATABLE_READ:
			return "Repeatable read";
		case Connection.TRANSACTION_SERIALIZABLE:
			return "Serializable";
		default:
			return "Unknown trasaction isolation level";
		}

	}

	public static int printResultSet(ResultSet rset) {

		int noRows = 0;

		try {

			ResultSetMetaData rsmd = rset.getMetaData();

			while (rset.next()) {

				if (noRows == 0) {

					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						System.out.print(rsmd.getColumnName(i));
						if (i == rsmd.getColumnCount()) {
							System.out.print("\n");
						} else {
							System.out.print("\t");
						}
					}
				}

				for (int col = 1; col <= rsmd.getColumnCount(); col++) {
					System.out.print(rset.getObject(col));
					if (col == rsmd.getColumnCount()) {
						System.out.print("\n");
					} else {
						System.out.print("\t");
					}
				}

				noRows++;

			}

		} catch (SQLException se) {

			decodeAndPrintAllSQLExceptions(se);

			return -1;

		}

		if (noRows == 0) {

			System.out.println("No rows found!");

		}

		return noRows;

	}

	public static void decodeAndPrintAllSQLExceptions(SQLException anSQLException) {

		SQLException theActualSQLException = anSQLException;

		while (theActualSQLException != null) {

			decodeAndPrintSQLException(theActualSQLException);
			theActualSQLException = theActualSQLException.getNextException();

		}

	}

	public static void decodeAndPrintSQLException(SQLException se) {

		System.out.println();

		System.out.println("*** SQL exception: ***********");
		System.out.println("  - Error message     : " + se.getMessage());
		System.out.println("  - SQL state         : " + se.getSQLState());
		System.out.println("  - Vendor error code : " + se.getErrorCode());
		System.out.println("******************************");
	}

	public static String readDateFromStdIn(String aCaption) {

		while (true) {

			   String inputString = readFromStdIn(aCaption);

			try {

				// validate if input string represents a valid/correct date
				// value/format
				// date format is adjusted to 'dd.MM.yyyy', e.g., '24.12.1928'
				validateDateString(inputString, "dd/MM/yyyy");

				return inputString;

			}

			catch (Exception e) {

				System.out.println();
				System.out.println("Error: " + e.getMessage());
				System.out.println("Please provide a correct date value!");
				System.out.println();

			}

		}

	}

	public static Date validateDateString(String aDateString, String aDateFormatString) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat(aDateFormatString);

		// use strict parsing instead of lenient parsing: with strict parsing,
		// the date string must match the (simple date format) object's format
		sdf.setLenient(false);

		try {

			java.util.Date aDate = sdf.parse(aDateString);

			// printlnDebugInfo("Date string is: "+ aDateString);
			// printlnDebugInfo("Date after parsing is: "+ aDate);
			// printlnDebugInfo("Parsed date after formatting is: "+
			// sdf.format(aDate));
			// printlnDebugInfo("Date string cut is: "+
			// aDateString.substring(0,Math.min(aDateString.length(),10)));

			// cross check if parsed date's string representation is equal to
			// the given date string
			if (sdf.format(aDate).equals(aDateString.substring(0, Math.min(aDateString.length(), 10)))) {

				return aDate;

			} else {

				throw new ParseException(
						"Incorrect date (format is '" + aDateFormatString + "'): " + "\"" + aDateString + "\"", 0);

			}

		}

		catch (ParseException pe) {

			throw new ParseException(
					"Incorrect date (format is '" + aDateFormatString + "'): " + "\"" + aDateString + "\"", 0);

		}

	}

	   public static int readIntFromStdIn(String aCaption) {

	        while(true) {

	            String inputString = readFromStdIn(aCaption);

	            try {

	                return Integer.parseInt(inputString);

	            }

	            catch (Exception e) {

	                System.out.println();
	                System.out.println("Error: " + e.getMessage());
	                System.out.println("Please provide a correct integer value!");
	                System.out.println();

	            }

	        }

	    }

	public static void printlnDebugInfo() {

		if (DEBUG) {
			System.out.println();
		}

	}

	public static void printlnDebugInfo(String aDebugInfo) {

		if (DEBUG) {
			System.out.println(">>>DEBUG INFO: " + aDebugInfo);
		}

	}

	/*
	 * Print debug information to standard output if debug mode is activated
	 * (debug flag == true)
	 */
	public static void printDebugInfo(String aDebugInfo) {

		if (DEBUG) {
			System.out.print(">>>DEBUG INFO: " + aDebugInfo);
		}

	}

	public static String readFromStdIn(String aCaption) {

		BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
		String inputString;

		System.out.print(aCaption + ": ");

		try {

			inputString = stdIn.readLine();

		}

		catch (Exception e) {

			System.out.println();
			System.out.println("Error: " + e.getMessage());
			System.out.println();

			return null;

		}

		return inputString;

	}

}
