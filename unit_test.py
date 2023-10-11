import unittest

from app import app

class AppTestCase(unittest.TestCase):
    def test_hello_with_string(self):
        # test hello add docker rm -f $(docker ps -aq) s
        res = app.hello("Group_3!")
        self.assertEqual(res, "hello, Group_3!")

    def test_hello_with_number(self):
        # test hello
        res = app.hello(1)
        self.assertEqual(res, "hello, 1")

if __name__ == "__main__":
    unittest.main()
