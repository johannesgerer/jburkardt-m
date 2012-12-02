function subpak_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests ISBN_FILL.
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
  test_num = 5;

  isbn_test = [ ...
    '0-?493-9640-9'; ...
    '0-201-5427?-7'; ...
    '0-521-35796-?'; ...
    '?-07-034025-0'; ...
    '0-07-05?489-2' ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  ISBN_FILL can fill in a single missing digit\n' );
  fprintf ( 1, '  in an ISBN.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    isbn = isbn_test(:,test);

    isbn = isbn_fill ( isbn );

    check = isbn_check ( isbn );

    fprintf ( 1, '  %s  %s  %2d\n', isbn_test(:,test), isbn, check );

  end

  return
end
