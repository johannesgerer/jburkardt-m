function a = r8poly_p2t ( n, a, x )

%*****************************************************************************80
%
%% RPPOLY_P2T converts a real polynomial from power sum form to Taylor form.
%
%  Discussion:
%
%    The power sum form is
%
%      p(x) = a(1) + a(2)*x + a(3)*x**2 + ... + a(n)*x**(n-1)
%
%    The Taylor form of a polynomial based at X0 is
%
%      p(x) =   a(1)
%             + a(2) * (x-x0)
%             + a(3) * (x-x0)**2
%             ...
%             + a(n) * (x-x0)**(n-1)
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
%    Input, real A(N), on input, the coefficients in power sum form.
%
%    Input, real X, the point at which the Taylor form of the
%    polynomial is to be based.
%
%    Output, real A(N), the coefficients in Taylor form.
%
  for m = 1 : n
    value = 0.0;
    for i = m : n
      value = a(n+m-i) + x * value;
      a(n+m-i) = value;
    end
  end

  return
end
