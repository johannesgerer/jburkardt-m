function value = sine_transform_interpolant ( n, a, b, fa, fb, s, nx, x )

%*****************************************************************************80
%
%% SINE_TRANSFORM_INTERPOLANT evaluates the sine transform interpolant.
%
%  Discussion:
%
%    The interval [A,B] is divided into N+1 intervals using N+2 points,
%    which are indexed by 0 through N+1.
%
%    The original function F(X) is regarded as the sum of a linear function 
%    F1 that passes through (A,F(A)) and (B,F(B)), and a function F2
%    which is 0 at A and B.
%
%    The function F2 has been approximated using the sine transform,
%    and the interpolant is then evaluated as:
%
%      Interp(F)(X) = F1(X) + F2(X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of terms in the approximation.
%
%    Input, real A, B, the interval over which the approximant was defined.
%
%    Input, real FA, FB, the function values at A and B.
%
%    Input, real S(N), the approximant coefficients.
%
%    Input, integer NX, the number of evaluation points.
%
%    Input, real X(NX,1), the evaluation points.
%
%    Output, real VALUE(NX,1), the value of the interpolant.
%

%
%  Guarantee that X is a column vector.
%
  x = x ( : );
%
%  Compute linear function F1(X).
%
  f1 = ( ( b - x ) * fa + ( x - a ) * fb ) / ( b - a );
%
%  Compute sine interpolant F2(X).
%
  f2 = zeros ( nx, 1 );

  for i = 1 : nx
    for j = 1 : n
      f2(i) = f2(i) + s(j) * sin ( j * ( x(i) - a ) * pi / ( b - a ) );
    end
  end

  f2 = f2 * sqrt ( 2 / ( n + 1 ) );
%
%  Interpolant = F1 + F2.
%
  value = f1 + f2;

  return
end
