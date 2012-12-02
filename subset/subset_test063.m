function subset_test063 ( )

%*****************************************************************************80
%
%% TEST063 tests INVOLUTE_ENUM;
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
  fprintf ( 1, 'TEST063\n' );
  fprintf ( 1, '  INVOLUTE_ENUM counts involutions;\n' );
  fprintf ( 1, '\n' );

  s = involute_enum ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    # of involutions\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n
    fprintf ( 1, '  %8d  %8d\n', i, s(i+1) );
  end

  return
end
