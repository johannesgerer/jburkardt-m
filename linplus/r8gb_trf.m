function [ a_lu, pivot, info ] = r8gb_trf ( m, n, ml, mu, a )

%*****************************************************************************80
%
%% R8GB_TRF performs a LAPACK-style PLU factorization of a R8GB matrix.
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
%    This is a simplified, standalone version of the LAPACK
%    routine R8GBTRF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix A.  0 <= M.
%
%    Input, integer N, the number of columns of the matrix A.  0 <= N.
%
%    Input, integer ML, the number of subdiagonals within the band of A.
%    0 <= ML.
%
%    Input, integer MU, the number of superdiagonals within the band of A.
%    0 <= MU.
%
%    Input, real A(2*ML+MU+1,N), the matrix A in band storage.
%
%    Output, real A_LU(2*ML+MU+1,N), information about the PLU factorization.
%
%    Output, integer PIVOT(min(M,N)), the pivot indices;
%    for 1 <= i <= min(M,N), row i of the matrix was interchanged with
%    row IPIV(i).
%
%    Output, integer INFO, error flag.
%    = 0: successful exit;
%    < 0: an input argument was illegal;
%    > 0: if INFO = +i, U(i,i) is exactly zero. The factorization
%         has been completed, but the factor U is exactly
%         singular, and division by zero will occur if it is used
%         to solve a system of equations.
%
  info = 0;
  a_lu(1:2*ml+mu+1,1:n) = a(1:2*ml+mu+1,1:n);
%
%  KV is the number of superdiagonals in the factor U, allowing for fill-in.
%
  kv = mu + ml;
%
%  Set fill-in elements in columns MU+2 to KV to zero.
%
  for j = mu + 2 : min ( kv, n )
    for i = kv - j + 2 : ml
      a_lu(i,j) = 0.0E+00;
    end
  end
%
%  JU is the index of the last column affected by the current stage
%  of the factorization.
%
  ju = 1;

  for j = 1 : min ( m, n )
%
%  Set the fill-in elements in column J+KV to zero.
%
    if ( j + kv <= n )
      a_lu(1:ml,j+kv) = 0.0;
    end
%
%  Find the pivot and test for singularity.
%  KM is the number of subdiagonal elements in the current column.
%
    km = min ( ml, m-j );

    piv = abs ( a_lu(kv+1,j) );
    jp = kv + 1;

    for i = kv + 2 : kv + km + 1
      if ( piv < abs ( a_lu(i,j) ) )
        piv = abs ( a_lu(i,j) );
        jp = i;
      end
    end

    jp = jp - kv;

    pivot(j) = jp + j - 1;

    if ( a_lu(kv+jp,j) ~= 0.0E+00 )

      ju = max ( ju, min ( j+mu+jp-1, n ) );
%
%  Apply interchange to columns J to JU.
%
      if ( jp ~= 1 )
        for i = 0 : ju - j
          t = a_lu(kv+jp-i,j+i);
          a_lu(kv+jp-i,j+i) = a_lu(kv+1-i,j+i);
          a_lu(kv+1-i,j+i) = t;
        end
      end
%
%  Compute the multipliers.
%
      if ( 0 < km )

        a_lu(kv+2:kv+km+1,j) = a_lu(kv+2:kv+km+1,j) / a_lu(kv+1,j);
%
%  Update the trailing submatrix within the band.
%
        if ( j < ju )

          for k = 1 : ju-j

            if ( a_lu(kv+1-k,j+k) ~= 0.0E+00 )

              for i = 1 : km
                a_lu(kv+i+1-k,j+k) = a_lu(kv+i+1-k,j+k) ...
                  - a_lu(kv+i+1,j) * a_lu(kv+1-k,j+k);
              end
            end
          end
        end
      end

    else
%
%  If pivot is zero, set INFO to the index of the pivot
%  unless a zero pivot has already been found.
%
      if ( info == 0 )
        info = j
      end

    end

  end

  return
end
