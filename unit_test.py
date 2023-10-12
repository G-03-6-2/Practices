import unittest

from app import app

class AppTestCase(unittest.TestCase):
    def test_hello_with_string(self):
        # test hello test
        res = app.hello("Group_3!")
        self.assertEqual(res, "hello, Group_3!")

    def test_hello_with_number(self):
        # test hello
        res = app.hello(1)
        self.assertEqual(res, "hello, 1")

    def test_is_prime(self):
        # is prime test 
        res = app.is_prime(13219)
        self.assertEqual(res, "True")

    def is_next(self):
        # is prime test 
        res = app.is_next(-5)
        self.assertEqual(res, -3)
        
if __name__ == "__main__":
    unittest.main()
