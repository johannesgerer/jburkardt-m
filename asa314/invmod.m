function [ imat, mat, ifault ] = invmod ( mat, rmod, cmod, nrow, ifault )

%*****************************************************************************80
%
%% INVMOD inverts a matrix using modulo arithmetic.
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
%    On input, the matrix to be inverted.
%    On output, the product of the input matrix and IMAT.
%
%    Output, integer IMAT(NROW*NROW), the inverse matrix.
%    If IFAULT = -1 on output, then IMAT is only a left inverse.
%
%    Input, integer RMOD(NROW), the modulus for values in each row.
%
%    Input, integer CMOD(NROW), the modulus for values
%    in each column.
%
%    Input, integer NROW, the order of the matrix.
%
%    Output, integer IFAULT, an error flag.
%    0, no error was detected.
%    -1, only a left inverse could be formed.
%    1, the matrix contains elements that are negative, or too large.
%    2, the matrix contains nonzero elements in mixed modulus positions.
%    3, the matrix cannot be inverted.
%
  imat = [];
%
%  Check that elements in 'mixed-moduli' positions are all zero.
%
  n = 0;
  for i = 1 : nrow
    for j = 1 : nrow

      n = n + 1;

      if ( ( rmod(i) ~= cmod(j) ) && ( 0 < mat(n) ) )
        ifault = 2;
        return
      end

      if ( ( rmod(i) < mat(n) ) || ( mat(n) < 0 ) )
        ifault = 1;
        return
      end

    end
  end

  n = 0;
  for i = 1 : nrow
    for j = 1 : nrow
      n = n + 1;
      imat(n) = 0;
    end
  end
%
%  Sort rows and columns into ascending order of moduli
%
  [ mat, rmod, cmod, rsort, csort ] = msort ( mat, imat, rmod, cmod, nrow );
%
%  Complete initialization of inverse matrix
%
  for n = 1 : nrow + 1 : nrow * nrow
    imat(n) = 1;
  end
%
%  Invert the matrix.
%
  for ir = 1 : nrow

    kir = ( ir - 1 ) * nrow;

    if ( mat(kir+ir) == 0 )
%
%  Find a row JR below IR such that K(JR,IR)>0
%
      all_zero = 1;

      for kjr = kir + nrow + ir : nrow : nrow * nrow
        if ( 0 < mat(kjr) )
          all_zero = 0;
          break;
        end
      end
%
%  Column IR contains all zeros in rows IR or below:
%  look for a row above with zeros to left of column IR
%  and K(JR,IR)>0
%
      if ( all_zero )
        for kjr = ir : nrow : kir
          if ( 0 < mat(kjr) )
            for i = kjr - ir + 1 : kjr - 1
              if ( 0 < mat(i) )
                ifault = 3;
                return
              end
            end
            all_zero = 0;
            break
          end
        end
      end
%
%  Column IR contains all zeros
%
      if ( all_zero )
        continue;
      end
%
%  Switch row JR with row IR
%
      kjr = kjr - ir;

      for i = 1 : nrow

        k = mat(kir+i);
        mat(kir+i) = mat(kjr+i);
        mat(kjr+i) = k;

        k = imat(kir+i);
        imat(kir+i) = imat(kjr+i);
        imat(kjr+i) = k;

      end

    end
%
%  Find a multiplier N such that N*MAT(IR,IR)=1 mod(P{IR})
%
    k = mat(kir+ir);
    for n = 1 : rmod(ir) - 1
      if ( mod ( n * k, rmod(ir) ) == 1 )
        break;
      end
    end
%
%  Multiply row IR by N.
%
    if ( 1 < n )
      for i = kir + 1 : ir * nrow
        mat(i) = mat(i) * n;
        imat(i) = imat(i) * n;
      end
    end
%
%  Subtract MAT(JR,IR) * row IR from each row JR
%
    for kjr = 0 : nrow : nrow * nrow - 1
      n = rmod(ir) - mat(kjr+ir);
      if ( ( kjr ~= kir ) && ( n ~= 0 ) )
        for i = 1 : nrow
          mat(kjr+i)  = mod (  mat(kjr+i) + n *  mat(kir+i), cmod(i) );
          imat(kjr+i) = mod ( imat(kjr+i) + n * imat(kir+i), cmod(i) );
        end
      end
    end

  end
%
%  Check inversion was possible - that result has
%  non-zero elements only on diagonal.
%
  ifault = 0;
%
%  If we encounter a zero diagonal element, then only a left inverse
%  will be formed.
%
  for n = 1 : nrow + 1 : nrow * nrow
    if ( mat(n) == 0 )
      ifault = -1;
    end
    mat(n) = - mat(n);
  end

  for n = 1 : nrow * nrow
    if ( 0 < mat(n) )
      ifault = 3;
      return
    end
  end

  for n = 1 : nrow + 1 : nrow * nrow
    mat(n) = - mat(n);
  end
%
%  Unsort the rows and columns back into their original order.
%
  [ mat, imat, rmod, cmod, rsort, csort ] = musort ( mat, imat, rmod, ...
    cmod, rsort, csort, nrow );

  return
end
