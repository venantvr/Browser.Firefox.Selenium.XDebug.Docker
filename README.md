# Browser.Firefox.Selenium.XDebug.Docker

Source : https://community.microfocus.com/borland/test/silk-webdriver/b/silk-webdriver-blog/posts/firefox-55-makes-seleniumide-obsolete

Cette image embarque un navigateur Firefox (obsolète) et de quoi jouer des scripts Selenium. Afin de pouvoir rajouter un peu de logique à ces scripts, Ruby (et quelques GEMs stratégiques) sont installés. Il est préconisé d'installer l'extension Selenium-Builder à Firefox, afin de pouvoir créer ces scripts, exportables en Ruby. Pour de simples fichiers JSON, il est possible d'utiliser Selenium-Interpreter, tout simplement :

ruby *path_to_selenium_ruby_file*
java -jar SeInterpreter *path_to_selenium_json_file*

Ces images sont élaborées de façon très incrémentale.

