import 'package:postgres/postgres.dart';

class DatabaseService {
  // Connection parameters
  static const String _host = '192.168.1.117'; // Replace with your IP
  static const int _port = 5432;
  static const String _databaseName = 'sec_ecom';
  static const String _username = 'postgres';
  static const String _password = 'admin';

  // Create a new connection instance
  static PostgreSQLConnection createConnection() {
    return PostgreSQLConnection(
      _host,
      _port,
      _databaseName,
      username: _username,
      password: _password,
    );
  }

  // Open a connection and fetch categories
  static Future<List<Map<String, dynamic>>> fetchCategories() async {
    final connection = createConnection(); // Create a fresh connection
    try {
      await connection.open(); // Open the connection

      // Query categories table
      List<List<dynamic>> results = await connection.query(
        'SELECT title, image FROM categories ORDER BY id ASC',
      );

      // Close the connection after use
      await connection.close();

      // Return the results as a list of maps
      return results.map((row) {
        return {
          'title': row[0] as String,
          'image': row[1] as String,
        };
      }).toList();
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    } finally {
      // Ensure the connection is closed in case of errors
      if (!connection.isClosed) {
        await connection.close();
      }
    }
  }
}
