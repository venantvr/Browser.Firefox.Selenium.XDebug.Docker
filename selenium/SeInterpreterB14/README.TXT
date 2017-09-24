Se Interpreter lets you play back Selenium Builder scripts from the command line. Use at your own risk.

Its dependency (in lib) is Selenium, which is provided as a convenience. Selenium is also licensed under the Apache 2 license.

Instructions:
To run Interpreter from the command line, invoke

java -jar SeInterpreter.jar <path_to_selenium_2_script_json_file>

Try running

java -jar SeInterpreter.jar full_example.json

to test all supported step types.

You can configure which WebDriver you want to use by passing one of the following command-line parameters. (The default is Firefox.)

--driver=Firefox
--driver=Remote

You can then further configure these drivers by passing in parameters of the form

--driver.<key>=<value>

By default, these are passed on to the driver as capabilities, with the exception of:

Firefox:
  binary: location of the Firefox executable to use
  profile: location of the profile folder to use

Remote:
  url: remote URL to connect to

You can also add the interpreter jar to your code and create scripts by creating com.sebuilder.interpreter.Script objects. Additional step types can be added by putting classes implementing com.sebuilder.interpreter.StepType into the com.sebuilder.interpreter.steptype package. Additional drivers can be added by putting classes implementing com.sebuilder.interpreter.webdriverfactory.WebDriverFactory into com.sebuilder.interpreter.webdriverfactory. See the included source code for more details.

In case of questions, raise an issue at https://github.com/SeleniumBuilder/SeInterpreter-Java/issues or contact david.stark@zarkonnen.com.


VERSION HISTORY

b14:
- Added SwitchToWindowByIndex and SwitchToWindowByTitle.
- Support for new syntax for special keys in strings, e.g !{BACK_SPACE} to simulate the user pressing the backspace key.

b13:
- Fixed JSON format to use "step_name" instead of "step" to prevent namespace collisions.

b12:
- Support for named steps introduced in Builder 2.3.
- Updated bundled Selenium to 2.44.

b11:
- Again fixed data loading!
- Support for CSV data.

b10:
- Fixed bug where data would be ignored.
- Support for suite shared state.

b9:
- Added support for Eval.
- Added support for data-driven playback.
- Updated bundled Selenium to 2.40.0.

b8:
- Added support for MouseOverElement.
- Updated bundled Selenium to 2.35.0.

b7:
- Added support for window/frame/dialog manipulation types added in Builder 2.0.4.
- Updated bundled Selenium to 2.28.0.

b6:
- Made some API fields public.

b5:
- Added support for webdrivers other than FirefoxDriver.
- Fixed issue where driver was only close()d, not quit(), causing timeouts during remote playback.

b4:
- Added pause step.

b3:
- Upgraded Selenium to 2.25.0.
- Removed own JSON implementation, as it was conflicting with Selenium's.

b2:
- Added setElementText step and fixed semantics of sendKeysToElement. The former now clicks on, clears and then sends text to a field, while the latter omits the clear step.

b1: Initial version
