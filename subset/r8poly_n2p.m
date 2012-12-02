function a = r8poly_n2p ( n, a, xarray )

%*****************************************************************************80
%
%% R8POLY_N2P converts a real polynomial from Newton form to power sum form.
%
%  Discussion:
%
%    This is done by shifting all the Newton abscissas to zero.
%
%    Actually, what happens is that the abscissas of the Newton form
%    are all shifted to zero, which means that A is the power sum
%    polynomial description and A, XARRAY is the Newton polynomial
%    description.  It is only because all the abscissas are shifted to
%    zero that A can be used as both a power sum and Newton polynomial
%    coefficient array.
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
%    The power sum form of a polynomial is:
%
%      p(x) = a(1) + a(2)*x + ... + a(n-1)*x**(n-2) + a(n)*x**(n-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of A.
%
%    Input, real A(N), the coefficients of the polynomial in Newton
%    form.
%
%    Input, real XARRAY(N), the abscissas of the Newton form of the
%    polynomial.
%
%    Output, real A(N), the coefficients in power sum form.
%
  for i = 1 : n
    a = r8poly_nx ( n, a, xarray, 0.0 );
  end

  return
end
