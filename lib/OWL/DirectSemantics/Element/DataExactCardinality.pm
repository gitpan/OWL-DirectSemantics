package OWL::DirectSemantics::Element::DataExactCardinality;

use 5.008;
use common::sense;

our $VERSION;
BEGIN { $VERSION = "0.000_02"; }

use Moose;

extends 'OWL::DirectSemantics::Element';
with 'OWL::DirectSemantics::Writer::Dump';
with 'OWL::DirectSemantics::Writer::FunctionalSyntax';

has 'property' => (is => 'rw', isa => 'RDF::Trine::Node', required=>1);
has 'datarange'=> (is => 'rw', isa => 'RDF::Trine::Node', required=>0);
has 'value'    => (is => 'rw', isa => 'RDF::Trine::Node', required=>1);

sub fs_arguments
{
	my ($self) = @_;
	return ($self->value, $self->property, $self->datarange) if defined $self->datarange;
	return ($self->value, $self->property);
}

1;

__END__

=head1 NAME

OWL::DirectSemantics::Element::DataExactCardinality - represents an OWL DataExactCardinality

=head1 DESCRIPTION

This class represents the DataExactCardinality element in OWL Direct Semantics.

This class inherits from OWL::DirectSemantics::Element.

It does the OWL::DirectSemantics::Writer::FunctionalSyntax and
OWL::DirectSemantics::Writer::Dump roles.

=head2 Attributes

=over

=item C<< annotations >>

A list of annotations associated with this object.
The value is a ArrayRef.

=item C<< datarange >>

The datatype.
The value is a RDF::Trine::Node.

=item C<< property >>

The property.
The value is a RDF::Trine::Node.
This is a required attribute.

=item C<< value >>

The cardinality value.
The value is a RDF::Trine::Node.
This is a required attribute.



=back

=head1 SEE ALSO

L<OWL::DirectSemantics>,
L<OWL::DirectSemantics::Element>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT

Copyright 2011 Toby Inkster

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
