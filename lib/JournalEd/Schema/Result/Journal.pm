use utf8;
package JournalEd::Schema::Result::Journal;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JournalEd::Schema::Result::Journal

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

=head1 TABLE: C<journals>

=cut

__PACKAGE__->table("journals");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 author_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 body

  data_type: 'mediumtext'
  is_nullable: 0

=head2 attachment_ids

  data_type: 'varchar'
  is_nullable: 0
  size: 150

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 modified

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 categories

  data_type: 'varchar'
  is_nullable: 1
  size: 150

=head2 published

  data_type: 'tinyint'
  is_nullable: 0

=head2 tags

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 groups

  data_type: 'varchar'
  default_value: 'Public'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "author_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "body",
  { data_type => "mediumtext", is_nullable => 0 },
  "attachment_ids",
  { data_type => "varchar", is_nullable => 0, size => 150 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "modified",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "categories",
  { data_type => "varchar", is_nullable => 1, size => 150 },
  "published",
  { data_type => "tinyint", is_nullable => 0 },
  "tags",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "groups",
  {
    data_type => "varchar",
    default_value => "Public",
    is_nullable => 0,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<JournalEd::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "author",
  "JournalEd::Schema::Result::User",
  { user_id => "author_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-04-11 16:56:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8EGmsiooy0MnRt6SMIIH9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
