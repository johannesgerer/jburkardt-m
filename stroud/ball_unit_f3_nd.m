function result = ball_unit_f3_nd ( func, n )

%*****************************************************************************80
%
%% BALL_UNIT_F3_ND approximates an integral inside the unit ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N)**2 ) <= 1.
%
%  Discussion:
%
%    A 2**(N+1)-1 point 5-th degree formula is used, Stroud number SN:5-4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2004
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
  quad = 0.0E+00;
%
%  The first point is the center of the ball.
%
  x(1:n) = 0.0E+00;

  weight = 4.0E+00 / ( n + 2 )^2;
  quad = quad + weight * feval ( func, n, x );

  s = 1.0E+00 / sqrt ( ( n + 4 ) );

  for i = 1 : n

    ri = sqrt ( ( i + 2 ) / ( n + 4 ) );
%
%  Set up the first point, with (I-1) zeroes, RI, and then N-I S's.
%
    for j = 1 : n

      if ( j < i )
        x(j) = 0.0E+00;
      elseif ( j == i )
        x(j) = ri;
      else
        x(j) = s;
      end

    end

    weight = 2.0E+00^( i - n ) * ( n + 4 ) / ( ( i + 1 ) * ( i + 2 ) * ( n + 2 ) );
%
%  Now go through all sign permutations of the basic point.
%
    for j = 1 : 2^(n+1-i)

      jtemp = j - 1;

      for k = i : n

        if ( mod ( jtemp, 2 ) == 1 )
          x(k) = - abs ( x(k) );
        else
          x(k) = abs ( x(k) );
        end

        jtemp = floor ( jtemp / 2 );

      end

      quad = quad + weight * feval ( func, n, x );

    end

  end

  volume = ball_unit_volume_nd ( n );
  result = quad * volume;

  return
end
