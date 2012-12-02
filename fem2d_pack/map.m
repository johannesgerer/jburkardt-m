function w = map ( code, element_order )

%*****************************************************************************80
%
%% MAP returns the interpolation matrix for any available element.
%
%  Formula:
%
%    For an element of order ELEMENT_ORDER, we suppose we are given 
%    ELEMENT_ORDER items of data Q associated with the nodes.
%
%   Let PHI(J)(R,S) be the Lagrange basis polynomial associated with
%   node J.  PHI(J)(R,S) is 1 at node J, and 0 at each of the other nodes.
%
%   Let P(R,S) be the polynomial of ELEMENT_ORDER terms which interpolates the
%   data Q, that is,
%
%      P(R(J),S(J)) = Q(J)
%
%   where the coordinates of node J are (R(J),S(J)).  Then we know
%   that we can write
%
%     P(R,S) = sum ( 1 <= J <= ELEMENT_ORDER ) Q(J) * PHI(J)(R,S)
%
%   But P(R,S) also has a standard representation as
%
%     P(R,S) = sum ( 1 <= I <= ELEMENT_ORDER ) A(I) * R**REXP(I) * S**SEXP(I)
%
%   where REXP(I) and SEXP(I) are the exponents of R and S and
%   the A(I) are the appropriate coefficients.
%
%   The interpolation matrix W allows us to immediately compute
%   the standard basis coefficients A from the data Q to be interpolated
%   using the formula:
%
%      A(I) = sum ( 1 <= J <= ELEMENT_ORDER ) W(I,J) * Q(J)
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
%  Parameters:
%
%    Input, character CODE(*), identifies the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T6' and 'T10'.
%
%    Input, integer ELEMENT_ORDER, the order associated with the code.
%
%    Output, real W(ELEMENT_ORDER,ELEMENT_ORDER), the interpolation matrix.
%

%
%  Get the (R,S) location of the nodes.
%
  [ r, s, area ] = node_reference ( code );
%
%  Get the associated monomials.
%
  [ rexp, sexp ] = poly ( code );
%
%  Set up the Vandermonde matrix.
%  Factors of the form 0**0 are to be understood as 1.
%
  for i = 1 : element_order
    for j = 1 : element_order

      if ( rexp(j) == 0 )
        rfact = 1.0;
      else
        rfact = r(i)^rexp(j);
      end

      if ( sexp(j) == 0 )
        sfact = 1.0;
      else
        sfact = s(i)^sexp(j);
      end

      w(i,j) = rfact * sfact;

    end
  end
%
%  Factor the Vandermonde matrix.
%
  [ w_lu, pivot, info ] = r8ge_fa ( element_order, w );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MAP - Fatal error!\n' );
    fprintf ( 1, '  The Vandermonde matrix is singular.\n' );
    error ( 'MAP - Fatal error!' );
  end
%
%  Invert the Vandermonde matrix.
%
  w = r8ge_inverse ( element_order, w_lu, pivot );

  return
end
