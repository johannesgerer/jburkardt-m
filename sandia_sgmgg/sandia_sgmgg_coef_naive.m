function coef = sandia_sgmgg_coef_naive ( dim_num, point_num, sparse_index )

%*****************************************************************************80
%
%% SANDIA_SGMGG_COEF_NAIVE returns the combinatorial coefficients.
%
%  Discussion:
%
%    The coefficient of point I is calculated as follows:
%
%    *) point J is a "neighbor" of point I if every entry of the sparse
%       index for point J is either equal to, or 1 greater than, the
%       corresponding entry of the sparse index of point I.
%
%    *) If point J is a neighbor of point I, then it contributes
%       (-1)^D to the coefficient, where D is the sum of the differences
%       between the sparse indices of point I and point J.
%
%    This is a completely naive implementation of the calculation,
%    intended simply as a demonstration for small examples.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the vector.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer SPARSE_INDEX(DIM_NUM,POINT_NUM),
%    the indices that define the points.
%
%    Output, integer COEF(POINT_NUM), the coefficients.
%
  coef = zeros ( point_num, 1 );

  for j1 = 1 : point_num

    for j2 = 1 : point_num

      neighbor = 1;
      term = + 1;

      for i = 1 : dim_num

        dif = sparse_index(i,j2) - sparse_index(i,j1);

        if ( dif == 0 )

        elseif ( dif == 1 )
          term = - term;
        else
          neighbor = 0;
          break;
        end

      end

      if ( neighbor )
        coef(j1) = coef(j1) + term;
      end

    end

  end

  return
end
