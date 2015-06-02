function [ mat, rmod, cmod, rsort, csort ] = msort ( mat, imat, rmod, cmod, ...
  nrow )

%*****************************************************************************80
%
%% MSORT sorts matrix rows and columns in ascending order of moduli.
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
%    On output, the matrix has been sorted.
%
%    Ignoreput, integer IMAT(NROW*NROW).
%    This quantity is ignored.
%
%    Input/output, integer ( kind = 4 ) RMOD(NROW), the modulus for values in
%    each row.  On output, these have been rearranged according to the sorting.
%
%    Input/output, integer ( kind = 4 ) CMOD(NROW), the modulus for values in
%    each column.  On output, these have been rearranged according to the
%    sorting.
%
%    Output, integer ( kind = 4 ) RSORT(NROW), the sorted row indices.
%
%    Output, integer ( kind = 4 ) CSORT(NROW), the sorted column indices.
%
%    Input, integer ( kind = 4 ) NROW, the order of the matrix.
%

%
%  Initialize row and column addresses.
%
  rsort = ( 1 : nrow );
  csort = ( 1 : nrow );
%
%  Sort the rows.
%
  for irc = 1 : nrow
%
%  Find the next row.
%
    jrc = irc;
    p = rmod(irc);

    for i = irc + 1 : nrow
      if ( rmod(i) < p )
        p = rmod(i);
        jrc = i;
      end
    end

    if ( irc ~= jrc )

      i = rmod(irc);
      rmod(irc) = rmod(jrc);
      rmod(jrc) = i;

      i = rsort(irc);
      rsort(irc) = rsort(jrc);
      rsort(jrc) = i;
%
%  Switch the rows.
%
      kirc = ( irc - 1 ) * nrow;
      kjrc = ( jrc - 1 ) * nrow;

      for j = 1 : nrow
        i = mat(kirc+j);
        mat(kirc+j) = mat(kjrc+j);
        mat(kjrc+j) = i;
      end

    end

  end
%
%  Sort the columns.
%
  for irc = 1 : nrow
%
%  Find the next column.
%
    jrc = irc;
    p = cmod(irc);

    for i = irc + 1 : nrow
      if ( cmod(i) < p )
        p = cmod(i);
        jrc = i;
      end
    end

    if ( irc ~= jrc )

      i = cmod(irc);
      cmod(irc) = cmod(jrc);
      cmod(jrc) = i;

      i = csort(irc);
      csort(irc) = csort(jrc);
      csort(jrc) = i;
%
%  Switch the columns.
%
      for j = 0 : nrow : nrow * nrow - 1
        i = mat(irc+j);
        mat(irc+j) = mat(jrc+j);
        mat(jrc+j) = i;
      end

    end

  end

  return
end
