function subset_test134 ( )

%*****************************************************************************80
%
%% TEST134 tests R8POLY_N2P, R8POLY_P2N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  ap = r8vec_indicator ( n );

  x(1:n) = 2.0 * ap(1:n);
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST134\n' );
  fprintf ( 1, '  R8POLY_N2P: Newton => power sum;\n' );
  fprintf ( 1, '  R8POLY_P2N: Power sum => Newton.\n' );

  r8poly_print ( n-1, ap, '  The power sum polynomial:' );
 
  an = r8poly_p2n ( n, ap, x );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Newton polynomial coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', an(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Newton polynomial abscissas:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f', x(i) );
  end
  fprintf ( 1, '\n' );
 
  ap2 = r8poly_n2p ( n, an, x );
 
  r8poly_print ( n-1, ap2, '  The recovered power sum polynomial:' );

  return
end
