#!/usr/bin/env perl

use warnings;
use strict;
use Test::More qw/no_plan/;
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
    my $image = shift;
    my $copy = $$image;
    
    # simple blur with defaults
    Image::Blur::EZ->blur(\$copy);
    isnt(data_is_eq($image, \$copy), 1, "bmp blurred");
}

# blur a region of an image
sub test_region_blur {
}

sub data_is_eq {
    my ($one, $two) = @_;
    
    my @one_hex = map { unpack("h", $_) } (split //, $$one);
    my @two_hex = map { unpack("h", $_) } (split //, $$two);

    return eq_array(\@one_hex, \@two_hex);
}



run_tests();
