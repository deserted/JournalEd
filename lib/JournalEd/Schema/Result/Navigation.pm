use utf8;
package JournalEd::Schema::Result::Navigation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JournalEd::Schema::Result::Navigation

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

=head1 TABLE: C<navigation>

=cut

__PACKAGE__->table("navigation");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 page_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 order_id

  data_type: 'integer'
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "page_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "order_id",
  { data_type => "integer", is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<order_id>

=over 4

=item * L</order_id>

=back

=cut

__PACKAGE__->add_unique_constraint("order_id", ["order_id"]);

=head1 RELATIONS

=head2 page

Type: belongs_to

Related object: L<JournalEd::Schema::Result::Page>

=cut

__PACKAGE__->belongs_to(
  "page",
  "JournalEd::Schema::Result::Page",
  { id => "page_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-04-11 16:56:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/ua81Rc6v3ib+FUNBGTNXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
