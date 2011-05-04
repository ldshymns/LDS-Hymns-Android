#!/usr/bin/perl

open(OUT,'>','ldshymns.download.xml') or die $!;

print OUT <<END;
<?xml version="1.0" encoding="utf-8"?>
<config version="1.1">
END

for my $f (sort glob "*.pdf") {
my $size = -s $f;
my $md5 = `md5sum $f`;
$md5 =~ s/\s.*$//s;
print OUT <<END;
  <file src="$f" dest="$f" size="$size" md5="$md5" />
END
}

print OUT <<END;
</config>
END

