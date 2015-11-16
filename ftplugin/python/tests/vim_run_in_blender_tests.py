import unittest, sys, os
sys.path.append(os.path.abspath(os.path.join(__file__ ,"../..")))
import vim_run_in_blender as sut

@unittest.skip("Don't forget to test!")
class VimRunInBlenderTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.vim_run_in_blender_example()
        self.assertEqual("Happy Hacking", result)
