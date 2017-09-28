Tools,Technologies and libraries
Strawberry Perl
wamp server for apache
bootstrap
Jquery
Ajax
Environmental Configuration
I used apache which is embedded inside wamp server.
In apache installation path which is find C:\wamp\bin\apache\apache2.4.27\conf\httpd.conf

Add ExecCGI to this line.
Options Indexes Follow SymLinks ExecCGI

Next, search for the following and uncomment
#AddHandler cgi-script .cgi and replace it with.
AddHandler cgi-script .cgi .pl

Modify the DirectoryIndex file to html format in such a way
DirectoryIndex: sets the file that Apache will serve if a directory

# is requested.
#
<IfModule dir_module>
DirectoryIndex index.html index.htm index.php index.php3   index.cgi index.pl
</IfModule>

//for a quick reference I have also put httpd.conf file inside my project directory

-- index.html should be put in www folder in wamp installation path(replace existing index file)
and also js folder
-- perl scripts (search.pl and creatAppt.pl) should be put in cgi-bin folder in wamp installation
path.
