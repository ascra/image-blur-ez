package Image::Blur::EZ;

use strict;
use warnings;
use Image::Info qw/image_info/; 
use Imager;
use Carp qw/croak/;

# ABSTRACT: blur an image or a region of an image

sub blur {
}

sub blur_region {
}

# extract image type using Image::Info 
sub _image_type {
    my ($self, $image_data) = @_;

    my $img_info = image_info $image_data;
    my $img_type = $img_info ? $img_info->{file_media_type} : '';
    (undef, $img_type) =~ m!(image\/)(\w+)!;
    
    return $img_type;
}

1;
