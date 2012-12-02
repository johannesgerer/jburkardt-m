function [ xmin, ynewlo, icount, numres, ifault ] = nelmin ( fn, n, start, ...
  reqmin, step, konvge, kcount )

%*****************************************************************************80
%
%% NELMIN minimizes a function using the Nelder-Mead algorithm.
%
%  Discussion:
%
%    This routine seeks the minimum value of a user-specified function.
%
%    Simplex function minimisation procedure due to Nelder+Mead(1965),
%    as implemented by O'Neill(1971, Appl.Statist. 20, 338-45), with
%    subsequent comments by Chambers+Ertel(1974, 23, 250-1), Benyon(1976,
%    25, 97) and Hill(1978, 27, 380-2)
%
%    The function to be minimized must have the form:
%
%      function value = fn ( x )
%
%    where X is a vector, and VALUE is the (scalar) function value.
%    The name of this function must be passed as the argument FN.
%
%    This routine does not include a termination test using the
%    fitting of a quadratic surface.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2011
%
%  Author:
%
%    Original FORTRAN77 version by R ONeill.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    John Nelder, Roger Mead,
%    A simplex method for function minimization,
%    Computer Journal,
%    Volume 7, 1965, pages 308-313.
%
%    R ONeill,
%    Algorithm AS 47:
%    Function Minimization Using a Simplex Procedure,
%    Applied Statistics,
%    Volume 20, Number 3, 1971, pages 338-345.
%
%  Parameters:
%
%    Input, real value = FN ( X ), the name of the MATLAB function which 
%    evaluates the function to be minimized, preceded by an "@" sign.
%
%    Input, integer N, the number of variables.
%
%    Input, real START(N).  On input, a starting point
%    for the iteration.  On output, this data may have been overwritten.
%
%    Input, real REQMIN, the terminating limit for the variance
%    of function values.
%
%    Input, real STEP(N), determines the size and shape of the
%    initial simplex.  The relative magnitudes of its elements should reflect
%    the units of the variables.
%
%    Input, integer KONVGE, the convergence check is carried out
%    every KONVGE iterations.
%
%    Input, integer KCOUNT, the maximum number of function
%    evaluations.
%
%    Output, real XMIN(N), the coordinates of the point which
%    is estimated to minimize the function.
%
%    Output, real YNEWLO, the minimum value of the function.
%
%    Output, integer ICOUNT, the number of function evaluations.
%
%    Output, integer NUMRES, the number of restarts.
%
%    Output, integer IFAULT, error indicator.
%    0, no errors detected.
%    1, REQMIN, N, or KONVGE has an illegal value.
%    2, iteration terminated because KCOUNT was exceeded without convergence.
%
  xmin = [];
  ynewlo = [];
  icount = 0;
  numres = 0;

  ccoeff = 0.5;
  ecoeff = 2.0;
  eps = 0.001;
  rcoeff = 1.0;
%
%  Check the input parameters.
%
  if ( reqmin <= 0.0 )
    ifault = 1;
    return
  end

  if ( n < 1 )
    ifault = 1;
    return
  end

  if ( konvge < 1 )
    ifault = 1;
    return
  end

  jcount = konvge;
  dn = n;
  nn = n + 1;
  dnn = nn;
  del = 1.0;
  rq = reqmin * dn;
%
%  Initial or restarted loop.
%
  while ( 1 )

    for i = 1 : n
      p(i,nn) = start(i);
    end

    y(nn) = fn ( start );
    icount = icount + 1;

    for j = 1 : n
      x = start(j);
      start(j) = start(j) + step(j) * del;
      for i = 1 : n
        p(i,j) = start(i);
      end
      y(j) = fn ( start );
      icount = icount + 1;
      start(j) = x;
    end
%
%  The simplex construction is complete.
%
%  Find highest and lowest Y values.  YNEWLO = Y(IHI) indicates
%  the vertex of the simplex to be replaced.
%
    ylo = y(1);
    ilo = 1;

    for i = 2 : nn
      if ( y(i) < ylo )
        ylo = y(i);
        ilo = i;
      end
    end
%
%  Inner loop.
%
    while ( 1 )

      if ( kcount <= icount )
        break
      end

      ynewlo = y(1);
      ihi = 1;

      for i = 2 : nn
        if ( ynewlo < y(i) )
          ynewlo = y(i);
          ihi = i;
        end
      end
