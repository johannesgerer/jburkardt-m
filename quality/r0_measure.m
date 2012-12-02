function value = r0_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% R0_MEASURE determines the pointset quality measure R0.
%
%  Discussion:
%
%    The R0 measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%      R0 = sum ( 1 <= I /= J <= N ) log ( 1 / distance ( Z(I), Z(J) ) )
%         / ( N * ( N - 1 ) )
%
%    The divisor of ( N * ( N - 1 ) ) means that R0 is essentially an
%
%    R0 is undefined if N < 2 or if any two points are equal.
%
%    R0 is known as the Riesz S-energy for S = 0.
%
%    Given two meshes, this measure recommends the one with the smaller
%    value of R0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    D P Hardin, E B Saff,
%    Discretizing Manifolds via Minimum Energy Points,
%    Notices of the AMS,
%    Volume 51, Number 10, November 2004, pages 1186-1194.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real VALUE, the R0 quality measure.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    value = r8_huge ( );
    return
  end

  value = 0.0;

  for j1 = 1 : n

    for j2 = 1 : n

      if ( j2 ~= j1 )

        dist = sqrt ( sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );

        if ( dist == 0.0 )
          value = r8_huge ( )
          return
        end

        value = value + log ( 1.0 / dist );

      end

    end

  end

  value = value / ( n * ( n - 1 ) );

  return
end
