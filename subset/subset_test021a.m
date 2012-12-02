function subset_test021a ( )

%*****************************************************************************80
%
%% TEST021a tests DERANGE_ENUM, DERANGE_ENUM2, DERANGE_ENUM3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST021a\n' );
  fprintf ( 1, '  DERANGE_ENUM counts derangements;\n' );
  fprintf ( 1, '  DERANGE_ENUM2 counts derangements.\n' );
  fprintf ( 1, '  DERANGE_ENUM3 counts derangements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    # of derangements\n' );
  fprintf ( 1, '\n' );

  d = derange_enum2 ( n );

  for i = 0 : n
    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', i, derange_enum(i), d(i+1), derange_enum3(i) );
  end

  return
end