%
%  Calculate PBAR, the centroid of the simplex vertices
%  excepting the vertex with Y value YNEWLO.
%
      for i = 1 : n
        z = 0.0;
        for j = 1 : nn
          z = z + p(i,j);
        end
        z = z - p(i,ihi);
        pbar(i) = z / dn;
      end
%
%  Reflection through the centroid.
%
      for i = 1 : n
        pstar(i) = pbar(i) + rcoeff * ( pbar(i) - p(i,ihi) );
      end

      ystar = fn ( pstar );
      icount = icount + 1;
%
%  Successful reflection, so extension.
%
      if ( ystar < ylo )

        for i = 1 : n
          p2star(i) = pbar(i) + ecoeff * ( pstar(i) - pbar(i) );
        end

        y2star = fn ( p2star );
        icount = icount + 1;
%
%  Check extension.
%
        if ( ystar < y2star )

          for i = 1 : n
            p(i,ihi) = pstar(i);
          end

          y(ihi) = ystar;
%
%  Retain extension or contraction.
%
        else

          for i = 1 : n
            p(i,ihi) = p2star(i);
          end

          y(ihi) = y2star;

        end
%
%  No extension.
%
      else

        l = 0;
        for i = 1 : nn
          if ( ystar < y(i) )
            l = l + 1;
          end
        end

        if ( 1 < l )

          for i = 1 : n
            p(i,ihi) = pstar(i);
          end

          y(ihi) = ystar;
%
%  Contraction on the Y(IHI) side of the centroid.
%
        elseif ( l == 0 )

          for i = 1 : n
            p2star(i) = pbar(i) + ccoeff * ( p(i,ihi) - pbar(i) );
          end

          y2star = fn ( p2star );
          icount = icount + 1;
%
%  Contract the whole simplex.
%
          if ( y(ihi) < y2star )

            for j = 1 : nn
              for i = 1 : n
                p(i,j) = ( p(i,j) + p(i,ilo) ) * 0.5;
                xmin(i) = p(i,j);
              end
              y(j) = fn ( xmin );
              icount = icount + 1;
            end

            ylo = y(1);
            ilo = 1;

            for i = 2 : nn
              if ( y(i) < ylo )
                ylo = y(i);
                ilo = i;
              end
            end

            continue
%
%  Retain contraction.
%
          else

            for i = 1 : n
              p(i,ihi) = p2star(i);
            end
            y(ihi) = y2star;

          end
%
%  Contraction on the reflection side of the centroid.
%
        elseif ( l == 1 )

          for i = 1 : n
            p2star(i) = pbar(i) + ccoeff * ( pstar(i) - pbar(i) );
          end

          y2star = fn ( p2star );
          icount = icount + 1;
%
%  Retain reflection?
%
          if ( y2star <= ystar )

            for i = 1 : n
              p(i,ihi) = p2star(i);
            end
            y(ihi) = y2star;

          else

            for i = 1 : n
              p(i,ihi) = pstar(i);
            end
            y(ihi) = ystar;

          end

        end

      end
%
%  Check if YLO improved.
%
      if ( y(ihi) < ylo )
        ylo = y(ihi);
        ilo = ihi;
      end

      jcount = jcount - 1;

      if ( 0 < jcount )
        continue
      end
%
%  Check to see if minimum reached.
%
      if ( icount <= kcount )

        jcount = konvge;

        z = 0.0;
        for i = 1 : nn
          z = z + y(i);
        end
        x = z / dnn;

        z = 0.0;
        for i = 1 : nn
          z = z + ( y(i) - x )^2;
        end

        if ( z <= rq )
          break
        end

      end

    end
%
%  Factorial tests to check that YNEWLO is a local minimum.
%
    for i = 1 : n
      xmin(i) = p(i,ilo);
    end

    ynewlo = y(ilo);

    if ( kcount < icount )
      ifault = 2;
      break
    end

    ifault = 0;

    for i = 1 : n
      del = step(i) * eps;
      xmin(i) = xmin(i) + del;
      z = fn ( xmin );
      icount = icount + 1;
      if ( z < ynewlo )
        ifault = 2;
        break
      end
      xmin(i) = xmin(i) - del - del;
      z = fn ( xmin );
      icount = icount + 1;
      if ( z < ynewlo )
        ifault = 2;
        break
      end
      xmin(i) = xmin(i) + del;
    end

    if ( ifault == 0 )
      break
    end
%
%  Restart the procedure.
%
    for i = 1 : n
      start(i) = xmin(i);
    end

    del = eps;
    numres = numres + 1;

  end

  return
end
