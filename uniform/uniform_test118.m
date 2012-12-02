function uniform_test118 ( )

%*****************************************************************************80
%
%% TEST118 tests LCRG_ANBN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST118\n' );
  fprintf ( 1, '  LCRG_ANBN determines a linear congruential random\n' );
  fprintf ( 1, '  number generator equivalent to N steps of a given one.\n' );
%
%  These parameters define the old (1969) IBM 360 random number generator:
%
  a = 16807;
  b = 0;
  c = 2147483647;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LCRG parameters:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = %d\n', a );
  fprintf ( 1, '  B = %d\n', b );
  fprintf ( 1, '  C = %d\n', c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             N             A             B\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 10
    [ an, bn ] = lcrg_anbn ( a, b, c, n );
    fprintf ( 1, '  %12d  %12d  %12d\n', n, an, bn );
  end

  return
end
