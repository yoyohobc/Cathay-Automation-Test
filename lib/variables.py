from robot.libraries.BuiltIn import BuiltIn
platform = BuiltIn().get_variable_value("${Platform}", "Android")

if platform == "Android":
    BuiltIn().import_library("AppiumLibrary")
    xpath = "xpath="
elif platform == "Web":
    BuiltIn().import_library("SeleniumLibrary")
    xpath = "xpath:"