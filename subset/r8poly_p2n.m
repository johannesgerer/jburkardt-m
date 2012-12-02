function a = r8poly_p2n ( n, a, xarray )

%*****************************************************************************80
%
%% R8POLY_P2N converts a real polynomial from power sum form to Newton form.
%
%  Discussion:
%
%    This is done by shifting all the Newton abscissas from zero.
%
%    The power sum form of a polynomial is:
%
%      p(x) = a(1) + a(2) * x + ... + a(n-1) * x**(n-2) + a(n) * x**(n-1)
%
%    The Newton form of a polynomial is described by an array of N coefficients
%    A and N abscissas X:
%
%      p(x) =   a(1)
%             + a(2) * (x-x(1))
%             + a(3) * (x-x(1)) * (x-x(2))
%             ...
%             + a(n) * (x-x(1)) * (x-x(2)) * ... * (x-x(n-1))
%
%    X(N) does not occur explicitly in the formula for the evaluation of p(x),
%    although it is used in deriving the coefficients A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of A.
%
%    Input, real A(N), the coefficients of the polynomial in power sum form.
%
%    Input, real XARRAY(N), the desired abscissas of
%    the Newton form of the polynomial.
%
%    Output, real A(N), the coefficients in Newton form.
%
  work(1:n) = 0.0;

  for i = n : -1 : 1
    [ a, xarray ] = r8poly_nx ( n, a, work, xarray(i) );
  end

  return
end
