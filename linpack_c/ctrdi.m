function [ t, det, info ] = ctrdi ( t, ldt, n, job )

%*****************************************************************************80
%
%% CTRDI computes the determinant and inverse of a complex triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%  
%  Parameters:
%
%    Input, complex T(LDT,N), the triangular matrix.  The zero
%    elements of the matrix are not referenced, and the corresponding 
%    elements of the array can be used to store other information.
%
%    Input, integer LDT, the leading dimension of T.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB.
%    010, no determinant,    inverse, matrix is lower triangular.
%    011, no determinant,    inverse, matrix is upper triangular.
%    100,    determinant, no inverse.
%    110,    determinant,    inverse, matrix is lower triangular.
%    111,    determinant,    inverse, matrix is upper triangular.
%
%    Output, complex T(LDT,N), if an inverse was requested, then T has 
%    been overwritten by its inverse.
%
%    Output, complex DET(2), the determinant of the original matrix,
%    if requested.  Otherwise not referenced.  
%    Determinant = DET(1) * 10.0**DET(2) with 1.0 <= cabs1 ( DET(1) ) < 10.0
%    or DET(1) == 0.0.  Also, DET(2) is strictly real.
%
%    Output, integer INFO.
%    0, an inverse was requested and the matrix is nonsingular.
%    K, an inverse was requested, but the K-th diagonal element
%    of T is zero.
%
  det = [];
  info = 0;
  
  if ( floor ( job / 100 ) ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;

    for i = 1 : n

      det(1) = det(1) * t(i,i);

      if ( cabs1 ( det(1) ) == 0.0 )
        break
      end

      while ( cabs1 ( det(1) ) < 1.0 )
        det(1) = det(1) * 10.0;
        det(2) = det(2) - 1.0;
      end

      while ( 10.0 <= cabs1 ( det(1) ) )
        det(1) = det(1) / 10.0;
        det(2) = det(2) + 1.0;
      end

    end

  end
%
%  Compute inverse of upper triangular matrix.
%
  if ( mod ( floor ( job / 10 ), 10 ) ~= 0 )

    if ( mod ( job, 10 ) ~= 0 )

      info = 0;

      for k = 1 : n

        if ( cabs1 ( t(k,k) ) == 0.0 )
          info = k;
          break
        end

        t(k,k) = 1.0 / t(k,k);
        temp = -t(k,k);
        t(1:k-1,k) = t(1:k-1,k) * temp;

        for j = k+1 : n
          temp = t(k,j);
          t(k,j) = 0.0;
          t(1:k,j) = t(1:k,j) + temp * t(1:k,k);
        end
 
      end
%
%  Compute inverse of lower triangular matrix.
%
    else

      info = 0;

      for k = n : -1: 1

        if ( cabs1 ( t(k,k) ) == 0.0 )
          info = k;
          break
        end

        t(k,k) = 1.0 / t(k,k);

        if ( k ~= n )
          temp = -t(k,k);
          t(k+1:n,k) = t(k+1:n,k) * temp;
        end

        for j = 1 : k-1
          temp = t(k,j);
          t(k,j) = 0.0;
          t(k:n,j) = t(k:n,j) + temp * t(k:n,k);
        end

      end

    end

  end

  return
end
