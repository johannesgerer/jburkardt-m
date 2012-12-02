function counts = monomial_counts ( degree_max, dim )

%*****************************************************************************80
%
%% MONOMIAL_COUNTS counts the number of monomials up to a given degree.
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
%    Output, integer COUNTS(1:DEGREE_MAX+1), the number of
%    monomials of each degree.
%
  degree = 0;
  counts(degree+1) = 1;

  for degree = 1 : degree_max
    counts(degree+1) = ( counts(degree) * ( dim - 1 + degree ) ) / degree;
  end

  return
end
