function c = c8vec_spiral ( n, m, c1, c2 )

%*****************************************************************************80
%
%% C8VEC_SPIRAL returns N points on a spiral between C1 and C2.
%
%  Discussion:
%
%    A C8VEC is a vector of C8's.
%
%    Let the polar form of C1 be ( R1, T1 ) and the polar form of C2 
%    be ( R2, T2 ) where, if necessary, we increase T2 by 2*PI so that T1 <= T2.
%    
%    Then the polar form of the I-th point C(I) is:
%
%      R(I) = ( ( N - I     ) * R1 
%             + (     I - 1 ) * R2 ) 
%              / ( N    - 1 )
%
%      T(I) = ( ( N - I     ) * T1 
%             + (     I - 1 ) * ( T2 + M * 2 * PI ) ) 
%             / ( N     - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points on the spiral.
%
%    Input, integer M, the number of full circuits the 
%    spiral makes.
%
%    Input, complex C1, C2, the first and last points 
%    on the spiral.
%
%    Output, complex C(N), the points.
%
  r1 = abs ( c1 );
  r2 = abs ( c2 );

  t1 = c8_arg ( c1 );
  t2 = c8_arg ( c2 );

  if ( m == 0 )

    if ( t2 < t1 )
      t2 = t2 + 2.0 * pi;
    end

  elseif ( 0 < m )

    if ( t2 < t1 )
      t2 = t2 + 2.0 * pi;
    end

    t2 = t2 + m * 2.0 * pi;

  elseif ( m < 0 )

    if ( t1 < t2 )
      t2 = t2 - 2.0 * pi;
    end

    t2 = t2 - m * 2.0 * pi;

  end

  c = zeros ( n, 1 );

  for i = 1 : n

    ri = ( ( n - i     ) * r1 ...
         + (     i - 1 ) * r2 ) ...
         / ( n     - 1 );

    ti = ( ( n - i     ) * t1 ...
         + (     i - 1 ) * t2 ) ...
         / ( n     - 1 );

    c(i) = polar_to_c8 ( ri, ti );

  end

  return
end