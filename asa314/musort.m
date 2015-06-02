function [ mat, imat, rmod, cmod, rsort, csort ] = musort ( mat, imat, rmod, ...
  cmod, rsort, csort, nrow )

%*****************************************************************************80
%
%% MUSORT unsorts the inverse matrix rows and columns into the original order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    Original FORTRAN77 version by Roger Payne.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Payne,
%    Inversion of matrices with contents subject to modulo arithmetic,
%    Applied Statistics,
%    Volume 46, Number 2, 1997, pages 295-298.
%
%  Parameters:
%
%    Input/output, integer MAT(NROW*NROW).
%    On output, the matrix has been "unsorted".
%
%    Input/output, integer IMAT(NROW*NROW).
%    On output, the matrix has been "unsorted".
%
%    Input/output, integer RMOD(NROW), the modulus for values in
%    each row.  On output, these have been restored to their original ordering.
%
%    Input/output, integer CMOD(NROW), the modulus for values in
%    each column.  On output, these have been restored to their original
%    ordering.
%
%    Input/output, integer RSORT(NROW), the sorted row indices.
%
%    Input/output, integer CSORT(NROW), the sorted column indices.
%
%    Input, integer NROW, the order of the matrix.
%

%
%  Sort rows of inverse (= columns of original).
%
  for irc = 1 : nrow
%
%  Find next row.
%
    if ( csort(irc) ~= irc )

      for jrc = irc + 1 : nrow
        if ( csort(jrc) == irc )
          break
        end
      end

      i = cmod(irc);
      cmod(irc) = cmod(jrc);
      cmod(jrc) = i;

      i = csort(irc);
      csort(irc) = csort(jrc);
      csort(jrc) = i;
%
%  Switch rows.
%
      kirc = ( irc - 1 ) * nrow;
      kjrc = ( jrc - 1 ) * nrow;

      for j = 1 : nrow
        i = imat(kirc+j);
        imat(kirc+j) = imat(kjrc+j);
        imat(kjrc+j) = i;
      end

    end

  end
%
%  Sort the columns of the inverse (= rows of original).
%
  for irc = 1 : nrow
%
%  Find the next column.
%
    if ( rsort(irc) ~= irc )

      for jrc = irc + 1 : nrow
        if ( rsort(jrc) == irc )
          break;
        end
      end

      i = rmod(irc);
      rmod(irc) = rmod(jrc);
      rmod(jrc) = i;

      i = rsort(irc);
      rsort(irc) = rsort(jrc);
      rsort(jrc) = i;
%
%  Switch the columns of IMAT.
%
      for j = 0 : nrow : nrow * nrow - 1
        i = imat(irc+j);
        imat(irc+j) = imat(jrc+j);
        imat(jrc+j) = i;
      end
%
%  Switch the diagonal elements of MAT (others are zero).
%
      kirc = ( irc - 1 ) * nrow + irc;
      kjrc = ( jrc - 1 ) * nrow + jrc;

      i = mat(kirc);
      mat(kirc) = mat(kjrc);
      mat(kjrc) = i;

    end

  end

  return
end
