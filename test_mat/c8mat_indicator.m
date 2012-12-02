function a = c8mat_indicator ( m, n )

%*****************************************************************************80
%
%% C8MAT_INDICATOR returns the C8MAT indicator matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Output, complex A(M,N), the matrix.
%
  a = zeros ( m, n );
  imaginary = sqrt ( - 1 );

  for j = 1 : n
    for i = 1 : m
      a(i,j) = i + j * imaginary;
    end
  end

  return
end
