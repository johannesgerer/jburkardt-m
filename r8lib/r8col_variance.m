function variance = r8col_variance ( m, n, a )

%*****************************************************************************80
%
%% R8COL_VARIANCE returns the variances of an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real A(M,N), the array whose variances are desired.
%
%    Output, real VARIANCE(N), the variances of the rows.
%
  for j = 1 : n

    mean = sum ( a(1:m,j) ) / m;

    variance(j) = sum ( ( a(1:m,j) - mean ).^2 );

    if ( 1 < m )
      variance(j) = variance(j) / ( m - 1 );
    else
      variance(j) = 0.0;
    end

  end

  return
end
