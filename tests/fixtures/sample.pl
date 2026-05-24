#!/usr/bin/env perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

require Exporter;
require "utils.pl";

package MyApp::Greeter;

sub new {
    my $class = shift;
    my $self = {name => shift // "world"};
    bless $self, $class;
    return $self;
}

sub greet {
    my $self = shift;
    my $msg = _format("hello", $self->{name});
    print $msg;
    return $msg;
}

sub _format {
    my ($greeting, $name) = @_;
    return "$greeting, $name!";
}

package MyApp::Runner;

sub run {
    my $class = shift;
    my $greeter = MyApp::Greeter->new("graphify");
    $greeter->greet();
}

1;
