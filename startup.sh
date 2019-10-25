set -e
echo "Updating required packages through requirements.txt"
pip install -r requirements.txt

echo "Attempting to run migations with python manage.py migrate"
until python manage.py migrate; do
  >&2 echo "Database is unavailable - sleeping"
  sleep 6
done
echo "Migrations have completed."

echo "Running python manage.py runsslserver 0.0.0.0:8000"
python manage.py runserver 0.0.0.0:8000