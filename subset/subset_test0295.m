function subset_test0295 ( )

%*****************************************************************************80
%
%% TEST0295 tests EULER.
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
  nmax = 9;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0295\n' );
  fprintf ( 1, '  EULER gets rows of Euler''s triangle.\n' );
  fprintf ( 1, '\n' );

  for n = 0 : nmax
    ieuler = euler ( n );
    for i = 1 : n+1
      fprintf ( 1, '  %6d', ieuler(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
