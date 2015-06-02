function a2 = r8cmat_to_r8mat ( lda, m, n, a1 )

%*****************************************************************************80
%
%% R8CMAT_TO_R8MAT transfers data from an R8CMAT to an R8MAT.
%
%  Discussion:
%
%    An R8CMAT is an MxN array of R8's, stored with a leading dimension LD,
%    accessible as a vector:
%      (I,J) -> (I+J*LD).
%    or as a doubly-dimensioned array, if declared A(LD,N):
%      (I,J) -> A(I,J)
%
%    An R8MAT is an MxN array of R8's, 
%    accessible as a vector:
%      (I,J) -> (I+J*M).
%    or as a doubly-dimensioned array, if declared A(M,N):
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
%    Input, integer LDA, the leading dimension of A1.
%    M <= LDA.
%
%    Input, integer M, the number of rows of data.
%    M <= LDA.
%
%    Input, integer N, the number of columns of data.
%
%    Input, real A1(LDA,N), the M by N matrix to be copied.
%
%    Output, real A2(M,N), a copy of the
%    information in the MxN submatrix of A1.
%
      a2(1:m,1:n) = a1(1:m,1:n);
 
      return
      end
