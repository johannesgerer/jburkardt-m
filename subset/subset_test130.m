function subset_test130 ( )

%*****************************************************************************80
%
%% TEST130 tests R8POLY_DIV.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST130\n' );
  fprintf ( 1, '  R8POLY_DIV computes the quotient and\n' );
  fprintf ( 1, '  remainder for polynomial division.\n' );
  fprintf ( 1, '\n' );
%
%  1: Divide X**3 + 2*X**2 - 5*X - 6  by X-2.  
%     Quotient is 3+4*X+X**2, remainder is 0.
%
%  2: Divide X**4 + 3*X**3 + 2*X**2 - 2  by  X**2 + X - 3.
%     Quotient is X**2 + 2*X + 3, remainder 8*X + 7.
%
  ntest = 2;
  
  for test = 1 : ntest

    if ( test == 1 )
      na = 3;
      a(1:na+1) = [ -6.0, -5.0, 2.0, 1.0 ];
      nb = 1;
      b(1:nb+1) = [ -2.0, 1.0 ];
    elseif ( test == 2 )
      na = 4;
      a(1:na+1) = [ -2.0, 5.0, 2.0, 3.0, 1.0 ];
      nb = 2;
      b(1:nb+1) = [ -3.0, 1.0, 1.0 ];
    end

    r8poly_print ( na, a, '  The polynomial to be divided, A:' );
    r8poly_print ( nb, b, '  The divisor polynomial, B:' );

    [ nq, q, nr, r ] = r8poly_div ( na, a, nb, b );
 
    r8poly_print ( nq, q, '  The quotient polynomial, Q:' );
    r8poly_print ( nr, r, '  The remainder polynomial, R:' );

  end

  return
end
