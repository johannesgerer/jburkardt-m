function variance = r8row_variance ( m, n, x )

%*****************************************************************************80
%
%% R8ROW_VARIANCE returns the variances of an R8ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real X(M,N), the R8ROW whose row means are desired.
%
%    Output, real VARIANCE(M), the variances of the rows of X.
%
  for i = 1 : m

    mean = sum ( x(i,1:n) ) / n;

    variance(i) = sum ( ( x(i,1:n) - mean ).^2 );

    if ( 1 < n )
      variance(i) = variance(i) / ( n - 1 );
    else
      variance(i) = 0.0;
    end

  end 

  return
end
