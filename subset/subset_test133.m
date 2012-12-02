function subset_test133 ( )

%*****************************************************************************80
%
%% TEST133 tests R8POLY_MUL.
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
  ntest = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST133\n' );
  fprintf ( 1, '  R8POLY_MUL multiplies two polynomials.\n' );
  fprintf ( 1, '\n' );
%
%  1: Multiply (1+X) times (1-X).  Answer is 1-X**2.
%  2: Multiply (1+2*X+3*X**2) by (1-2*X). Answer is 1 + 0*X - X**2 - 6*X**3
%
  for itest = 1 : ntest

    if ( itest == 1 )
      na = 1;
      a(1:na+1) = [ 1.0, 1.0 ];
      nb = 1;
      b(1:nb+1) = [ 1.0, -1.0 ];
    elseif ( itest == 2 )
      na = 2;
      a(1:na+1) = [ 1.0, 2.0, 3.0 ];
      nb = 1;
      b(1:nb+1) = [ 1.0, -2.0 ];
    end

    c = r8poly_mul ( na, a, nb, b );

    r8poly_print ( na, a, '  The factor A:' );

    r8poly_print ( nb, b, '  The factor B:' );

    r8poly_print ( na+nb, c, '  The product C = A*B:' );

  end

  return
end
