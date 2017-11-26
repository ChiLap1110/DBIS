package JDBC;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBISJDBC {

	private static Connection theConnection = null;

	public static void main(String[] args) {

		try {
			theConnection = DBISUtils.getConnection();

		} catch (SQLException e) {
			DBISUtils.decodeAndPrintAllSQLExceptions(e);
			e.printStackTrace();
		}
		showTopMenu();

	}

	public static void showTopMenu() {
		System.out.println();
		System.out.println("Welche Operation wollen Sie durchführen ?");
		System.out.println("-----------------------------------------");

		System.out.println("1) Kunde hinzufügen ");
		System.out.println("2) Kunde suchen");
		System.out.println("3) Reservieren oder Buchen einer Ferienwohnung");
		System.out.println("4) Löschen einer Reservierung oder Buchung");
		System.out.println();

		int zahl = DBISUtils.readIntFromStdIn("Option");
		switch (zahl) {
		case 1:
			addCustomer();
			break;
		case 2:
			sucheKunden();
			break;
		case 3:
			belegKunden();
			break;
		case 4:
			deleteBelegung();
			showBelegung();
			break;
		default:
			System.out.println("ungültige Option");
			break;

		}

	}

	public static void addCustomer() {

		System.out.println("Kunde hinzufügen");
		System.out.println("----------------");

		System.out.println("Bankdaten des Kunden: ");

		// Bank
		int blz = DBISUtils.readIntFromStdIn("BLZ");
		String KONTONR = DBISUtils.readFromStdIn("Kontonr");
		String BANK = DBISUtils.readFromStdIn("BANK");
		String bic = DBISUtils.readFromStdIn("BIC");
		String iban = DBISUtils.readFromStdIn("IBAN");

		System.out.println("Adresse des Kunden: ");

		// Adresse
		String strasse = DBISUtils.readFromStdIn("Strasse");
		String hausnummer = DBISUtils.readFromStdIn("Hausnummer");
		String PLZ = DBISUtils.readFromStdIn("PLZ");
		zeigeOrte();
		Scanner s = new Scanner(System.in);
		System.out.println("Orts_ID");
		int OrtsID = s.nextInt();
		int adressID = DBISUtils.readIntFromStdIn("Adress_ID");

		System.out.println("Daten des Kunden: ");

		// Kunde
		String vorname = DBISUtils.readFromStdIn("Vorname");
		String name = DBISUtils.readFromStdIn("Name");
		int kundennummer = DBISUtils.readIntFromStdIn("Kundennummer");
		String gebdatum = DBISUtils.readDateFromStdIn("Geburtsdatum");
		String telefonnummer = DBISUtils.readFromStdIn("Telefonnummer");
		String email = DBISUtils.readFromStdIn("E_Mail");

		try {

			// Adresse einfügen
			Statement stmt = theConnection.createStatement();
			String sqlString = "INSERT INTO ADRESSE (ADRESS_ID,Strasse,Hausnummer,PLZ,Orts_ID)" + "values(" + adressID
					+ ",'" + strasse + "','" + hausnummer + "'," + PLZ + ",'" + OrtsID + "')";

			// BV einfügen
			String sqlString0 = "INSERT INTO BANKVERBINDUNG(IBAN,BLZ,KontoNr,Bank,BIC)" + "values('" + iban + "'," + blz
					+ ",'" + KONTONR + "','" + BANK + "','" + bic + "')";
			// Kunde einfügen
			String sqlString1 = "INSERT INTO KUNDE (Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail)"
					+ "values(" + kundennummer + ",'" + gebdatum + "','" + iban + "'," + adressID + ",'" + telefonnummer
					+ "','" + vorname + "','" + name + "','" + email + "')";

			DBISUtils.printlnDebugInfo("SQL statement is:");
			DBISUtils.printlnDebugInfo(sqlString1);

			// Statements abschicken
			int affectedRows = stmt.executeUpdate(sqlString);
			affectedRows += stmt.executeUpdate(sqlString0);
			affectedRows += stmt.executeUpdate(sqlString1);

			theConnection.commit();
			stmt.close();
			// Wenn 3 Zeilen betroffen sind, dann wurde es erfolgreich
			// durchgeführt
			if (affectedRows == 3) {
				System.out.println("Der Kunde  " + vorname + " " + name + " wurde hinzugefuegt.");
			} else {
				System.out.println("Der Kunde " + vorname + " " + name + " konnte nicht hinzugefuegt werden.");
			}

		} catch (SQLException e) {

			DBISUtils.decodeAndPrintAllSQLExceptions(e);
			try {
				theConnection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		}

	}

	public static int zeigeOrte() {

		try {

			Statement stmt = theConnection.createStatement();

			String sqlString = "SELECT Orts_ID , Name " + "FROM Ort";

			DBISUtils.printlnDebugInfo("SQL statement is:");
			DBISUtils.printlnDebugInfo(sqlString);

			ResultSet rs = stmt.executeQuery(sqlString);

			int rowCount = DBISUtils.printResultSet(rs);

			stmt.close();
			rs.close();
			// commit the transaction
			theConnection.commit();

			// DBISUtils.printlnDebugInfo();
			DBISUtils.printlnDebugInfo("Transaction committed!");

			return rowCount;

		} catch (SQLException se) {

			DBISUtils.decodeAndPrintAllSQLExceptions(se);

			return -1;

		}

	}

	public static int showKunde() {

		try {

			Statement stmt = theConnection.createStatement();

			String sqlString = "SELECT Kundennummer, Vorname, Name " + "FROM Kunde";

			DBISUtils.printlnDebugInfo("SQL statement is:");
			DBISUtils.printlnDebugInfo(sqlString);

			ResultSet rs = stmt.executeQuery(sqlString);

			int rowCount = DBISUtils.printResultSet(rs);

			stmt.close();
			rs.close();
			// commit the transaction
			theConnection.commit();

			// DBISUtils.printlnDebugInfo();
			DBISUtils.printlnDebugInfo("Transaction committed!");

			return rowCount;

		} catch (SQLException se) {

			DBISUtils.decodeAndPrintAllSQLExceptions(se);

			return -1;

		}

	}

	public static int showFewo() {

		try {

			Statement stmt = theConnection.createStatement();

			String sqlString = "SELECT Ferienwohnungsnummer " + "FROM Ferienwohnung";

			DBISUtils.printlnDebugInfo("SQL statement is:");
			DBISUtils.printlnDebugInfo(sqlString);

			ResultSet rs = stmt.executeQuery(sqlString);

			int rowCount = DBISUtils.printResultSet(rs);

			stmt.close();
			rs.close();
			// commit the transaction
			theConnection.commit();

			// DBISUtils.printlnDebugInfo();
			DBISUtils.printlnDebugInfo("Transaction committed!");

			return rowCount;

		} catch (SQLException se) {

			DBISUtils.decodeAndPrintAllSQLExceptions(se);

			return -1;

		}

	}

	public static int sucheKunden() {

		System.out.println("Kunde suchen");
		String vorname = DBISUtils.readFromStdIn("Vorname");
		String name = DBISUtils.readFromStdIn("Nachname");

		String sql = "SELECT * FROM Kunde WHERE Vorname = '" + vorname + "' and name = '" + name + "'";
		Statement stmt;
		try {
			stmt = theConnection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int rowCount = DBISUtils.printResultSet(rs);
rs.close();
stmt.close();
theConnection.commit();
			return rowCount;
		} catch (SQLException e) {
			DBISUtils.decodeAndPrintAllSQLExceptions(e);

			return -1;
		}

	}

	public static void belegKunden() {

		System.out.println("Belegung oder Reservierung einer Ferienwohnung");
		showKunde();
		int kundennummer = DBISUtils.readIntFromStdIn("Kundennummer auswählen");
		showFewo();

		int Ferienwohnungsnummer = DBISUtils.readIntFromStdIn("Ferienwohnungsnummer auswählen");

		String von = DBISUtils.readDateFromStdIn("von (DD/MM/YY)");
		String bis = DBISUtils.readDateFromStdIn("bis (DD/MM/YY)");

		// System.out.println("Ferienwohnungen, die in dem Zeitraum " + von + "
		// bis " + bis + " noch frei sind");

		String sql = " SELECT f.Ferienwohnungsnummer from Ferienwohnung f WHERE f.Ferienwohnungsnummer="
				+ Ferienwohnungsnummer + "" + "AND f.Ferienwohnungsnummer NOT IN"
				+ "(SELECT f.Ferienwohnungsnummer from Belegung b "
				+ "WHERE b.Ferienwohnungsnummer = f.Ferienwohnungsnummer AND" + "(b.von <" + "'" + bis + "' "
				+ "AND b.bis >" + "'" + von + "'" + "))";

		try {

			Statement stmt = theConnection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int rowCount = DBISUtils.printResultSet(rs);
			// System.out.println(rowCount);
			if (rowCount >= 1) {
				System.out.println("Die Ferienwohnung ist verfügbar!");
				System.out.println("Sie haben 3 Optionen: Buchen(1),Reservieren(2),Vorgang abbrechen(3)");
				int zahl = DBISUtils.readIntFromStdIn("Option");
				switch (zahl) {
				case 1:
					String sql1 = "INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values ("
							+ "(SELECT MAX(a) FROM (SELECT MAX(Belegungsnummer) AS a FROM stornierteBuchungen UNION SELECT MAX(Belegungsnummer) AS a FROM Belegung)) +1"
							+ ",CURRENT_DATE,'gebucht'," + "'" + von
							+ "'," + "'" + bis + "'," + Ferienwohnungsnummer + "," + kundennummer + ")";
					
					int rows = stmt.executeUpdate(sql1);
					theConnection.commit();
					// DBISUtils.printlnDebugInfo();
					DBISUtils.printlnDebugInfo("Transaction committed!");
					if (rows == 1) {
						System.out.println("Der Kunde hat die Ferienwohnung erfolgreich gebucht");
					} else {
						System.out.println("Ein Problem bei der Reservierung ist aufgetreten");
					}

					break;
				case 2:
					String sql2 = "INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values ("
							+ "(SELECT MAX(a) FROM (SELECT MAX(Belegungsnummer) AS a FROM stornierteBuchungen UNION SELECT MAX(Belegungsnummer) AS a FROM Belegung)) +1"
							+ ",CURRENT_DATE,'reserviert'," + "'" + von
							+ "'," + "'" + bis + "'," + Ferienwohnungsnummer + "," + kundennummer + ")";
					int rows2 = stmt.executeUpdate(sql2);
					theConnection.commit();
					// DBISUtils.printlnDebugInfo();
					DBISUtils.printlnDebugInfo("Transaction committed!");
					if (rows2 == 1) {
						System.out.println("Der Kunde hat die Ferienwohnung erfolgreich reserviert");
					} else {
						System.out.println("Ein Problem bei der Reservierung ist aufgetreten");
					}
					break;
				case 3:
					System.out.println("Vorgang abgerbrochen");
					break;

				default:
					System.out.println("Ungültige Eingabe");
					break;
				}
			} else {
				System.out.println("Diese Ferienwohnung ist leider belegt");
			}
			
			stmt.close();
			rs.close();

		} catch (SQLException e) {
			DBISUtils.decodeAndPrintAllSQLExceptions(e);
			try {
				theConnection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		}

	}

	public static int showBelegung() {
		String sql = "SELECT Belegungsnummer,Statusflag FROM BELEGUNG";
		Statement stmt;
		try {
			stmt = theConnection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int row = DBISUtils.printResultSet(rs);
			rs.close();
			stmt.close();
			return row;
		} catch (SQLException e) {
			DBISUtils.decodeAndPrintAllSQLExceptions(e);
			return -1;
		}

	}

	public static void deleteBelegung() {
		System.out.println("Entfernen einer vorhandenen Reservierung oder Buchung");
		showBelegung();
		int belegungsnummer = DBISUtils.readIntFromStdIn("Belegungsnummer,die gelöscht werden soll");

		String sql = "DELETE FROM BELEGUNG WHERE BELEGUNGSNUMMER =" + belegungsnummer;

		try {
			Statement stmt = theConnection.createStatement();
			// mit rows werden die anzahl der betroffenen zeilen gezählt;
			int rows = stmt.executeUpdate(sql);
			theConnection.commit();
			// DBISUtils.printlnDebugInfo();
			DBISUtils.printlnDebugInfo("Transaction committed!");
			if (rows == 1) {
				System.out.println("Die Belegung wurde erfolgreich gelöscht");
			} else {
				System.out.println("Die Belegung is nicht vorhandnen");
			}
			
			stmt.close(); 
		} catch (SQLException e) {
			DBISUtils.decodeAndPrintAllSQLExceptions(e);

		}

	}

}
