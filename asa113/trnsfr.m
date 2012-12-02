function [ class, clsize, critvl, ntrans, ifault ] = trnsfr ( varval, class, ...
  clsize, in, ik, iv, critvl )

%*****************************************************************************80
%
%% TRNSFR transfers objects between classes to improve a criterion.
%
%  Discussion:
%
%    This routine is given a classification of objects, including the
%    number of objects in each class, and the current value of some criterion
%    which is desired to be minimized.
%
%    The routine calculates the change in criterion for all possible transfers
%    of any object from its current class to a different class.  Each transfer
%    that would result in a lowering of the criterion is executed, and the
%    related quantities are updated.
%
%    When no more advantageous transfers can be found, the routine returns.
%
%    The routine relies on a user-supplied routine, CRTRAN, to report the
%    expected change in the criterion for a given transfer, and to carry
%    out that transfer if requested.
%
%    The variables CLASS and CRITVL have been added to the argument list
%    of CRTRAN.
%
%    Also, the order of the two classes "L" and "M" was interchanged in
%    the call to CRTRAN.  The original order was counterintuitive.
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
%    Input, real VARVAL(IN,IV), the data values.  There are IN
%    objects, each having spatial dimension IV.
%
%    Input, integer CLASS(IN), the initial classification of
%    each object.
%
%    Input, integer CLSIZE(IK), the initial number of objects in
%    each class.
%
%    Input, integer IN, the number of objects.
%
%    Input, integer IK, the number of classes.
%
%    Input, integer IV, the number of spatial dimensions, or
%    variates, of the objects.
%
%    Input, real CRITVL, the initial value of the criterion.
%
%    Output, integer CLASS(IN), the classification of
%    each object.
%
%    Output, integer CLSIZE(IK), the number of objects in
%    each class.
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
    ifault = 1;
    return
  end

  if ( in <= ik )
    ifault = 2;
    return
  end

  ifault = 0;
  i = 0;
  icount = 0;

  while ( 1 )

    i = i + 1;

    if ( in <= icount )
      break;
    end

    if ( in < i )
      i = 0;
      icount = 0;
      continue
    end

    m = class(i);
    if ( clsize(m) <= 1 )
      icount = icount + 1;
      continue
    end

    inco = - eps;
    lo = m;
%
%  Test the transfer of object I from class M to class L.
%
    for l = 1 : ik

      if ( l ~= m )

        iswitch = 1;
        inc = crtran ( varval, class, clsize, in, ik, iv, critvl, ...
          i, m, l, iswitch );
%
%  Remember the values of L and INC.
%
        if ( inc < inco )
          lo = l;
          inco = inc;
        end

      end

    end

    icount = icount + 1;
%
%  Execute the transfer of object I from class M to class LO.
%
    if ( lo ~= m )

      l = lo;
      critvl = critvl + inco;
      icount = 0;

      iswitch = 2;
       crtran ( varval, class, clsize, in, ik, iv, critvl, ...
        i, m, l, iswitch );

      ntrans = ntrans + 1;
      class(i) = l;
      clsize(l) = clsize(l) + 1;
      clsize(m) = clsize(m) - 1;

    end

  end

  return
end
