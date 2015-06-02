function a2 = r8mat_to_r8cmat ( lda, m, n, a1 )

%*****************************************************************************80
%
%% R8MAT_TO_R8CMAT transfers data from an R8MAT to an R8CMAT.
%
%  Discussion:
%
%    An R8MAT is an MxN array of R8's, 
%    accessible as a vector:
%      (I,J) -> (I+J*M).
%    or as a doubly-dimensioned array, if declared A(M,N):
%      (I,J) -> A(I,J)
%      
%    An R8CMAT is an MxN array of R8's, stored with a leading dimension LD,
%    accessible as a vector:
%      (I,J) -> (I+J*LD).
%    or as a doubly-dimensioned array, if declared A(LD,N):
%      (I,J) -> A(I,J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LDA, the leading dimension of A2.
%
%    Input, integer M, the number of rows of data.
%    M <= LDA.
%
%    Input, integer N, the number of columns of data.
%
%    Input, real A1(M,N), the matrix to be copied.
%
%    Output, real A2(LDA,N), contains a copy of the
%    information in A1, in the MxN submatrix.
%
  a2 = zeros ( lda, n );
  a2(1:m,1:n) = a1(1:m,1:n);

      return
      end
