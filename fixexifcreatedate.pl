#!/usr/bin/perl
print "hello world\n";
use File::Copy qw(copy);
use File::Copy qw(copy);
use Image::ExifTool qw();
my $exifTool = new Image::ExifTool;
my $createdate = start;
my $fixyear = 0;
my $fixmonth = 0;
my $fixday = 0;
my $fixhour = 0;
my $fixminute = 0;
my $fixsecond = 0;
my $fixthousands = 0;
$inputdir = "testpics-input";
@files = <$inputdir/*.JPG>;
foreach $file (@files) {
        print $file . "\n";
        my $createdate = $exifTool->ImageInfo($file)->{CreateDate};
        print "         Create Date: ",$createdate,"\n";
        #2016:04:05 17:41:08.032
        $year = substr($createdate,0,4);
        print "         Year:",$year,"---\n";
        $month = substr($createdate,5,2);
        print "         Month:",$month,"---\n";
        $day = substr($createdate,8,2);
        print "         Day:",$day,"---\n";
        $hour = substr($createdate,11,2);
        print "         Hour:",$hour,"---\n";
        $minute = substr($createdate,14,2);
        print "         Minute:",$minute,"---\n";
        $second = substr($createdate,17,2);
        print "         Second:",$second,"---\n";
        $thousands = substr($createdate,20,3);
        print "         Thousands:",$thousands,"---\n";
        if ($thousands eq "") {
                print "         Thousands is empty - will reset to 000 \n";
                $thousands = "000";
                }
        $newyear = $year + $fixyear;
        $newmonth = $month + $fixmonth;
        $newday = $day + $fixday;
        $newhour = $hour + $fixhour;
        $newminute = $minute + $fixminute;
        $newsecond = $second + $fixsecond;
        $newthousands = $thousands + $fixthousands;
        $newcreatedate = $newyear.":".$newmonth.":".$newday." ".$newhour.":".$newminute.":".$newsecond.".".$newthousands;
        print $newcreatedate;
        $success = $exifTool->SetNewValue(CreateDate, $newcreatedate);
        $exifTool->WriteInfo($file);
}
