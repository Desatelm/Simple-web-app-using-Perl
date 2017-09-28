#!C:/Strawberry1/perl/bin/perl.exe
use DBI;
use CGI qw(:standard -debug);

if($ENV{'REQUEST_METHOD'} eq 'POST'){ # checks if it's post request

  my $dbh =DBI->connect("dbi:SQLite:appointmentDB.db") || die "can not";
  my $date=param("date"); 
  my $time=param("time"); 
  my $desc=param("desc"); 
   

  $dbh->do("create table appointment_table(id INTEGER PRIMARY KEY,date TEXT, time TEXT, desc VARCHAR(10))");
  $dbh->do("insert into appointment_table(date,time,desc) values(?,?,?)",
		undef,
		$date, $time,$desc);

  $dbh->disconnect(); 
} 

print ("Location: http://localhost\n");      # post redirect get to the main page
print ("Content-type: text/html\n\n");
 

