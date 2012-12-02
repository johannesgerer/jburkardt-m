function a = i4mat_elim ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_ELIM carries out exact Gauss elimination on an I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, integer A(M,N), the matrix to be Gauss eliminated.  
%
%    Output, integer A(M,N), the Gauss-eliminated matrix.
%

%
%  Initialize the swap parity counter.
%
  iswap = 1;
%
%  For each column JCOL...
%
  for jcol = 1 : min ( m, n )
%
%  Find the maximum element in rows JCOL through M.
%
    amax = abs ( a(jcol,jcol) );
    imax = jcol;

    for i = jcol + 1 : m
      if ( amax < abs ( a(i,jcol) ) )
        amax = abs ( a(i,jcol) );
        imax = i;
      end
    end
%
%  If the maximum entry is nonzero, then...
%
    if ( amax ~= 0 )
%
%  If the maximum entry does not occur in row JCOL, then swap rows.
%
      if ( imax ~= jcol )
        iswap = -iswap;
        temp(1:n) = a(jcol,1:n);
        a(jcol,1:n) = a(imax,1:n);
        a(imax,1:n) = temp(1:n);
      end
%
%  Eliminate all nonzero entries in column JCOL, below the diagonal entry.
%
      for i = jcol+1 : m

        if ( a(i,jcol) ~= 0 )

          jmult = a(i,jcol);
          imult = a(jcol,jcol);
          ifact = i4_gcd ( imult, jmult );
          imult = imult / ifact;
          jmult = jmult / ifact;

          for j = jcol : n
            a(i,j) = jmult * a(jcol,j) - imult * a(i,j);
          end

        end

      end
%
%  Remove any row or column factors.
%
      [ a, irow, icol ] = i4mat_red ( m, n, a );

    end

  end

  return
end
