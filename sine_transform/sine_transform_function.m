function s = sine_transform_function ( n, a, b, f )

%*****************************************************************************80
%
%% SINE_TRANSFORM_FUNCTION does a sine transform on functional data.
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
%    The sine transform coefficients for F2 are then computed.
%
%    To recover the interpolant of F(X), it is necessary to combine the
%    linear part F1 with the sine transform interpolant:
%
%      Interp(F)(X) = F1(X) + F2(X)
%
%    This can be done by calling SINE_TRANSFORM_INTERPOLANT().
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
%    Input, integer N, the number of data points.
%
%    Input, real A, B, the interval endpoints.
%
%    Input, function value = F ( x ), a pointer to the function.
%
%    Output, real S(N), the sine transform coefficients.
%
  x = linspace ( a, b, n + 2 );
  x = x(2:n+1);
%
%  Subtract F1(X) from F(X) to get F2(X).
%
  fa = f ( a );
  fb = f ( b );

  f2(1:n) = f ( x(1:n) ) - ( ( b - x(1:n)     ) * fa   ...
                           + (     x(1:n) - a ) * fb ) ...
                           / ( b          - a );
%
%  Compute the sine transform of F2(X).
%
  s = zeros ( n, 1 );

  for i = 1 : n
    for j = 1 : n
      s(i) = s(i) + sin ( pi * i * j / ( n + 1 ) ) * f2(j);
    end
  end

  s(1:n) = s(1:n) * sqrt ( 2 / ( n + 1 ) );

  return
end
