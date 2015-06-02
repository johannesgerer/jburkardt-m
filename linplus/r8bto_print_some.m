function r8bto_print_some ( m, l, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8BTO_PRINT_SOME prints some of a R8BTO matrix.
%
%  Discussion:
%
%    The R8BTO storage format is for a block Toeplitz matrix. The matrix
%    can be regarded as an L by L array of blocks, each of size M by M.
%    The full matrix has order N = M * L.  The L by L matrix is Toeplitz,
%    that is, along its diagonal, the blocks repeat.
%
%    Storage for the matrix consists of the L blocks of the first row,
%    followed by the L-1 blocks of the first column (skipping the first row).
%    These items are stored in the natural way in an (M,M,2*L-1) array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the order of the blocks of the matrix A.
%
%    Input, integer L, the number of blocks in a row or column of A.
%
%    Input, real A(M,M,2*L-1), the R8BTO matrix.
%
%    Input, integer ILO, JLO, IHI, JHI, the first row and
%    column, and the last row and column to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  incx = 5;
  n = m * l;
%
%  Print the columns of the matrix, in strips of 5.
%
  for j3lo = jlo : incx : jhi

    j3hi = j3lo + incx - 1;
    j3hi = min ( j3hi, n );
    j3hi = min ( j3hi, jhi );

    inc = j3hi + 1 - j3lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j3lo : j3hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '  ---\n' );
%
%  Determine the range of the rows in this strip.
%
    i3lo = max ( ilo, 1 );
    i3hi = min ( ihi, n );

    for i = i3lo : i3hi

      fprintf ( 1, '%4d  ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j3 = 1 : inc

        j = j3lo - 1 + j3;
%
%  i = M * ( i1 - 1 ) + i2
%  j = M * ( j1 - 1 ) + j2
%
        i1 = floor ( ( i - 1 ) / m ) + 1;
        i2 = i - m * ( i1 - 1 );
        j1 = floor ( ( j - 1 ) / m ) + 1;
        j2 = j - m * ( j1 - 1 );

        if ( i1 <= j1 )
          aij = a(i2,j2,j1+1-i1);
        else
          aij = a(i2,j2,l+i1-j1);
        end

        fprintf ( 1, '%12g  ', aij );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
