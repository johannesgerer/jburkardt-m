function b = cc_mv ( m, n, ncc, icc, ccc, acc, x )

%*****************************************************************************80
%
%% CC_MV multiplies a CC matrix by a vector
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, integer NCC, the number of CC values.
%
%    Input, integer ICC(NCC), the CC rows.
%
%    Input, integer CCC(N+1), the compressed CC columns
%
%    Input, real ACC(NCC), the CC values.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Output, real B(M), the product A*X.
%
  b = zeros(m,1);

  for j = 1 : n
    for k = ccc(j) : ccc(j+1) - 1
      i = icc(k);
      b(i) = b(i) + acc(k) * x(j);
    end
  end

  return
end
