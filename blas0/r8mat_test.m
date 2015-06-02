function a = r8mat_test ( trans, lda, m, n )

%*****************************************************************************80
%
%  Purpose:
%
%    R8MAT_TEST sets up a test matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    10 February 2014
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, character TRANS, indicates whether matrix is to be 
%    transposed.
%    'N', no transpose.
%    'T', transpose the matrix.
%
%    Input, integer LDA, the leading dimension of the matrix.
%
%    Input, integer M, N, the number of rows and columns of 
%    the matrix.
%
%    Output, real A(LDA,*), the matrix.
%    if TRANS is 'N', then the matrix is stored in LDA*N entries,
%    as an M x N matrix;
%    if TRANS is 'T', then the matrix is stored in LDA*M entries,
%    as an N x M matrix.
%
  if ( trans == 'N' )

    a = zeros ( lda, n );

    for j = 1 : n
      for i = 1 : m
        a(i,j) = 10 * i + j;
      end
    end

  else

    a = zeros ( lda, m );

    for j = 1 : n
      for i = 1 : m
        a(j,i) = 10 * i + j;
      end
    end

  end

  return
end