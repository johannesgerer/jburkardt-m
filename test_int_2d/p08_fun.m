function fx = p08_fun ( n, x )

%*****************************************************************************80
%
%% P08_FUN evaluates the integrand for problem 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX(N,1), the integrand values.
%
  fx(1:n,1) = exp ( - ( ( x(1,1:n) - 4.0 ).^2 + ( x(2,1:n) - 1.0 ).^2 ) );

  return
end
