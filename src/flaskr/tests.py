import unittest
from flaskr import create_app

class BlueprintTestCase(unittest.TestCase):
    def setUp(self):
        self.app = create_app().test_client()

    def test_availability(self):
        response = self.app.get('/', content_type='html/text')
        self.assertEqual(response.status_code, 200, 'test_availability expected stautscode 200 but statuscode is: ' + response.status_code)

    def test_incorrect_login(self):
        response = self.app.post('/login', data={'Nachname': 'keinRichtigerName'})
        self.assertEqual(response.status_code, 401, 'test_incorrect_login expected statuscode 401 but statuscode is: ' + response.status_code)

    def test_correct_login(self):
        response = self.app.post('/login', data={'Nachname': 'Miller'})
        self.assertEqual(response.status_code, 200, 'test_correct_login expected statuscode 200 but statuscode is: ' + response.status_code)


if __name__ == '__main__':
    unittest.main()