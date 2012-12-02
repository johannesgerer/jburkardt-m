function b = r8gb_to_r8ge ( m, n, ml, mu, a )

%*****************************************************************************80
%
%% R8GB_TO_R8GE copies a R8GB matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R8GB storage format is for an M by N banded matrix, with lower 
%    bandwidth ML and upper bandwidth MU.  Storage includes room for ML 
%    extra superdiagonals, which may be required to store nonzero entries 
%    generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.  
%
%    LINPACK and LAPACK band storage requires that an extra ML
%    superdiagonals be supplied to allow for fillin during Gauss
%    elimination.  Even though a band matrix is described as
%    having an upper bandwidth of MU, it effectively has an
%    upper bandwidth of MU+ML.  This routine will copy nonzero
%    values it finds in these extra bands, so that both unfactored
%    and factored matrices can be handled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrices.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrices.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths of A1.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(2*ML+MU+1,N), the R8GB matrix.
%
%    Output, real B(M,N), the R8GE matrix.
%
  for i = 1 : m
    for j = 1 : n
      if ( i - ml <= j & j <= i + mu )
        b(i,j) = a(ml+mu+1+i-j,j);
      else
        b(i,j) = 0.0;
      end
    end
  end

  return
end
