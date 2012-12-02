function value = hermite_basis_1 ( n, x, i, xv )

%*****************************************************************************80
%
%% HERMITE_BASIS_1 evaluates a first-order Hermite interpolation basis function.
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
%    25 May 2011
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
    error ( 'HERMITE_BASIS_1 - Fatal error!' );
  end

  i_comp = setdiff ( 1 : n, i );

  top = ( xv - x(i) ) * ( prod ( xv   - x(i_comp) ) )^2;
  bot =                 ( prod ( x(i) - x(i_comp) ) )^2;

  value = top / bot;

  return
end
