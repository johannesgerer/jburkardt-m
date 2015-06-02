function [ d_min, d_max ] = r8col_separation ( m, n, a )

%*****************************************************************************80
%
%% R8COL_SEPARATION returns the "separation" of an R8COL.
%
%  Discussion:
%
%    D_MIN is the minimum distance between two columns,
%    D_MAX is the maximum distance between two columns.
%
%    The distances are measured using the Loo norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%    If N < 2, it does not make sense to call this routine.
%
%    Input, real A(M,N), the array whose variances are desired.
%
%    Output, real D_MIN, D_MAX, the minimum and maximum distances.
%
  d_min = Inf;
  d_max = 0.0;

  for j1 = 1 : n
    for j2 = j1 + 1 : n
      d = max ( abs ( a(1:m,j1) - a(1:m,j2) ) );
      d_min = min ( d_min, d );
      d_max = max ( d_max, d );
    end
  end

  return
end
