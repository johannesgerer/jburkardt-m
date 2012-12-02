function subset_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests I4POLY_DIV.
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
  ntest = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST066\n' );
  fprintf ( 1, '  I4POLY_DIV computes the quotient and\n' );
  fprintf ( 1, '  remainder for polynomial division.\n' );
  fprintf ( 1, '\n' );
%
%  1: Divide X**3 + 2*X**2 - 5*X - 6  by X-2.  
%     Quotient is 3+4*X+X**2, remainder is 0.
%
%  2: Divide X**4 + 3*X**3 + 2*X**2 - 2  by  X**2 + X - 3.
%     Quotient is X**2 + 2*X + 3, remainder 8*X + 7.
%
  for test = 1 : ntest

    if ( test == 1 )
      na = 3;
      a(1:na+1) = [ -6, -5, 2, 1 ];
      nb = 1;
      b(1:nb+1) = [ -2, 1 ];
    elseif ( test == 2 )
      na = 4;
      a(1:na+1) = [ -2, 5, 2, 3, 1 ];
      nb = 2;
      b(1:nb+1) = [ -3, 1, 1 ];
    end

    i4poly_print ( na, a, '  The polynomial to be divided, A:' );
    i4poly_print ( nb, b, '  The divisor polynomial, B:' );

    [ nq, q, nr, r ] = i4poly_div ( na, a, nb, b );
 
    i4poly_print ( nq, q, '  The quotient polynomial, Q:' );
    i4poly_print ( nr, r, '  The remainder polynomial, R:' );

  end

  return
end
