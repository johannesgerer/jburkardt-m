function hb_values_print ( ncol, colptr, mxtype, nnzero, neltvl, values )

%*****************************************************************************80
%
%% HB_VALUES_PRINT prints the values of an HB matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer NCOL, the number of columns.
%
%    Input, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Input, character ( len = 3 ) MXTYPE, the matrix type.
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Input, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    If MXTYPE(3:3) == 'A':
%
%      Input, real VALUES(NNZERO), the nonzero values of the matrix.
%
%    If MXTYPE(3:3) == 'E':
%
%      Input, real VALUES(NELTVL), the nonzero values of the matrix.
%
  if ( mxtype(3) == 'A' )

    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      'Column Begin   End   ----------------------------------------\n' );
    fprintf ( 1, '\n' );

    for j = 1 : ncol

      if ( 5 < j & j < ncol )
        continue
      end

      if ( j == ncol & 6 < ncol )
        fprintf ( 1, '(Skipping intermediate columns...)\n' );
      end

      if ( colptr(j+1)-1 < colptr(j) )

        fprintf ( 1, '%6d   EMPTY\n', j );

      else

        for klo = colptr(j) : 4 : colptr(j+1)-1
          khi = min ( klo + 3, colptr(j+1)-1 );
          if ( klo == colptr(j) )
            fprintf ( 1, '%5d%5d%5d   ', j, colptr(j), colptr(j+1)-1 );
          else
            fprintf ( 1, '                  ' );
          end
          for k = klo : khi
            fprintf ( 1, '%12f  ', values(k) );
          end
          fprintf ( 1, '\n' );
        end

      end

    end

    fprintf ( 1, ...
      '                     ----------------------------------------\n' );

  elseif ( mxtype(3) == 'E' )

    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      'Column Begin   End   ----------------------------------------\n' );
    fprintf ( 1, ...
      '                     ----------------------------------------\n' );

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I have not thought about how to print an\n' );
    fprintf ( 1, 'unassembled matrix yet!\n' );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'HB_VALUES_PRINT - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of MXTYPE(3:3) = %c\n', mxtype(3) );
    error ( 'HB_VALUES_PRINT - Fatal error!' );

  end

  return
end
