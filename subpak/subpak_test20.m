function subpak_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests ISBN_CHECK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 8;

  isbn_test = [ ...
    '0-8493-9640-9'; ...
    '0-201-54275-7'; ...
    '0-521-35796-9'; ...
    '0-07-034025-0'; ...
    '0-7493-9640-9'; ...
    '0-201-54275-X'; ...
    '0-521-X5796-9'; ...
    '0-37-034025-0' ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  ISBN_CHECK checks ISBN''s.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A correct ISBN has a checksum of 0.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    isbn = isbn_test(:,test);

    check = isbn_check ( isbn );

    fprintf ( 1, '  %s  %2d\n', isbn, check );

  end

  return
end
