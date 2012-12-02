function xfat = r8mat_expand_linear ( m, n, x, mfat, nfat )

%*****************************************************************************80
%
%% R8MAT_EXPAND_LINEAR linearly interpolates new data into an R8MAT.
%
%  Discussion:
%
%    In this routine, the expansion is specified by giving the number
%    of intermediate values to generate between each pair of original
%    data rows and columns.
%
%    The interpolation is not actually linear.  It uses the functions
%
%      1, x, y, and xy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of input data.
%
%    Input, real X(M,N), the original data.
%
%    Input, integer MFAT, NFAT, the number of data values to interpolate
%    between each row, and each column, of original data values.
%
%    Output, real XFAT(M2,N2), the fattened data, where
%    M2 = (M-1)*(MFAT+1)+1,
%    N2 = (N-1)*(NFAT+1)+1.
%
  for i = 1 : m

    if ( i < m )
      ihi = mfat;
    else
      ihi = 0;
    end

    for j = 1 : n

      if ( j < n )
        jhi = nfat;
      else
        jhi = 0;
      end

      if ( i < m )
        ip1 = i+1;
      else
        ip1 = i;
      end

      if ( j < n )
        jp1 = j+1;
      else
        jp1 = j;
      end

      x00 = x(i,j);
      x10 = x(ip1,j);
      x01 = x(i,jp1);
      x11 = x(ip1,jp1);

      for ii = 0 : ihi

        s = ii / ( ihi + 1 );

        for jj = 0 : jhi

          t = jj / ( jhi + 1 );

          iii = 1 + ( i - 1 ) * ( mfat + 1 ) + ii;
          jjj = 1 + ( j - 1 ) * ( nfat + 1 ) + jj;

          xfat(iii,jjj) = ...
                                            x00   ...
              + s     * (       x10       - x00 ) ...
              + t     * (             x01 - x00 ) ...
              + s * t * ( x11 - x10 - x01 + x00 );

        end

      end

    end

  end

  return
end
