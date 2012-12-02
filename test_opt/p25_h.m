function h = p25_h ( n, x )

%*****************************************************************************80
%
%% P25_H evaluates the Hessian for problem 25.
%
%  Discussion:
%
%    Note that, for P = 0, the Hessian matrix should be diagonal.
%    However, if it is estimated using finite differences, off diagonal
%    terms may appear.  This occurs when the argument increment dX is
%    too small to be significant in terms such as X**6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  for i = 1 : n
    h(i,i) = i * 12.0 * x(i)^2;
  end

  return
end
