function variance = i4row_variance ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_VARIANCE returns the variances of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of data in TABLE.
%
%    Input, integer A(M,N), the array.
%
%    Output, real VARIANCE(M), the variance of each row of TABLE.
%
  for i = 1 : m

    mean = sum ( a(i,1:n) ) / n;

    variance(i) = 0.0;
    for j = 1 : n
      variance(i) = variance(i) + ( a(i,j) - mean )^2;
    end

    if ( 1 < n )
      variance(i) = variance(i) / ( n - 1 );
    else
      variance(i) = 0.0
    end

  end

  return
end
