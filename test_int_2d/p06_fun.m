function fx = p06_fun ( n, x )

%*****************************************************************************80
%
%% P06_FUN evaluates the integrand for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gwynne Evans,
%    Practical Numerical Integration,
%    Wiley, 1993,
%    ISBN: 047193898X,
%    LC: QA299.3E93.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX(N,1), the integrand values.
%
  fx(1:n,1) = abs ( x(1,1:n).^2 + x(2,1:n).^2 - 0.25 );

  return
end
