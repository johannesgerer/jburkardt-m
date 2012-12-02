function nz_num = r8gb_nz_num ( m, n, ml, mu, a )

%*****************************************************************************80
%
%% R8GB_NZ_NUM counts the nonzeros in a R8GB matrix.
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
%    upper bandwidth of MU+ML.  This routine will examine
%    values it finds in these extra bands, so that both unfactored
%    and factored matrices can be handled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(2*ML+MU+1,N), the R8GB matrix.
%
%    Output, integer NZ_NUM, the number of nonzero entries in A.
%
  nz_num = 0;

  for i = 1 : m
    jlo = max ( 1, i - ml );
    jhi = min ( n, i + mu + ml );
    for j = jlo : jhi
      if ( a(i-j+ml+mu+1,j) ~= 0.0 )
        nz_num = nz_num + 1;
      end
    end
  end

  return
end
