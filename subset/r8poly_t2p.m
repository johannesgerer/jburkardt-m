function a = r8poly_t2p ( n, a, x )

%*****************************************************************************80
%
%% R8POLY_T2P converts a real polynomial from Taylor form to power sum form.
%
%  Discussion:
%
%    The Taylor form of a polynomial based at X0 is
%
%      p(x) =   a(1)
%             + a(2) * (x-x0)
%             + a(3) * (x-x0)**2
%             ...
%             + a(n) * (x-x0)**(n-1)
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
%    Input, real A(N), the coefficients in Taylor form.
%
%    Input, real X, the point at which the Taylor form polynomial is based.
%
%    Output, real A(N), the coefficients in power sum form.
%
  for i = n : -1 : 1
    for j = i : n-1
      a(j) = a(j) - a(j+1) * x;
    end
  end

  return
end
