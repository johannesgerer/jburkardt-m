function subset_test065 ( )

%*****************************************************************************80
%
%% TEST065 tests I4POLY_CYCLO.
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
  max_n = 10;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST065\n' );
  fprintf ( 1, '  I4POLY_CYCLO computes cyclotomic polynomials.\n' );

  for n = 0 : max_n

    fprintf ( 1, '\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '\n' );
    phi = i4poly_cyclo ( n );

    i4poly_print ( n, phi, '  The cyclotomic polynomial:' );

  end

  return
end
