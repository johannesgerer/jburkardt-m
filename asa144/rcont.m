function [ matrix, nsubt, key, ifault ] = rcont ( nrow, ncol, nrowt, ncolt, nsubt, key )

%*****************************************************************************80
%
%% RCONT generates a random two-way table with given marginal totals.
%
%  Discussion:
%
%    Each time the program is called, another table will be randomly
%    generated.
%
%    Note that it should be the case that the sum of the row totals
%    is equal to the sum of the column totals.  However, this program
%    does not check for that condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by James Boyett.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    James Boyett,
%    Algorithm AS 144:
%    Random R x C Tables with Given Row and Column Totals,
%    Applied Statistics,
%    Volume 28, Number 3, pages 329-332, 1979.
%
%  Parameters:
%
%    Input, integer NROW, the number of rows in the observed matrix.
%
%    Input, integer NCOL, the number of columns in the observed matrix.
%
%    Input, integer NROWT(NROW), the row totals of the observed matrix.
%
%    Input, integer NCOLT(NCOL), the column totals of the observed matrix.
%
%    Input, integer NSUBT(NCOL), used by RCONT for partial column sums.
%    Must not be changed by the calling program.
%
%    Input, logical KEY, should be set to FALSE by the user before
%    the initial call.  RCONT will reset it to TRUE, and it should be left
%    at that value for subsequent calls in which the same values of NROW,
%    NCOL, NROWT and NCOLT are being used.
%
%    Output, integer MATRIX(NROW,NCOL), the randomly generated matrix.
%
%    Output, integer NSUBT(NCOL), used by RCONT for partial column sums.
%    Must not be changed by the calling program.
%
%    Output, logical KEY, reset to TRUE by RCONT, and should be left
%    at that value for subsequent calls in which the same values of NROW,
%    NCOL, NROWT and NCOLT are being used.
%
%    Output, integer IFAULT, fault indicator.
%    0, no error occured.
%    1, NROW <= 0.
%    2, NCOL <= 1.
%    3, some entry of NROWT is less than 0.
%    4, some entry of NCOLT is less than 0.
%    5, the sample size (sum of the column totals) is too large.
%
  persistent ntotal;
  persistent nvect;
  persistent seed;

  ifault = 0;

  if ( ~key )
%
%  Set KEY for subsequent calls.
%
    key = 1;
    seed = 123456789;
%
%  Check for faults and prepare for future calls.
%
    if ( nrow <= 0 )
      ifault = 1;
      return
    end

    if ( ncol <= 1 )
      ifault = 2;
      return
    end

    for i = 1 : nrow
      if ( nrowt(i) <= 0 )
        ifault = 3;
        return
      end
    end

    if ( ncolt(1) <= 0 )
      ifault = 4;
      return
    end

    nsubt(1) = ncolt(1);

    for j = 2 : ncol

      if ( ncolt(j) <= 0 )
        ifault = 4;
        return
      end

      nsubt(j) = nsubt(j-1) + ncolt(j);

    end

    ntotal = nsubt(ncol);
%
%  Initialize vector to be permuted.
%
    for i = 1 : ntotal
      nvect(i) = i;
    end

  end
%
%  Initialize vector to be permuted.
%
  for i = 1 : ntotal
    nnvect(i) = nvect(i);
  end
%
%  Permute vector.
%
  ntemp = ntotal;
  for i = 1 : ntotal
    noct = floor ( r8_uniform_01 ( seed ) * ntemp + 1.0 );
    nvect(i) = nnvect(noct);
    nnvect(noct) = nnvect(ntemp);
    ntemp = ntemp - 1;
  end
%
%  Construct random matrix.
%
  for i = 1 : nrow
    for j = 1 : ncol
      matrix(i,j) = 0;
    end
  end

  ii = 1;

  for i = 1 : nrow

    limit = nrowt(i);

    for k = 1 : limit

      for j = 1 : ncol
        if ( nvect(ii) <= nsubt(j) )
          ii = ii + 1;
          matrix(i,j) = matrix(i,j) + 1;
          break
        end
      end

    end

  end

  return
end
