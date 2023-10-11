import unittest

from app import app

class AppTestCase(unittest.TestCase):
    def test_hello_with_string(self):
        # test hello add docker rm -f $(docker ps -aq) test
        res = app.hello("Group_3!")
        self.assertEqual(res, "hello, Group_3!")

    def test_hello_with_number(self):
        # test hello
        res = app.hello(1)
        self.assertEqual(res, "hello, 1")

    def test_is_prime(self):
        # is prime 
        # rm -rf simple-api-robot
        # git clone https://github.com/G-03-6-2/Practices.git
        # cd Practices
        # robot test-calculate.robot
        res = app.is_prime(13219)
        self.assertEqual(res, "True")

if __name__ == "__main__":
    unittest.main()
