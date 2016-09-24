#!/usr/bin/env perl

use warnings;
use strict;
use Test::More qw/no_plan/;
use Digest::CRC;
use FindBin;

BEGIN { use_ok 'Image::Blur::EZ' }


sub run_tests {
    # test w/ a bmp, a format which Imager supports w/out other libs
    my $filename = "$FindBin::Bin/../images/sample.bmp";
    open my $fh, "< $filename";
    my $contents = do { local $/ = undef; <$fh> };

    test_full_blur(\$contents);
}

# blur an entire image
sub test_full_blur {
    my $contents = shift;
    my $copy = $$contents;
    
    Image::Blur::EZ->blur($copy);
    
    check_diff($contents, $copy);
}

# blur a region of an image
sub test_region_blur {
}

sub check_diff {
    my ($orig, $copy) = @_;

    # compare $orig and $copy
    # ...
}


run_tests();
