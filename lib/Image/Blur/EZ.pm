package Image::Blur::EZ;

use strict;
use warnings;
use Image::Info qw/image_info/; 
use Imager;
use Carp qw/croak/;

# ABSTRACT: blur an image or a region of an image

sub blur {
    my ($class, $image_data, $type, $stddev) = @_;
    
    $type ||= _image_type($image_data);
}

sub blur_region {
}

# extract image type using Image::Info 
sub _image_type {
    my ($image_data) = @_;

    my $img_info = image_info $image_data;
    my $img_type = $img_info ? $img_info->{file_media_type} : '';
    (undef, $img_type) = ($img_type =~ /(image\/)(\w+)/);
    
    return $img_type;
}

1;
