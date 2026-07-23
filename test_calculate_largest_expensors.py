import pytest
import trino
@pytest.fixture(scope="module")

def trino_connection():
  conn = trino.dbapi.connect
  (
    host="localhost",
    port=8080,
    user="test_user",
    catalog="memory",
    schema="default",)
yield conn
conn.close()
def load_sql_query(filepath):
  with open(filepath, "r") as file:
    return file.read()
def test_largest_expensors_threshold(trino_connection):
  cursor = trino_connection.cursor()
query = load_sql_query("calculate_largest_expensors.sql")
cursor.execute(query)
results = cursor.fetchall()
for row in results:
  total_expensed = float(row[4])
assert total_expensed > 1000.00, f"Expected > 1000, got {total_expensed}"
def test_largest_expensors_ordering(trino_connection):
  cursor = trino_connection.cursor()
query = load_sql_query("calculate_largest_expensors.sql")
cursor.execute(query)
results = cursor.fetchall()
    amounts = [float(row[4]) for row in results]
assert amounts == sorted(amounts, reverse=True), "Results are not sorted descending!"
