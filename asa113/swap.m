function [ class, clsize, critvl, ntrans, ifault ] = swap ( varval, class, ...
  clsize, in, ik, iv, critvl, ntrans, ifault )

%*****************************************************************************80
%
%% SWAP interchanges objects between different classes to improve a criterion.
%
%  Discussion:
%
%    This routine is given a classification of objects, including the
%    number of objects in each class, and the current value of some criterion
%    which is desired to be minimized.
%
%    The routine calculates the change in criterion for all possible swaps,
%    that is, operations in which two objects in different classes exchange
%    places. Each swap that would result in a lowering of the criterion is
%    executed, and the related quantities are updated.
%
%    When no more advantageous swaps can be found, the routine returns.
%
%    The routine relies on a user-supplied routine, CRSWAP, to report the
%    expected change in the criterion for a given swap, and to carry
%    out that transfer if requested.
%
%    The variables CLASS and CRITVL have been added to the argument list
%    of CRSWAP.
%
%    Also, the order of the two classes "L" and "M" was interchanged in
%    the call to CRSWAP.  The original order was counterintuitive.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by Banfield, Bassill.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Colin Banfield, LC Bassill,
%    Algorithm AS 113:
%    A transfer for non-hierarchichal classification,
%    Applied Statistics,
%    Volume 26, Number 2, 1977, pages 206-210.
%
%  Parameters:
%
%    Input, real VARVAL(IN,IV), the data values.  There are
%    IN objects, each having spatial dimension IV.
%
%    Input, integer CLASS(IN), the initial classification of
%    each object.
%
%    Input, integer CLSIZE(IK), the initial number of objects
%    in each class.
%
%    Input, integer IN, the number of objects.
%
%    Input, integer IK, the number of classes.
%
%    Input, integer IV, the number of spatial dimensions,
%    or variates, of the objects.
%
%    Input, real CRITVL, the initial value of the criterion.
%
%    Output, integer CLASS(IN), the classification of
%    each object.
%
%    Output, integer CLSIZE(IK), the number of objects
%    in each class.
%
%    Output, real CRITVL, the current value of the criterion.
%
%    Output, integer NTRANS, the number of transfers executed.
%
%    Output, integer IFAULT, error indicator.
%    0, no error detected.
%    1, the number of classes was less than 2.
%    2, the number of objects was less than the number of classes.
%
  eps = 1.0E-38;
  ntrans = 0;

  if ( ik <= 1 )
    ifault = 1
    return
  end

  if ( in <= ik )
    ifault = 2;
    return
  end

  ifault = 0;
  icount = 0;
  itop = ( in * ( in - 1 ) ) / 2;

  i = 1;

  while ( 1 )

    i = i + 1;

    if ( itop <= icount )
      break
    end

    if ( in < i )
      i = 1;
      continue
    end

    l = class(i);
    k = l;
    it = i - 1;
%
%  Test the swap of object I from class M to L,
%  and object J from class L to M.
%
    for j = 1 : it

      icount = icount + 1;
      m = class(j);

      if ( l ~= j )

        if ( clsize(l) ~= 1 | clsize(m) ~= 1 )

          iswitch = 1;
          inc = crswap ( varval, class, clsize, in, ik, iv, critvl, ...
            i, j, l, m, iswitch );

          if ( inc < - eps )

            critvl = critvl + inc;
            icount = 0;

            iswitch = 2;
            crswap ( varval, class, clsize, in, ik, iv, critvl, ...
              i, j, l, m, iswitch );

            ntrans = ntrans + 1;
            class(i) = m;
            class(j) = l;
            l = m;

          end

        end
      end

    end

  end

  return
end
