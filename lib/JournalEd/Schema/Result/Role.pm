use utf8;
package JournalEd::Schema::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JournalEd::Schema::Result::Role

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<roles>

=cut

__PACKAGE__->table("roles");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 rolename

  data_type: 'varchar'
  is_nullable: 0
  size: 120

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "rolename",
  { data_type => "varchar", is_nullable => 0, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 userroles

Type: has_many

Related object: L<JournalEd::Schema::Result::Userrole>

=cut

__PACKAGE__->has_many(
  "userroles",
  "JournalEd::Schema::Result::Userrole",
  { "foreign.role_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-04-11 16:56:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k/7euOtdEPkwuojLcAoBwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
