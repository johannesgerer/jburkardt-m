function a = r8poly_p2f ( n, a )

%*****************************************************************************80
%
%% R8POLY_P2F converts a real polynomial from power sum form to factorial form.
%
%  Discussion:
%
%    The power sum form is
%
%      p(x) = a(1) + a(2) * x + a(3) * x**2 + ... + a(n) * x**(n-1)
%
%    The (falling) factorial form is
%
%      p(x) =   a(1)
%             + a(2) * x
%             + a(3) * x * (x-1)
%             ...
%             + a(n) * x * (x-1) *...* (x-(n-2))
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
%    Input, real A(N), on input, the polynomial coefficients in power sum form.
%
%    Output, real A(N), the polynomial coefficients in factorial form.
%
  for m = 1 : n
    value = 0.0;
    for i = m : n
      value = a(n+m-i) + ( m - 1 ) * value;
      a(n+m-i) = value;
    end
  end

  return
end
