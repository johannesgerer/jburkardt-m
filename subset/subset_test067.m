function subset_test067 ( )

%*****************************************************************************80
%
%% TEST067 tests I4POLY_MUL.
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
  fprintf ( 1, 'TEST067\n' );
  fprintf ( 1, '  I4POLY_MUL multiplies two polynomials.\n' );
  fprintf ( 1, '\n' );
%
%  1: Multiply (1+X) times (1-X).  Answer is 1-X**2.
%  2: Multiply (1+2*X+3*X**2) by (1-2*X). Answer is 1 + 0*X - X**2 - 6*X**3
%
  for test = 1 : ntest

    if ( test == 1 )
      na = 1;
      a(1:na+1) = [ 1, 1 ];
      nb = 1;
      b(1:nb+1) = [ 1, -1 ];
    elseif ( test == 2 )
      na = 2;
      a(1:na+1) = [ 1, 2, 3 ];
      nb = 1;
      b(1:nb+1) = [ 1, -2 ];
    end

    c = i4poly_mul ( na, a, nb, b );

    i4poly_print ( na, a, '  The factor A:' );
    i4poly_print ( nb, b, '  The factor B:' );
    i4poly_print ( na+nb, c, '  The product C = A*B:' );

  end

  return
end
