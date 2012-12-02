function result = ball_unit_f1_nd ( func, n )

%*****************************************************************************80
%
%% BALL_UNIT_F1_ND approximates an integral inside a unit ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N)**2 ) <= 1.
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
%    25 November 2004
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
%    Output, real RESULT, the approximate integral of the function.
%
  u2 = ( 1.0E+00 - 2.0E+00 * sqrt ( 1.0E+00 / ( n + 4 ) ) ) / ( n + 2 );
  u = sqrt ( u2 );
  x(1:n) = - u;

  w = 1.0E+00 / ( ( n + 1 ) * 2^n );

  quad = 0.0E+00;
  ihi = 2^n;

  for i = 1 : ihi

    itemp = i - 1;

    for j = 1 : n

      if ( mod ( itemp, 2 ) == 1 )
        x(j) = - abs ( x(j) );
      else
        x(j) = abs ( x(j) );
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

    x(1:n) = - v;

    x(i) = - u;

    for k = 1 : khi

      ktemp = k - 1;

      for j = 1 : n

        if ( mod ( ktemp, 2 ) == 1 )
          x(j) = - abs ( x(j) );
        else
          x(j) = abs ( x(j) );
        end

        ktemp = floor ( ktemp / 2 );

      end

      quad = quad + w * feval ( func, n, x );

    end

    x(i) = - v;

  end

  volume = ball_unit_volume_nd ( n );
  result = quad * volume;

  return
end
