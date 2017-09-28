#!C:/Strawberry1/perl/bin/perl.exe

use DBI;
use CGI qw(:standard);
use Cpanel::JSON::XS qw(encode_json decode_json);
use utf8;
use Encode;
print header('application/json');
use JSON -support_by_pp;

my $str =param("searchValue");
 
 
my $dbh =DBI->connect("dbi:SQLite:appointmentDB.db") || die "can not";
my $sql;
if($str eq ""){$sql='SELECT * FROM appointment_table';}

$sql = 'SELECT * FROM appointment_table where desc LIKE ?';
  
my $sth = $dbh->prepare($sql);
$sth->execute("$str%");
my $data_json=[];
while (my @row = $sth->fetchrow_array) {
push @{$data_json},{'date'=>$row[1],'time'=>$row[2],'desc'=>$row[3]}; #putting Result set to array of objcts
    
}

#my $json_d = JSON->new->utf8(1)->pretty(1)->encode($data_json);
#my $json_d = to_json($data_json);
#$json_d = JSON::XS->new->utf8->encode ($data_json)
#my $json_d=encode_json($data_json,{utf8=>1,pretty=>1});

my $json_d = to_json( $data_json, { utf8 => 1, pretty => 1 } ); # converting all pushed result sets to json object
print "$json_d";

