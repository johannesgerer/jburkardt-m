function value = hermite_basis_0 ( n, x, i, xv )

%*****************************************************************************80
%
%% HERMITE_BASIS_0 evaluates a zero-order Hermite interpolation basis function.
%
%  Discussion:
%
%    Given ND points XD, with values YD and derivative values YPD, the
%    Hermite interpolant can be written as:
%
%      H(X) = sum ( 1 <= I <= ND ) YD(I)  * H0(I;X)
%           + sum ( 1 <= I <= ND ) YPD(I) * H1(I;X)
%
%    where H0(I;X) is the I-th zero order Hermite interpolation basis function,
%    and H1(I;X) is the I-th first order Hermite interpolation basis function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of abscissas.
%
%    Input, real X(N), the abscissas.
%
%    Input, integer I, the index of the first-order basis function.
%
%    Input, real XV, the evaluation point.
%
%    Output, real VALUE, the value of the function.
%
  if ( i < 1 || n < i )
    error ( 'HERMITE_BASIS_0 - Fatal error!' );
  end
%
%  L(X) = product ( X - X(1:N) )
%

%
%  I_COMP = 1 to N except for I.
%
  i_comp = setdiff ( 1 : n, i );
%
%  L'(X(I)).
%
  lp = prod ( x(i) - x(i_comp) );
%
%  LI(X) = L(X) / ( X - X(I) ) / L'(X(I))
%
  li = prod ( xv - x(i_comp) ) / lp;
%
%  L''(X(I)).
%
  lpp = 0.0;
  for j = 1 : n
    if ( j ~= i )
      ij_comp = setdiff ( i_comp, j );
      lpp = lpp + 2.0 * prod ( x(i) - x(ij_comp) );
    end
  end

  value = ( 1.0 - ( xv - x(i) ) * lpp / lp ) * li * li;

  return
end
