function xfat = r8block_expand_linear ( l, m, n, x, lfat, mfat, nfat )

%*****************************************************************************80
%
%% R8BLOCK_EXPAND_LINEAR linearly interpolates new data into an R8BLOCK.
%
%  Discussion:
%
%    In this routine, the expansion is specified by giving the number
%    of intermediate values to generate between each pair of original
%    data rows and columns.
%
%    The interpolation is not actually linear.  It uses the functions
%
%      1, x, y, z, xy, xz, yz, xyz.
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
%    Input, integer L, M, N, the dimensions of the input data.
%
%    Input, real X(L,M,N), the original data.
%
%    Input, integer LFAT, MFAT, NFAT, the number of data values to interpolate
%    original data values in the first, second and third dimensions.
%
%    Output, real XFAT(L2,M2,N2), the fattened data, where
%    L2 = (L-1)*(LFAT+1)+1,
%    M2 = (M-1)*(MFAT+1)+1,
%    N2 = (N-1)*(NFAT+1)+1.
%
  for i = 1 : l

    if ( i < l )
      ihi = lfat;
    else
      ihi = 0;
    end

    for j = 1 : m

      if ( j < m )
        jhi = mfat;
      else
        jhi = 0;
      end

      for k = 1 : n

        if ( k < n )
          khi = nfat;
        else
          khi = 0;
        end

        if ( i < l )
          ip1 = i+1;
        else
          ip1 = i;
        end

        if ( j < m )
          jp1 = j+1;
        else
          jp1 = j;
        end

        if ( k < n )
          kp1 = k+1;
        else
          kp1 = k;
        end

        x000 = x(i,j,k);
        x001 = x(i,j,kp1);
        x100 = x(ip1,j,k);
        x101 = x(ip1,j,kp1);
        x010 = x(i,jp1,k);
        x011 = x(i,jp1,kp1);
        x110 = x(ip1,jp1,k);
        x111 = x(ip1,jp1,kp1);

        for ii = 0 : ihi

          r = ii / ( ihi + 1 );

          for jj = 0 : jhi

            s = jj / ( jhi + 1 );

            for kk = 0 : khi

              t = kk / ( khi + 1 );

              iii = 1 + ( i - 1 ) * ( lfat + 1 ) + ii;
              jjj = 1 + ( j - 1 ) * ( mfat + 1 ) + jj;
              kkk = 1 + ( k - 1 ) * ( nfat + 1 ) + kk;

              xfat(iii,jjj,kkk) = ...
                  x000 * ( 1.0 - r ) * ( 1.0 - s ) * ( 1.0 - t ) ...
                + x001 * ( 1.0 - r ) * ( 1.0 - s ) * (       t ) ...
                + x010 * ( 1.0 - r ) * (       s ) * ( 1.0 - t ) ...
                + x011 * ( 1.0 - r ) * (       s ) * (       t ) ...
                + x100 * (       r ) * ( 1.0 - s ) * ( 1.0 - t ) ...
                + x101 * (       r ) * ( 1.0 - s ) * (       t ) ...
                + x110 * (       r ) * (       s ) * ( 1.0 - t ) ...
                + x111 * (       r ) * (       s ) * (       t );

            end
          end
        end
      end
    end
  end

  return
end
