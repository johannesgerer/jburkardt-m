function [ key, seed, matrix, ierror ] = rcont2 ( nrow, ncol, nrowt, ncolt, ...
  key, seed )

%*****************************************************************************80
%
%% RCONT2 constructs a random two-way contingency table with given sums.
%
%  Discussion:
%
%    It is possible to specify row and column sum vectors which
%    correspond to no table at all.  As far as I can see, this routine does
%    not detect such a case.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2009
%
%  Author:
%
%    Original FORTRAN77 version by WM Patefield.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    WM Patefield,
%    Algorithm AS 159:
%    An Efficient Method of Generating RXC Tables with
%    Given Row and Column Totals,
%    Applied Statistics,
%    Volume 30, Number 1, 1981, pages 91-97.
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns
%    in the table.  NROW and NCOL must each be at least 2.
%
%    Input, integer NROWT(NROW), NCOLT(NCOL), the row and column
%    sums.  Each entry must be positive.
%
%    Input, logical KEY, a flag that indicates whether data has
%    been initialized for this problem.  Set KEY = .FALSE. before the first
%    call.
%
%    Input, integer SEED, a seed for the random number
%    generator.
%
%    Output, logical KEY, a flag that indicates whether data has
%    been initialized for this problem.  Set KEY = .FALSE. before the first
%    call.
%
%    Output, integer SEED, a seed for the random number
%    generator.
%
%    Output, integer MATRIX(NROW,NCOL), the matrix.
%
%    Output, integer IERROR, an error flag, which is returned
%    as 0 if no error occurred.
%

  persistent fact;
  persistent ntotal;

  ierror = 0;
%
%  On user's signal, set up the factorial table.
%
  if ( ~key )

    key = 1;

    if ( nrow <= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RCONT - Fatal error!\n' );
      fprintf ( 1, '  Input number of rows is less than 2.\n' );
      ierror = 1;
      return
    end

    if ( ncol <= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RCONT - Fatal error!\n' );
      fprintf ( 1, '  The number of columns is less than 2.\n' );
      ierror = 2;
      return
    end

    for i = 1 : nrow
      if ( nrowt(i) <= 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'RCONT - Fatal error!\n' );
        fprintf ( 1, '  An entry in the row sum vector is not positive.\n' );
        ierror = 3;
        return
      end
    end

    for j = 1 : ncol
      if ( ncolt(j) <= 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'RCONT - Fatal error!\n' );
        fprintf ( 1, '  An entry in the column sum vector is not positive.\n' );
        ierror = 4;
        return
      end
    end

    if ( sum ( ncolt(1:ncol) ) ~= sum ( nrowt(1:nrow) ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RCONT - Fatal error!\n' );
      fprintf ( 1, '  The row and column sum vectors do not have the same sum.\n' );
      ierror = 6;
      return
    end

    ntotal = sum ( ncolt(1:ncol) );

    fact = zeros(ntotal,1);
%
%  Calculate log-factorials.
%
    x = 0.0;
    fact(1) = 0.0;
    for i = 1 : ntotal
      x = x + log ( i );
      fact(i+1) = x;
    end

  end
%
%  Construct a random matrix.
%
  jwork(1:ncol-1) = ncolt(1:ncol-1);

  jc = ntotal;

  for l = 1 : nrow - 1

    nrowtl = nrowt(l);
    ia = nrowtl;
    ic = jc;
    jc = jc - nrowtl;

    for m = 1 : ncol - 1

      id = jwork(m);
      ie = ic;
      ic = ic - id;
      ib = ie - ia;
      ii = ib - id;
%
%  Test for zero entries in matrix.
%
      if ( ie == 0 )
        ia = 0;
        matrix(l,m:ncol) = 0;
        break
      end
%
%  Generate a pseudo-random number.
%
      [ r, seed ] = r8_uniform_01 ( seed );
%
%  Compute the conditional expected value of MATRIX(L,M).
%
      done1 = 0;

      while ( 1 );

        nlm = floor ( ia * id / ie + 0.5 );
        iap = ia + 1;
        idp = id + 1;
        igp = idp - nlm;
        ihp = iap - nlm;
        nlmp = nlm + 1;
        iip = ii + nlmp;
        x = exp ( fact(iap) + fact(ib+1) + fact(ic+1) + fact(idp) - ...
          fact(ie+1) - fact(nlmp) - fact(igp) - fact(ihp) - fact(iip) );

        if ( r <= x )
          break;
        end

        sumprb = x;
        y = x;
        nll = nlm;
        lsp = 0;
        lsm = 0;
%
%  Increment entry in row L, column M.
%
        while ( ~lsp )

          j = ( id - nlm ) * ( ia - nlm );

          if ( j == 0 )

            lsp = 1;

          else

            nlm = nlm + 1;
            x = x * j / ( nlm * ( ii + nlm ) );
            sumprb = sumprb + x;

            if ( r <= sumprb )
              done1 = 1;
              break
            end

          end

          done2 = 0;

          while ( ~lsm )
%
%  Decrement the entry in row L, column M.
%
            j = nll * ( ii + nll );

            if ( j == 0 )
              lsm = 1;
              break
            end

            nll = nll - 1;
            y = y * j / ( ( id - nll ) * ( ia - nll ) );
            sumprb = sumprb + y;

            if ( r <= sumprb )
              nlm = nll;
              done2 = 1;
              break
            end

            if ( ~lsp )
              break
            end

          end

          if ( done2 )
            break
          end

        end

        if ( done1 )
          break
        end

        if ( done2 )
          break
        end

        [ r, seed ] = r8_uniform_01 ( seed );
        r = sumprb * r;

      end

      matrix(l,m) = nlm;
      ia = ia - nlm;
      jwork(m) = jwork(m) - nlm;

    end

    matrix(l,ncol) = ia;

  end
%
%  Compute the last row.
%
  matrix(nrow,1:ncol-1) = jwork(1:ncol-1);
  matrix(nrow,ncol) = ib - matrix(nrow,ncol-1);

  return
end
