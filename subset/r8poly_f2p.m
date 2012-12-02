function a = r8poly_f2p ( n, a )

%*****************************************************************************80
%
%% R8POLY_F2P converts a real polynomial from factorial form to power sum form.
%
%  Discussion:
%
%    The (falling) factorial form is
%
%      p(x) =   a(1)
%             + a(2) * x
%             + a(3) * x*(x-1)
%             ...
%             + a(n) * x*(x-1)*...*(x-(n-2))
%
%    The power sum form is
%
%      p(x) = a(1) + a(2)*x + a(3)*x**2 + ... + a(n)*x**(n-1)
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
%    Input, real A(N), the polynomial coefficients in factorial form.
%
%    Output, real A(N),  the polynomial coefficients in power sum form.
%
  w = -n;

  for m = 1 : n

    val = 0.0;
    z = w;

    for i = m : n
      z = z + 1.0;
      val = a(n+m-i) + z * val;
      a(n+m-i) = val;
    end

    w = w + 1.0;

  end

  return
end
