#!/usr/bin/perl

open(OUT,'>','ldshymns.download.xml') or die $!;

print OUT <<END;
<?xml version="1.0" encoding="utf-8"?>
<config version="1.3">
END

for my $f (sort glob "*.pdf") {
my $size = -s $f;
my $md5 = `md5sum "$f"`;
$md5 =~ s/\s.*$//s;
$f =~ s/</&lt;/g;
$f =~ s/>/&gt;/g;
$f =~ s/"/&quot;/g;
$f =~ s/'/&apos;/g;
$f =~ s/&/&amp;/g;
print OUT <<END;
  <file src="$f" dest="$f" size="$size" md5="$md5" />
END
}

print OUT <<END;
</config>
END

