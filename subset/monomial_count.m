function total = monomial_count ( degree_max, dim )

%*****************************************************************************80
%
%% MONOMIAL_COUNT counts the number of monomials up to a given degree.
%
%  Discussion:
%
%    In 3D, there are 10 monomials of degree 3 or less:
%
%    Degree  Count  List
%    ------  -----  ----
%         0      1  1
%         1      3  x y z
%         2      6  xx xy xz yy yz zz
%         3     10  xxx xxy xxz xyy xyz xzz yyy yyz yzz zzz
%
%    Total      20
%
%    The formula is
%
%      COUNTS(DEGREE,DIM) = (DIM-1+DEGREE)% / (DIM-1)% / DEGREE%
%
%      TOTAL              = (DIM  +DEGREE)% / (DIM)%   / DEGREE%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREE_MAX, the maximum degree.
%
%    Input, integer DIM, the spatial dimension.
%
%    Output, integer TOTAL, the total number of monomials
%    of degrees 0 through DEGREE_MAX.
%
  total = 1;

  if ( degree_max < dim )

    top = dim + 1;
    for bot = 1 : degree_max
      total = ( total * top ) / bot;
      top = top + 1;
    end

  else

    top = degree_max + 1;
    for bot = 1 : dim
      total = ( total * top ) / bot;
      top = top + 1;
    end

  end

  return
end
