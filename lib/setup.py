from robot.libraries.BuiltIn import BuiltIn
import os

def directory_set_up_py():
    screenshotPath = BuiltIn().get_variable_value("${Screenshot_Path}")
    screenshotCardPath = BuiltIn().get_variable_value("${Screenshot_Card_Path}")
    if not os.path.isdir(screenshotPath):
        os.mkdir(screenshotPath)
    if not os.path.isdir(screenshotCardPath):
        os.mkdir(screenshotCardPath)