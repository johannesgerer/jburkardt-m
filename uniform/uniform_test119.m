function uniform_test119 ( )

%*****************************************************************************80
%
%% TEST119 tests LCRG_ANBN.
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
  fprintf ( 1, 'TEST119\n' );
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
  fprintf ( 1, '  A  = %d\n', a );
  fprintf ( 1, '  B  = %d\n', b );
  fprintf ( 1, '  C  = %d\n', c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                           N            In           Out\n' );
  fprintf ( 1, '\n' );

  k = 0;
  u = 12345;
  fprintf ( 1, '                %12d                %12d\n', k, u );
  for k = 1 : 11
    v = lcrg_evaluate ( a, b, c, u );
    fprintf ( 1, '                %12d  %12d  %12d\n', k, u, v );
    u = v;
  end
%
%  Now try to replicate these results using N procesors.
%
  n = 4;

  [ an, bn ] = lcrg_anbn ( a, b, c, n );

  fprintf ( 1, '\n' );
  fprintf ( 1,'  LCRG parameters:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  AN = %d\n', an );
  fprintf ( 1, '  BN = %d\n', bn );
  fprintf ( 1, '  C  = %d\n', c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             J             N            In           Out\n' );
  fprintf ( 1, '\n' );

  x(1) = 12345;
  for j = 2 : n
    x(j) = lcrg_evaluate ( a, b, c, x(j-1) );
  end

  for j = 1 : n
    fprintf ( 1, '  %12d  %12d                %12d\n', j, j-1, x(j) );
  end

  for k = n + 1 : n : 12
    for j = 1 : n
      y(j) = lcrg_evaluate ( an, bn, c, x(j) );
      fprintf ( 1, '  %12d  %12d  %12d  %12d\n', j, k+j-2, x(j), y(j) );
      x(j) = y(j);
    end
  end

  return
end
