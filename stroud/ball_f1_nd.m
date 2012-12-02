function result = ball_f1_nd ( func, n, xc, r )

%*****************************************************************************80
%
%% BALL_F1_ND approximates an integral inside a ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N) - XC(1:N) )**2 <= R**2.
%
%  Discussion:
%
%    An (N+1)*2**N point 5-th degree formula is used, Stroud number SN:5-6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F at the N-vector X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Input, real XC(N), the center of the ball.
%
%    Input, real R, the radius of the ball.
%
%    Output, real RESULT, the approximate integral of the function.
%
  if ( r == 0.0E+00 )
    result = 0.0E+00;
    return
  end

  u2 = ( 1.0E+00 - 2.0E+00 * sqrt ( 1.0E+00 / ( n + 4 ) ) ) / ( n + 2 );
  u = sqrt ( u2 );
  x(1:n) = xc(1:n) - r * u;

  w = 1.0E+00 / ( ( n + 1 ) * 2^n );

  quad = 0.0E+00;
  ihi = 2^n;

  for i = 1 : ihi

    itemp = i - 1;

    for j = 1 : n

      u = ( xc(j) - x(j) ) / r;

      if ( mod ( itemp, 2 ) == 1 )
        x(j) = xc(j) - abs ( x(j) - xc(j) );
      else
        x(j) = xc(j) + abs ( x(j) - xc(j) );
      end

      itemp = floor ( itemp / 2 );

    end

    quad = quad + w * feval ( func, n, x );

  end

  temp = sqrt ( n + 4 );

  t = sqrt ( 2.0E+00 * ( n + 1 ) / ( n + 2 ) ) / ( n * temp );

  y = ( 1.0E+00 + 2.0E+00 / ( n * temp ) ) / ( n + 2 );
  v = sqrt ( y - t );
  u = sqrt ( y + ( n - 1 ) * t );

  khi = 2^n;

  for i = 1 : n

    x(1:n) = xc(1:n) - r * v;

    x(i) = xc(i) - r * u;

    for k = 1 : khi

      ktemp = k - 1;

      for j = 1 : n

        if ( mod ( ktemp, 2 ) == 1 )
          x(j) = xc(j) - abs ( x(j) - xc(j) );
        else
          x(j) = xc(j) + abs ( x(j) - xc(j) );
        end

        ktemp = floor ( ktemp / 2 );

      end

      quad = quad + w * feval ( func, n, x );

    end

    x(i) = xc(i) - r * v;

  end

  volume = ball_volume_nd ( n, r );
  result = quad * volume;

  return
end
